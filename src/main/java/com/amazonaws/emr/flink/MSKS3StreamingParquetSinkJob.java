// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

package com.amazonaws.emr.flink;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.api.common.typeinfo.Types;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.core.fs.Path;
import org.apache.flink.formats.parquet.avro.AvroParquetWriters;
import org.apache.flink.shaded.jackson2.com.fasterxml.jackson.databind.JsonNode;
import org.apache.flink.shaded.jackson2.com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.sink.filesystem.OutputFileConfig;
import org.apache.flink.streaming.api.functions.sink.filesystem.bucketassigners.DateTimeBucketAssigner;
import org.apache.flink.streaming.api.windowing.assigners.TumblingProcessingTimeWindows;
import org.apache.flink.streaming.api.windowing.time.Time;
import org.apache.flink.streaming.api.functions.sink.filesystem.StreamingFileSink;

import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;

import java.util.Properties;

/**
 * Consumer data from MSK Serverless to S3
 */
public class MSKS3StreamingParquetSinkJob {

    private static KafkaSource<String> createKafkaSource(Properties properties,
            String topics) {
        return KafkaSource.<String>builder()
                .setTopics(topics)
                .setStartingOffsets(OffsetsInitializer.earliest()) // Used when the application starts with no state
                .setValueOnlyDeserializer(new SimpleStringSchema())
                .setProperties(properties)
                .build();
    }

    private static StreamingFileSink<CustomerCount> createS3SinkFromStaticConfig(String s3SinkPath) {
        return StreamingFileSink
                .forBulkFormat(new Path(s3SinkPath), AvroParquetWriters.forReflectRecord(CustomerCount.class))
                // Use hive style partitioning
                .withBucketAssigner(new DateTimeBucketAssigner<>("'year='yyyy'/month='MM'/day='dd'/hour='HH/"))
                .withOutputFileConfig(OutputFileConfig.builder()
                        .withPartSuffix(".parquet")
                        .build())
                .build();
    }

    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        String mskBootstrapServers = args[0];
        String topics = args[1];
        String s3SinkPath = args[2];

        Properties properties = new Properties();
        properties.put("group.id", "consumer-group-01");
        properties.put("bootstrap.servers", mskBootstrapServers);

        // for msk serverless iam
        properties.put("kafka.security.protocol", "SASL_SSL");
        properties.put("kafka.sasl.jaas.config", "software.amazon.msk.auth.iam.IAMLoginModule required;");
        properties.put("kafka.sasl.client.callback.handler.class",
                "software.amazon.msk.auth.iam.IAMClientCallbackHandler");
        properties.put("kafka.sasl.mechanism", "AWS_MSK_IAM");

        KafkaSource<String> source = createKafkaSource(properties, topics);

        DataStream<String> input = env.fromSource(source, WatermarkStrategy.noWatermarks(), "Kafka source");

        ObjectMapper jsonParser = new ObjectMapper();

        input.map(value -> { // Parse the JSON
            JsonNode jsonNode = jsonParser.readValue(value, JsonNode.class);
            return new Tuple2<>(jsonNode.get("appId").toString(), 1);
        }).returns(Types.TUPLE(Types.STRING, Types.INT))
                .keyBy(v -> v.f0) // Logically partition the stream for each word
                // .timeWindow(Time.minutes(1)) // Tumbling window definition // Flink 1.11
                .window(TumblingProcessingTimeWindows.of(Time.minutes(1))) // Flink 1.13
                .sum(1) // Count the appearances by ticker per partition
                .map(t -> new CustomerCount(t.f0, t.f1))
                .addSink(createS3SinkFromStaticConfig(s3SinkPath))
                .name("S3 Parquet Sink");

        env.execute("Flink S3 Streaming Sink Job");
    }
}
