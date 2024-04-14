package com.amazonaws.sample.flink;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MSKCDCHudiSink {

        private static String _topics = "topic01";
        private static String _kafkaBootstrapServers = "b-1.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-2.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-3.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092";
        // private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

        private static String _warehousePath = "s3a://ka-app-code-<username>/warehouse";

        private static final Logger LOG = LoggerFactory.getLogger(MSKCDCIcebergSink.class);

        private static int _Parallelism = 3;

        public static void main(String[] args) throws Exception {
                // set up the streaming execution environment

                final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

                _kafkaBootstrapServers = args[0];
                _topics = args[1];
                _warehousePath = args[2];
                _Parallelism = Integer.parseInt(args[3]);

                MSKCDCHudiSink.HudiSink.createAndDeployJob(env);

        }

        public static class HudiSink {

                public static void createAndDeployJob(StreamExecutionEnvironment env) {
                        StreamTableEnvironment streamTableEnvironment = StreamTableEnvironment.create(
                                        env, EnvironmentSettings.newInstance().build());

                        Configuration configuration = streamTableEnvironment.getConfig().getConfiguration();

                        configuration.setString("execution.checkpointing.interval", "1 min");
                        env.setParallelism(_Parallelism);

                        // final String icebergCatalog = String.format("CREATE CATALOG glue_catalog WITH
                        // ( \n" +
                        // "'type'='iceberg', \n" +
                        // "'warehouse'='%s', \n" +
                        // "'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog', \n" +
                        // "'io-impl'='org.apache.iceberg.aws.s3.S3FileIO');", _warehousePath);

                        // LOG.info(icebergCatalog);
                        // streamTableEnvironment.executeSql(icebergCatalog);

                        // Source
                        final String sourceKafkaSQL = String.format("CREATE TABLE kafka_source_table (\n" +
                                        "id INT,\n" +
                                        "uuid STRING,\n" +
                                        "user_name STRING,\n" +
                                        "phone_number BIGINT,\n" +
                                        "product_id STRING,\n" +
                                        "product_name STRING,\n" +
                                        "product_type STRING,\n" +
                                        "manufacturing_date INT,\n" +
                                        "price FLOAT,\n" +
                                        "unit INT,\n" +
                                        "created_at STRING,\n" +
                                        "updated_at STRING,\n" +
                                        "PRIMARY KEY (id) NOT ENFORCED\n" +
                                        ") with (\n" +
                                        "'connector' = 'kafka',\n" +
                                        "'topic' = '%s',\n" +
                                        "'properties.bootstrap.servers' = '%s',\n" +
                                        "'scan.startup.mode' = 'earliest-offset', \n" +
                                        "'properties.group.id' = 'kafka_user_order_list_hudi_01',\n" +
                                        "'format' = 'debezium-json'\n" +
                                        ");", _topics, _kafkaBootstrapServers);
                        LOG.info(sourceKafkaSQL);
                        streamTableEnvironment.executeSql(sourceKafkaSQL);

                        final String s3SinkSql = String
                                        .format("CREATE TABLE IF NOT EXISTS user_order_list_flink_hudi (\n" +
                                                        "id INT,\n" +
                                                        "uuid STRING,\n" +
                                                        "user_name STRING,\n" +
                                                        "phone_number BIGINT,\n" +
                                                        "product_id STRING,\n" +
                                                        "product_name STRING,\n" +
                                                        "product_type STRING,\n" +
                                                        "manufacturing_date INT,\n" +
                                                        "price FLOAT,\n" +
                                                        "unit INT,\n" +
                                                        "created_at STRING,\n" +
                                                        "updated_at STRING,\n" +
                                                        "PRIMARY KEY (`id`) NOT Enforced \n" +
                                                        ") WITH (\n" +
                                                        "'connector' = 'hudi',\n" +
                                                        "'compaction.tasks'='1',\n" +
                                                        "'changelog.enabled'='true',\n" +
                                                        "'read.streaming.enabled' = 'true',\n" +
                                                        "'read.streaming.skip_compaction' = 'true',\n" +
                                                        "'write.task.max.size'='4096',\n" +
                                                        "'write.bucket_assign.tasks'='1',\n" +
                                                        "'compaction.delta_seconds'='120',\n" +
                                                        "'compaction.delta_commits'='2',\n" +
                                                        "'compaction.trigger.strategy'='num_or_time',\n" +
                                                        "'compaction.max_memory'='2048',\n" +
                                                        "'write.merge.max_memory'='1024',\n" +
                                                        "'write.tasks' = '1',\n" +
                                                        "'hive_sync.enable' = 'true',\n" +
                                                        "'hive_sync.db' = 'hudi',\n" +
                                                        "'hive_sync.table' = 'user_order_list_flink_hudi',\n" +
                                                        "'hive_sync.mode' = 'hms',\n" +
                                                        "'hive_sync.use_jdbc' = 'false',\n" +
                                                        "'path' = '%s/user_order_list_flink_hudi',\n" +
                                                        "'table.type' = 'MERGE_ON_READ');", _warehousePath);

                        streamTableEnvironment.executeSql(s3SinkSql);

                        final String Insert_Hudi = "INSERT INTO  " +
                                        "user_order_list_flink_hudi " +
                                        "SELECT * FROM kafka_source_table;";

                        streamTableEnvironment.executeSql(Insert_Hudi);

                }
        }

}
