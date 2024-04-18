CREATE TABLE kafka_tb_user_order_list_01 (id INT,
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
'properties.group.id' = 'group_20240417_01',
'format' = 'debezium-json'
);
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.tb_user_order_list_01_flink (
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

INSERT INTO glue_catalog.icebergdb.tb_user_order_list_01_flink SELECT * FROM kafka_tb_user_order_list_01;


CREATE TABLE kafka_tb_user_order_list_02 (id INT,
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
'properties.group.id' = 'group_20240417_02',
'format' = 'debezium-json'
);
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.tb_user_order_list_02_flink (
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

INSERT INTO glue_catalog.icebergdb.tb_user_order_list_02_flink SELECT * FROM kafka_tb_user_order_list_02;