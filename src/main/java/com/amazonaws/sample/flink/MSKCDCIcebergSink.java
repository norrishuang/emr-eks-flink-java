package com.amazonaws.sample.flink;

import com.amazonaws.emr.flink.IcebergApplication;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MSKCDCIcebergSink {

    private static String _topics = "topic01";
    private static String _kafkaBootstrapServers = "b-1.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-2.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-3.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092";= "ExampleInputStream";
//    private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

    private static String _warehousePath = "s3a://ka-app-code-<username>/warehouse";

    private static final Logger LOG = LoggerFactory.getLogger(MSKCDCIcebergSink.class);

    public static void main(String[] args) throws Exception {
        // set up the streaming execution environment

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        _kafkaBootstrapServers = args[0];
        _topics = args[1];
        _warehousePath = args[2];

        MSKCDCIcebergSink.IcebergSink.createAndDeployJob(env);

    }

    public static class IcebergSink {

        public static void createAndDeployJob(StreamExecutionEnvironment env)  {
            StreamTableEnvironment streamTableEnvironment = StreamTableEnvironment.create(
                    env, EnvironmentSettings.newInstance().build());

            Configuration configuration = streamTableEnvironment.getConfig().getConfiguration();
            configuration.setString("execution.checkpointing.interval", "1 min");
            final String icebergCatalog = String.format("CREATE CATALOG glue_catalog WITH ( \n" +
                    "'type'='iceberg', \n" +
                    "'warehouse'='%s', \n" +
                    "'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog', \n" +
                    "'io-impl'='org.apache.iceberg.aws.s3.S3FileIO');", _warehousePath);
            LOG.info(icebergCatalog);
            streamTableEnvironment.executeSql(icebergCatalog);

            // Source
            final String sourceKafkaSQL = String.format("CREATE TABLE kafka_pg_portfolio_json (\n" +
                    "id INT,\n" +
                    "uuid INT,\n" +
                    "user_name STRING,\n" +
                    "phone_number LONG,\n" +
                    "product_id STRING,\n" +
                    "product_name STRING,\n" +
                    "product_type STRING,\n" +
                    "manufacturing_date INT,\n" +
                    "price FLOAT,\n" +
                    "unit INT,\n" +
                    "created_at TIMESTAMP,\n" +
                    "updated_at TIMESTAMP,\n" +
                    "PRIMARY KEY (id) NOT ENFORCED\n" +
                    ") with (\n" +
                    "'connector' = 'kafka',\n" +
                    "'topic' = '%s',\n" +
                    "'properties.bootstrap.servers' = '%s',\n" +
                    "'properties.group.id' = 'kafka_portfolio_pg_json_gid_001',\n" +
                    "'format' = 'changelog-json'\n" +
                    ");\n;", _topics, _kafkaBootstrapServers);

            streamTableEnvironment.executeSql(sourceKafkaSQL);


            final String s3SinkSql = String.format("CREATE TABLE kafka_pg_portfolio_json (\n" +
                    "id INT,\n" +
                    "uuid INT,\n" +
                    "user_name STRING,\n" +
                    "phone_number LONG,\n" +
                    "product_id STRING,\n" +
                    "product_name STRING,\n" +
                    "product_type STRING,\n" +
                    "manufacturing_date INT,\n" +
                    "price FLOAT,\n" +
                    "unit INT,\n" +
                    "created_at TIMESTAMP,\n" +
                    "updated_at TIMESTAMP,\n" +
                    ") WITH (\n" +
                    "'type'='iceberg', \n" +
                    "'catalog-name'='glue_catalog', \n" +
                    "'write.metadata.delete-after-commit.enabled'='true', \n" +
                    "'write.metadata.previous-versions-max'='5', \n" +
                    "'format-version'='2');", _warehousePath);

            streamTableEnvironment.executeSql(s3SinkSql);

            final String Insert_Iceberg = "INSERT INTO  " +
                    "glue_catalog.iceberg_db.s3_sink_agg_5min /*+ OPTIONS('upsert-enabled'='true') " +
                    "SELECT * FROM kafka_pg_portfolio_json;";



            streamTableEnvironment.executeSql(Insert_Iceberg);

        }
    }


}
