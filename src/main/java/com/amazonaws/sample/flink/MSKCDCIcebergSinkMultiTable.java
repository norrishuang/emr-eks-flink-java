package com.amazonaws.sample.flink;

import org.apache.flink.api.java.DataSet;
import org.apache.flink.api.java.functions.KeySelector;
import org.apache.flink.api.java.operators.FilterOperator;
import org.apache.flink.api.java.operators.MapOperator;
import org.apache.flink.api.java.tuple.Tuple;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.api.java.utils.ParameterTool;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.datastream.KeyedStream;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kinesis.FlinkKinesisConsumer;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.StatementSet;
import org.apache.flink.table.api.Table;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.util.Collector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.amazonaws.sample.flink.cdc.InsertPraser;
import com.amazonaws.sample.flink.util.ChangeLogSchema;
import com.amazonaws.sample.flink.util.ChangeLogSource;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.iceberg.BaseTable;
import org.apache.iceberg.NullOrder;
import org.apache.iceberg.TableMetadata;
import org.apache.iceberg.TableOperations;
import org.apache.iceberg.avro.AvroSchemaUtil;
import org.apache.iceberg.catalog.Catalog;
import org.apache.iceberg.catalog.TableIdentifier;
import org.apache.iceberg.flink.*;
import org.apache.iceberg.flink.sink.AvroGenericRecordToRowDataMapper;
import org.apache.iceberg.flink.sink.FlinkSink;
import org.apache.iceberg.flink.util.FlinkCompatibilityUtil;
import org.eclipse.jetty.util.ajax.JSON;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.flink.api.common.functions.FilterFunction;
import org.apache.flink.api.common.functions.FlatMapFunction;
import org.apache.flink.api.common.functions.GroupCombineFunction;
import org.apache.flink.api.common.functions.ReduceFunction;



public class MSKCDCIcebergSinkMultiTable {

    private static String _topics = "topic01";
    private static String _kafkaBootstrapServers = "b-1.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-2.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-3.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092";
        // private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

    private static String _warehousePath = "s3a://ka-app-code-<username>/warehouse";

    private static final Logger LOG = LoggerFactory.getLogger(MSKCDCIcebergSink.class);

    // private static String _region = "us-east-1";

    public static void main(String[] args) throws Exception {
                // set up the streaming execution environment

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        _kafkaBootstrapServers = args[0];
        _topics = args[1];
        _warehousePath = args[2];
        // _region = args[3];
        // _Parallelism = Integer.parseInt(args[4]);

        MSKCDCIcebergSinkMultiTable.IcebergSink.createAndDeployJob(env);

    }

    public static class IcebergSink {

        private static KafkaSource<String> createKafkaSource(String boostStrapServer, String topics, String consumerGroup ) {
        return KafkaSource.<String>builder()
                .setBootstrapServers(boostStrapServer)
                .setTopics(topics)
                .setGroupId(consumerGroup)
                .setStartingOffsets(OffsetsInitializer.earliest()) // Used when the application starts with no state
                // .setValueOnlyDeserializer(new SimpleStringSchema())
                // .setProperties(getKafkaProperties(applicationProperties,"source."))
                .build();
        }


        // private static void createTable(Catalog catalog, TableIdentifier outputTable, org.apache.iceberg.Schema icebergSchema, PartitionSpec partitionSpec, String sortField) {
        //     //If table has been previously created, we do not do any operation or modification
        //     if (!catalog.tableExists(outputTable)) {
        //         Table icebergTable = catalog.createTable(outputTable, icebergSchema, partitionSpec);
        //         // Modifying newly created iceberg table to have a sort field
        //         icebergTable.replaceSortOrder()
        //                 .asc(sortField,NullOrder.NULLS_LAST)
        //                 .commit();
        //         // The catalog.create table creates an Iceberg V1 table. If we want to perform upserts, we need to upgrade the table version to 2.
        //         TableOperations tableOperations = ((BaseTable) icebergTable).operations();
        //         TableMetadata appendTableMetadata = tableOperations.current();
        //         tableOperations.commit(appendTableMetadata, appendTableMetadata.upgradeToFormatVersion(2));
        //     }
        // }



        @SuppressWarnings({ "rawtypes", "unchecked", "deprecation" })
        public static void createAndDeployJob(StreamExecutionEnvironment env) throws Exception {

                 
            // InputStream inputStream = MSKCDCIcebergSinkNew.class.getClassLoader().getResourceAsStream("table1.sql");
            // String content = new String(inputStream.readAllBytes()); 
                                                        
                                                        
            StreamTableEnvironment streamTableEnvironment = StreamTableEnvironment.create(
                                                env, EnvironmentSettings.newInstance().build());

            Configuration configuration = streamTableEnvironment.getConfig().getConfiguration();

            configuration.setString("execution.checkpointing.interval", "1 min");

            
            KafkaSource<String> source = createKafkaSource(_kafkaBootstrapServers,_topics,"group-01");
            DataStream<String> kafkaStream = env.fromSource(source, WatermarkStrategy.noWatermarks(), "Kafka source");


            Map<String, String> catalogProperties = new HashMap<>();
            catalogProperties.put("type", "iceberg");
            catalogProperties.put("io-impl", "org.apache.iceberg.aws.s3.S3FileIO");
            catalogProperties.put("warehouse", _warehousePath);
            catalogProperties.put("impl", "org.apache.iceberg.aws.glue.GlueCatalog");
            //Loading Glue Data Catalog
            CatalogLoader glueCatalogLoader = CatalogLoader.custom(
                    "glue",
                    catalogProperties,
                    new org.apache.hadoop.conf.Configuration(),
                    "org.apache.iceberg.aws.glue.GlueCatalog");
            
            Catalog catalog = glueCatalogLoader.loadCatalog();

            DataStream<ChangeLogSchema> parsedStream = kafkaStream
            .map(new MapFunction<String, ChangeLogSchema>() {
                public ChangeLogSchema map(String value) throws JsonMappingException, JsonProcessingException {
                return new ObjectMapper().readValue(value, ChangeLogSchema.class);
                }
            });

            
            DataSet<ChangeLogSchema> dataset = (DataSet<ChangeLogSchema>) streamTableEnvironment.fromDataStream(parsedStream);

            FilterOperator<ChangeLogSchema> insertDS = dataset.filter(new FilterFunction<ChangeLogSchema>() {
                public boolean filter(ChangeLogSchema value) {
                    return value.get_op().equals("r") || value.get_op().equals("c");
                }
            });

            FilterOperator<ChangeLogSchema> updateDS = dataset.filter(new FilterFunction<ChangeLogSchema>() {
                public boolean filter(ChangeLogSchema value) {
                    return value.get_op().equals("u");
                }
            });

            FilterOperator<ChangeLogSchema> deleteDS = dataset.filter(new FilterFunction<ChangeLogSchema>() {
                public boolean filter(ChangeLogSchema value) {
                    return value.get_op().equals("d");
                }
            });




            MapOperator<ChangeLogSchema, Tuple2<String, String>> insertDS_L2 = insertDS.map(new MapFunction<ChangeLogSchema, Tuple2<String,String>>() {
                public Tuple2<String,String> map(ChangeLogSchema value) throws JsonMappingException, JsonProcessingException {
                    InsertPraser insertPraser = new InsertPraser();
                    return insertPraser.parse(value);
                }
            });


           tabkekeyinsertDS_L2.groupBy(0).getKeys();

            

            


            
            // insertDS_L2.keyBy(0).map(new MapFunction<Tuple2<String,Iterable<String>>, String>() {
            //     public String map(Tuple2<String,Iterable<String>> value) {
            //         String db = value.f0.split("\\|")[0];
            //         String table = value.f0.split("\\|")[1];
            //         //create table
            //         LOG.info("db:" + db);
            //         LOG.info("table:" + table);
            //         for(String content : value.f1) {
            //             LOG.info("debug-dataline:" + content);
            //         }
            //     }
            // });

            
            // FlinkSink.forRowData(InsertDS_L2)
            // .table(content)
            // .sink();
            
            
        }
    }
                                  
}
