package com.amazonaws.emr.flink;

import org.apache.flink.api.java.utils.ParameterTool;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.Properties;

public class TickAggregation {

    private static String _region = "us-east-1";
    private static String _inputStreamName = "ExampleInputStream";
    private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

    private static final Logger LOG = LoggerFactory.getLogger(TickAggregation.class);

    public static void main(String[] args) throws Exception {
        // set up the streaming execution environment

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
//        final ParameterTool parameter = ParameterTool.fromArgs(args);

        _inputStreamName = args[0];
        _region = args[1];
        _s3SinkPath = args[2];

        TickAggregationSql.createAndDeployJob(env);

    }

    public static class TickAggregationSql {

        public static void createAndDeployJob(StreamExecutionEnvironment env)  {
            StreamTableEnvironment streamTableEnvironment = StreamTableEnvironment.create(
                    env, EnvironmentSettings.newInstance().build());

            Configuration configuration = streamTableEnvironment.getConfig().getConfiguration();
            configuration.setString("execution.checkpointing.interval", "1 min");

            /*
            {
                "customerId": "{{random.number(50)}}",
                "transactionAmount": {{random.number(
                    {
                        "min":10,
                        "max":150
                    }
                )}},
                "sourceIp" : "{{internet.ip}}",
                "status": "{{random.weightedArrayElement({
                    "weights" : [0.8,0.1,0.1],
                    "data": ["OK","FAIL","PENDING"]
                    }
                )}}",
               "transactionTime": "{{date.now}}"
            }
             */


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
                    "  'scan.stream.initpos' = 'LATEST',\n" +
                    "  'format' = 'json'\n" +
                    ");", _inputStreamName, _region);
            streamTableEnvironment.executeSql(sourceSQL);

            final String s3SinkSql = String.format("CREATE TABLE s3_sink_agg_1min (\n" +
                    "  AGG_DT TIMESTAMP(3),\n" +
                    "  P_YEAR BIGINT,\n" +
                    "  P_MONTH BIGINT,\n" +
                    "  P_DAY BIGINT,\n" +
                    "  CUSTOMERID INT,\n" +
                    "  TRANSACTIONAMOUNT INT," +
                    "  CUSTOMER_COUNT BIGINT\n" +
                    ") PARTITIONED BY (`P_YEAR`, `P_MONTH`, `P_DAY`) WITH (\n" +
                    "  'connector' = 'filesystem',\n" +
                    "  'path' = '%s', \n" +
                    "  'format' = 'parquet'," +
                    "  'sink.partition-commit.delay' = '1 h',\n" +
                    "  'sink.partition-commit.policy.kind' = 'success-file' \n" +
                    ");", _s3SinkPath);

            streamTableEnvironment.executeSql(s3SinkSql);

            final String aggSQL = "INSERT INTO s3_sink_agg_1min " +
                    "SELECT " +
                    "   TUMBLE_START(transactionTime, INTERVAL '1' MINUTE)," +
                    "   EXTRACT(YEAR FROM transactionTime), " +
                    "   EXTRACT(MONTH FROM transactionTime), " +
                    "   EXTRACT(DAY FROM transactionTime), " +
                    "   customerId, " +
                    "   SUM(transactionAmount), " +
                    "   COUNT(*) " +
                    "FROM kinesis_stream \n" +
                    "GROUP BY \n" +
                    "customerId,EXTRACT(YEAR FROM transactionTime),EXTRACT(MONTH FROM transactionTime),EXTRACT(DAY FROM transactionTime),TUMBLE(transactionTime, INTERVAL '1' MINUTE);";

            streamTableEnvironment.executeSql(aggSQL);

//            final String insertSql = "insert into default_catalog.default_database.customer_info_flinksql \n" +
//                    "select * from default_catalog.default_database.customer_info";
//            streamTableEnvironment.executeSql(insertSql);
        }
    }

}
