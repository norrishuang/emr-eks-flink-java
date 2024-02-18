// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

package com.amazonaws.emr.flink;

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
import org.apache.flink.streaming.api.functions.sink.filesystem.StreamingFileSink;
import org.apache.flink.streaming.api.functions.sink.filesystem.bucketassigners.DateTimeBucketAssigner;
import org.apache.flink.streaming.api.windowing.assigners.TumblingProcessingTimeWindows;
import org.apache.flink.streaming.api.windowing.time.Time;
import org.apache.flink.streaming.connectors.kinesis.FlinkKinesisConsumer;
import org.apache.flink.streaming.connectors.kinesis.config.ConsumerConfigConstants;

import java.util.Properties;

public class S3StreamingParquetSinkJob {
    private static String _region = "us-east-1";
    private static String _inputStreamName = "ExampleInputStream";
    private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

    private static DataStream<String> createSourceFromStaticConfig(StreamExecutionEnvironment env) {
        Properties inputProperties = new Properties();
        inputProperties.setProperty(ConsumerConfigConstants.AWS_REGION, _region);
        inputProperties.setProperty(ConsumerConfigConstants.STREAM_INITIAL_POSITION, "LATEST");
        return env.addSource(new FlinkKinesisConsumer<>(_inputStreamName,
                new SimpleStringSchema(),
                inputProperties));
    }

    private static StreamingFileSink<CustomerCount> createS3SinkFromStaticConfig() {
        return StreamingFileSink
                .forBulkFormat(new Path(_s3SinkPath), AvroParquetWriters.forReflectRecord(CustomerCount.class))
                // Use hive style partitioning
                .withBucketAssigner(new DateTimeBucketAssigner<>("'year='yyyy'/month='MM'/day='dd'/hour='HH/"))
                .withOutputFileConfig(OutputFileConfig.builder()
                        .withPartSuffix(".parquet")
                        .build())
                .build();
    }

    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        _inputStreamName = args[0];
        _region = args[1];
        _s3SinkPath = args[2];

        DataStream<String> input = createSourceFromStaticConfig(env);

        ObjectMapper jsonParser = new ObjectMapper();

        input.map(value -> { // Parse the JSON
                    JsonNode jsonNode = jsonParser.readValue(value, JsonNode.class);
                    return new Tuple2<>(jsonNode.get("customerId").toString(), 1);
                }).returns(Types.TUPLE(Types.STRING, Types.INT))
                .keyBy(v -> v.f0) // Logically partition the stream for each word
                // .timeWindow(Time.minutes(1)) // Tumbling window definition // Flink 1.11
                .window(TumblingProcessingTimeWindows.of(Time.minutes(1))) // Flink 1.13
                .sum(1) // Count the appearances by ticker per partition
                .map(t -> new CustomerCount(t.f0, t.f1))
                .addSink(createS3SinkFromStaticConfig())
                .name("S3 Parquet Sink");

        env.execute("Flink S3 Streaming Sink Job");
    }
}
