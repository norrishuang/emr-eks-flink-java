package com.amazonaws.sample.flink;

import java.io.IOException;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.StatementSet;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.InputStream;



public class MSKCDCIcebergSinkNew {

    private static String _topics = "topic01";
    private static String _kafkaBootstrapServers = "b-1.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-2.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092,b-3.msk-cdc-demo.wzx9f.c2.kafka.us-east-1.amazonaws.com:9092";
        // private static String _s3SinkPath = "s3a://ka-app-code-<username>/data";

    private static String _warehousePath = "s3a://ka-app-code-<username>/warehouse";

    private static final Logger LOG = LoggerFactory.getLogger(MSKCDCIcebergSink.class);

    private static int _Parallelism = 3;

    // private static String _region = "us-east-1";

    private static String _bucketName = "";

    public static void main(String[] args) throws Exception {
                // set up the streaming execution environment

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        _kafkaBootstrapServers = args[0];
        _topics = args[1];
        _warehousePath = args[2];
        // _region = args[3];
        // _Parallelism = Integer.parseInt(args[4]);

        MSKCDCIcebergSinkNew.IcebergSink.createAndDeployJob(env);

    }

    public static class IcebergSink {

        public static void createAndDeployJob(StreamExecutionEnvironment env) throws IOException {

                 
            InputStream inputStream = MSKCDCIcebergSinkNew.class.getClassLoader().getResourceAsStream("table2.sql");
            String content = new String(inputStream.readAllBytes()); 
                                                        
                                                        
           
                StreamTableEnvironment streamTableEnvironment = StreamTableEnvironment.create(
                                                env, EnvironmentSettings.newInstance().build());

                Configuration configuration = streamTableEnvironment.getConfig().getConfiguration();

                configuration.setString("execution.checkpointing.interval", "1 min");
                // env.setParallelism(_Parallelism);

                StatementSet stmtSet = streamTableEnvironment.createStatementSet();

                final String icebergCatalog = String.format("CREATE CATALOG glue_catalog WITH ( \n" +
                                                "'type'='iceberg', \n" +
                                                "'warehouse'='%s', \n" +
                                                "'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog', \n" +
                                                "'io-impl'='org.apache.iceberg.aws.s3.S3FileIO');", _warehousePath);

                LOG.info(icebergCatalog);
                streamTableEnvironment.executeSql(icebergCatalog);
                for (String sql : content.split(";")) {
                        sql = sql.replace("{TOPICS}", _topics);
                        sql = sql.replace("{KAFKA_BOOTSTRAP_SERVERS}", _kafkaBootstrapServers);
                        LOG.info(sql);
                        if(sql.contains("INSERT")) {
                            stmtSet.addInsertSql(sql.trim());
                        } else {
                            streamTableEnvironment.executeSql(sql.trim());
                        }
                        
                }
                stmtSet.execute();
        }
    }
                                  
}
