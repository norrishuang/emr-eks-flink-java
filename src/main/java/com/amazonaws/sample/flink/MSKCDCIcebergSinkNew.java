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

                 
            InputStream inputStream_CreateTable = MSKCDCIcebergSinkNew.class.getClassLoader().getResourceAsStream("flink-on-eks-workshop-create-table.sql");
            String content_CreateTable = new String(inputStream_CreateTable.readAllBytes());

            InputStream inputStream_Insert = MSKCDCIcebergSinkNew.class.getClassLoader().getResourceAsStream("flink-on-eks-workshop-insert.sql");
            String content_Insert = new String(inputStream_Insert.readAllBytes());
                                                        
            StreamTableEnvironment streamTableEnvironment = StreamTableEnvironment.create(
                                                env, EnvironmentSettings.newInstance().build());

//            Configuration configuration = streamTableEnvironment.getConfig().getConfiguration();


            final String icebergCatalog = String.format("CREATE CATALOG glue_catalog WITH ( \n" +
                                                "'type'='iceberg', \n" +
                                                "'warehouse'='%s', \n" +
                                                "'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog', \n" +
                                                "'io-impl'='org.apache.iceberg.aws.s3.S3FileIO');", _warehousePath);

            LOG.info(icebergCatalog);
            streamTableEnvironment.executeSql(icebergCatalog);

            // craete database
            streamTableEnvironment.executeSql("CREATE DATABASE IF NOT EXISTS glue_catalog.icebergdb");

            // create table
            for (String sql : content_CreateTable.split(";")) {
                sql = sql.replace("{TOPICS}", _topics);
                sql = sql.replace("{KAFKA_BOOTSTRAP_SERVERS}", _kafkaBootstrapServers);
                sql = sql.trim();
                LOG.info(sql);
                streamTableEnvironment.executeSql(sql.trim());
            }

            StatementSet stmtSet = streamTableEnvironment.createStatementSet();
            for (String sql : content_Insert.split(";")) {
                if(sql.contains("INSERT")) {
                    stmtSet.addInsertSql(sql.trim());
                }
            }
            stmtSet.execute();
        }
    }
                                  
}
