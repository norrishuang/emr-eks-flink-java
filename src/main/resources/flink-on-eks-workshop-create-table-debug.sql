CREATE TABLE kafka_source_table (
origin_ts TIMESTAMP(3) METADATA FROM 'value.ingestion-timestamp' VIRTUAL,
event_time TIMESTAMP(3) METADATA FROM 'value.source.timestamp' VIRTUAL,
origin_database STRING METADATA FROM 'value.source.database' VIRTUAL,
origin_schema STRING METADATA FROM 'value.source.schema' VIRTUAL,
origin_table STRING METADATA FROM 'value.source.table' VIRTUAL,
origin_properties MAP<STRING, STRING> METADATA FROM 'value.source.properties' VIRTUAL,
id INT,
k INT,
c STRING,
pad STRING,
PRIMARY KEY (id) NOT ENFORCED
) with (
'connector' = 'kafka',
'topic' = '{TOPICS}',
'properties.bootstrap.servers' = '{KAFKA_BOOTSTRAP_SERVERS}',
'scan.startup.mode' = 'earliest-offset',
'properties.group.id' = 'flink-workshop-group-test-tb1',
'format' = 'debezium-json'
);

CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest1 (
id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.sbtest1 SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest1';