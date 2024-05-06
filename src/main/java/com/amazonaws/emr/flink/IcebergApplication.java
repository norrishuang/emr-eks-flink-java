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
                    "'warehouse'='s3://emr-hive-us-east-1-812046859005/warehouse/', \n" +
                    "'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog', \n" +
                    "'io-impl'='org.apache.iceberg.aws.s3.S3FileIO');", _warehousePath);
            LOG.info(icebergCatalog);
            System.out.println(icebergCatalog);
            streamTableEnvironment.executeSql(icebergCatalog);

            // Source
            final String sourceSQL = "CREATE TABLE default_catalog.default_database.user_order_list\n" + //
                                "            (\n" + //
                                "                id BIGINT,\n" + //
                                "                uuid STRING,\n" + //
                                "                user_name STRING,\n" + //
                                "                province STRING,\n" + //
                                "                phone_number BIGINT,\n" + //
                                "                product_id BIGINT,\n" + //
                                "                product_name STRING,\n" + //
                                "                product_type STRING,\n" + //
                                "                manufacturing_date BIGINT,\n" + //
                                "                price FLOAT,\n" + //
                                "                unit BIGINT,\n" + //
                                "                created_at TIMESTAMP_LTZ(3),\n" + //
                                "                updated_at TIMESTAMP_LTZ(3),\n" + //
                                "                PRIMARY KEY (id) NOT ENFORCED\n" + //
                                "            ) WITH (\n" + //
                                "                'connector' = 'mysql-cdc',\n" + //
                                "                'hostname' = 'mysql-cdc-db.cghfgy0zyjlk.us-east-1.rds.amazonaws.com',\n" + //
                                "                'port' = '3306',\n" + //
                                "                'username' = 'admin',\n" + //
                                "                'password' = 'Amazon123',\n" + //
                                "                'database-name' = 'norrisdb',\n" + //
                                "                'table-name' = 'user_order_list'\n" + //
                                "            );";
            streamTableEnvironment.executeSql(sourceSQL);


            final String s3SinkSql = "CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.user_order_list_flink_20240429_01(\n" + //
                                "    id BIGINT,\n" + //
                                "    uuid STRING,\n" + //
                                "    user_name STRING,\n" + //
                                "    province STRING,\n" + //
                                "    phone_number BIGINT,\n" + //
                                "    product_id BIGINT,\n" + //
                                "    product_name STRING,\n" + //
                                "    product_type STRING,\n" + //
                                "    manufacturing_date BIGINT,\n" + //
                                "    price FLOAT,\n" + //
                                "    unit BIGINT,\n" + //
                                "    created_at TIMESTAMP_LTZ(3),\n" + //
                                "    updated_at TIMESTAMP_LTZ(3),\n" + //
                                "    PRIMARY KEY (id) NOT ENFORCED )\n" + //
                                "with(\n" + //
                                "    'type'='iceberg',\n" + //
                                "    'write.metadata.delete-after-commit.enabled'='true',\n" + //
                                "    'write.metadata.previous-versions-max'='5',\n" + //
                                "    'warehouse'='s3://myemr-bucket-01/data/iceberg-folder/',\n" + //
                                "    'format-version'='2');";
            System.out.println(s3SinkSql);
            streamTableEnvironment.executeSql(s3SinkSql);
            

            final String aggSQL_Iceberg = "insert into glue_catalog.icebergdb.user_order_list_flink_20240429\n" + //
                                "select * from default_catalog.default_database.user_order_list;";

            streamTableEnvironment.executeSql(aggSQL_Iceberg);

        }
    }

}
