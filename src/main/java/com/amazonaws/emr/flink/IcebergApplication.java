package com.amazonaws.emr.flink;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IcebergApplication {

    private static String _region = "us-east-1";
    private static String _inputStreamName = "ExampleInputStream";
//    private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

    private static String _warehousePath = "s3a://ka-app-code-<username>/warehouse";

    private static final Logger LOG = LoggerFactory.getLogger(IcebergApplication.class);

    public static void main(String[] args) throws Exception {
        // set up the streaming execution environment

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        _inputStreamName = args[0];
        _region = args[1];
        _warehousePath = args[2];

        IcebergSink.createAndDeployJob(env);

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
            final String sourceSQL = String.format("CREATE TABLE kinesis_stream (\n" +
                    "  customerId INT, \n" +
                    "  transactionAmount INT,\n" +
                    "  sourceIp STRING,\n" +
                    "  status STRING,\n" +
                    "  transactionTime TIMESTAMP(3),\n" +
                    "  WATERMARK FOR transactionTime AS transactionTime - INTERVAL '5' SECOND \n" +
                    ") WITH (\n" +
                    "  'connector' = 'kinesis',\n" +
                    "  'stream' = '%s',\n" +
                    "  'aws.region' = '%s',\n" +
                    "  'json.timestamp-format.standard' = 'ISO-8601',\n" +
                    "  'scan.stream.initpos' = 'LATEST',\n" +
                    "  'format' = 'json'\n" +
                    ");", _inputStreamName, _region);
            streamTableEnvironment.executeSql(sourceSQL);


            final String s3SinkSql = String.format("CREATE TABLE glue_catalog.iceberg_db.s3_sink_agg_5min (\n" +
                    "  agg_dt TIMESTAMP(3),\n" +
                    "  `year` BIGINT,\n" +
                    "  `month` BIGINT,\n" +
                    "  `day` BIGINT,\n" +
                    "  customerId BIGINT,\n" +
                    "  transactionAmount INT,\n" +
                    "  customer_count BIGINT\n" +
                    ") PARTITIONED BY (`year`, `month`, `day`) WITH (\n" +
                    "'type'='iceberg', \n" +
                    "'warehouse'='%s', \n" +
                    "'catalog-name'='glue_catalog', \n" +
                    "'write.metadata.delete-after-commit.enabled'='true', \n" +
                    "'write.metadata.previous-versions-max'='5', \n" +
                    "'format-version'='2');", _warehousePath);

            streamTableEnvironment.executeSql(s3SinkSql);

            final String aggSQL_Iceberg = "INSERT INTO  " +
                    "glue_catalog.iceberg_db.s3_sink_agg_5min /*+ OPTIONS('upsert-enabled'='true') " +
                    "SELECT TUMBLE_START(transactionTime, INTERVAL '5' MINUTE)," +
                    "EXTRACT(YEAR FROM transactionTime)," +
                    "EXTRACT(MONTH FROM transactionTime), " +
                    "EXTRACT(DAY FROM transactionTime), " +
                    "customerId, " +
                    "SUM(transactionAmount), " +
                    "COUNT(*) " +
                    "FROM kinesis_stream /*+ OPTIONS('streaming'='true','monitor-interval'='10s') */" +
                    "GROUP BY " +
                    "customerId," +
                    "EXTRACT(YEAR FROM transactionTime)," +
                    "EXTRACT(MONTH FROM transactionTime)," +
                    "EXTRACT(DAY FROM transactionTime)," +
                    "TUMBLE(transactionTime, INTERVAL '5' MINUTE);";



            streamTableEnvironment.executeSql(aggSQL_Iceberg);
            // 创建一个用于Upsert的统计结果表

        }
    }

}
