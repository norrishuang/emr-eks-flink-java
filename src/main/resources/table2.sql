CREATE TABLE kafka_source_table (
origin_ts TIMESTAMP(3) METADATA FROM 'value.ingestion-timestamp' VIRTUAL,
event_time TIMESTAMP(3) METADATA FROM 'value.source.timestamp' VIRTUAL,
origin_database STRING METADATA FROM 'value.source.database' VIRTUAL,
origin_schema STRING METADATA FROM 'value.source.schema' VIRTUAL,
origin_table STRING METADATA FROM 'value.source.table' VIRTUAL,
origin_properties MAP<STRING, STRING> METADATA FROM 'value.source.properties' VIRTUAL,
id INT,
uuid STRING,
user_name STRING,
phone_number BIGINT,
product_id STRING,
product_name STRING,
product_type STRING,
manufacturing_date INT,
price FLOAT,
unit INT,
created_at STRING,
updated_at STRING,
PRIMARY KEY (id) NOT ENFORCED
) with (
'connector' = 'kafka',
'topic' = '{TOPICS}',
'properties.bootstrap.servers' = '{KAFKA_BOOTSTRAP_SERVERS}',
'scan.startup.mode' = 'earliest-offset',
'properties.group.id' = 'group_user_order_list_iceberg_S1_02',
'format' = 'debezium-json'
);


CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.user_order_list_flink_iceberg_01 (
id INT,
uuid STRING,
user_name STRING,
phone_number BIGINT,
product_id STRING,
product_name STRING,
product_type STRING,
manufacturing_date INT,
price FLOAT,
unit INT,
created_at STRING,
updated_at STRING
) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.user_order_list_flink_iceberg_01 
SELECT 
id ,
uuid ,
user_name ,
phone_number ,
product_id ,
product_name ,
product_type ,
manufacturing_date ,
price ,
unit ,
created_at ,
updated_at 
FROM kafka_source_table where origin_table = 'tb_user_order_list_01';


CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.user_order_list_flink_iceberg_02 (
id INT,
uuid STRING,
user_name STRING,
phone_number BIGINT,
product_id STRING,
product_name STRING,
product_type STRING,
manufacturing_date INT,
price FLOAT,
unit INT,
created_at STRING,
updated_at STRING
) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.user_order_list_flink_iceberg_02 
SELECT 
id ,
uuid ,
user_name ,
phone_number ,
product_id ,
product_name ,
product_type ,
manufacturing_date ,
price ,
unit ,
created_at ,
updated_at 
FROM kafka_source_table where origin_table = 'tb_user_order_list_02';

CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.user_order_list_flink_iceberg_03 (
id INT,
uuid STRING,
user_name STRING,
phone_number BIGINT,
product_id STRING,
product_name STRING,
product_type STRING,
manufacturing_date INT,
price FLOAT,
unit INT,
created_at STRING,
updated_at STRING
) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.user_order_list_flink_iceberg_03 
SELECT 
id ,
uuid ,
user_name ,
phone_number ,
product_id ,
product_name ,
product_type ,
manufacturing_date ,
price ,
unit ,
created_at ,
updated_at 
FROM kafka_source_table where origin_table = 'tb_user_order_list_03';



CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.user_order_list_flink_iceberg_04 (
id INT,
uuid STRING,
user_name STRING,
phone_number BIGINT,
product_id STRING,
product_name STRING,
product_type STRING,
manufacturing_date INT,
price FLOAT,
unit INT,
created_at STRING,
updated_at STRING
) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.user_order_list_flink_iceberg_04 
SELECT 
id ,
uuid ,
user_name ,
phone_number ,
product_id ,
product_name ,
product_type ,
manufacturing_date ,
price ,
unit ,
created_at ,
updated_at 
FROM kafka_source_table where origin_table = 'tb_user_order_list_04';



CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.user_order_list_flink_iceberg_05 (
id INT,
uuid STRING,
user_name STRING,
phone_number BIGINT,
product_id STRING,
product_name STRING,
product_type STRING,
manufacturing_date INT,
price FLOAT,
unit INT,
created_at STRING,
updated_at STRING
) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.user_order_list_flink_iceberg_05 
SELECT 
id ,
uuid ,
user_name ,
phone_number ,
product_id ,
product_name ,
product_type ,
manufacturing_date ,
price ,
unit ,
created_at ,
updated_at 
FROM kafka_source_table where origin_table = 'tb_user_order_list_05';