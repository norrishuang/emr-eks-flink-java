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
'properties.group.id' = 'flink-workshop-group-01',
'format' = 'debezium-json'
);


CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest1 (
id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest2 (
id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest3 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest4 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest5 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest6 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest7 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest8 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest9 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest10 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest11 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest12 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest13 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest14 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest15 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest16 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest17 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest18 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest19 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest20 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest21 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest22 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest23 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest24 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest25 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest26 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest27 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest28 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest29 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest30 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest31 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest32 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest33 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest34 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest35 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest36 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest37 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest38 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest39 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest40 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest41 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest42 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest43 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest44 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest45 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest46 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest47 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest48 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest49 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest50 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest51 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest52 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest53 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest54 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest55 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest56 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest57 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest58 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest59 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest60 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest61 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest62 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest63 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest64 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest65 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest66 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest67 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest68 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest69 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest70 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest71 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest72 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest73 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest74 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest75 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest76 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest77 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest78 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest79 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest80 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest81 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest82 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest83 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest84 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest85 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest86 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest87 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest88 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest89 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest90 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest91 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest92 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest93 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest94 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest95 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest96 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest97 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest98 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest99 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest100 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'format-version'='2');

INSERT INTO glue_catalog.icebergdb.sbtest1 	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest1';
INSERT INTO glue_catalog.icebergdb.sbtest2	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest2';
INSERT INTO glue_catalog.icebergdb.sbtest3	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest3';
INSERT INTO glue_catalog.icebergdb.sbtest4	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest4';
INSERT INTO glue_catalog.icebergdb.sbtest5	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest5';
INSERT INTO glue_catalog.icebergdb.sbtest6	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest6';
INSERT INTO glue_catalog.icebergdb.sbtest7	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest7';
INSERT INTO glue_catalog.icebergdb.sbtest8	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest8';
INSERT INTO glue_catalog.icebergdb.sbtest9	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest9';
INSERT INTO glue_catalog.icebergdb.sbtest10	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest10';
INSERT INTO glue_catalog.icebergdb.sbtest11	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest11';
INSERT INTO glue_catalog.icebergdb.sbtest12	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest12';
INSERT INTO glue_catalog.icebergdb.sbtest13	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest13';
INSERT INTO glue_catalog.icebergdb.sbtest14	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest14';
INSERT INTO glue_catalog.icebergdb.sbtest15	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest15';
INSERT INTO glue_catalog.icebergdb.sbtest16	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest16';
INSERT INTO glue_catalog.icebergdb.sbtest17	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest17';
INSERT INTO glue_catalog.icebergdb.sbtest18	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest18';
INSERT INTO glue_catalog.icebergdb.sbtest19	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest19';
INSERT INTO glue_catalog.icebergdb.sbtest20	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest20';
INSERT INTO glue_catalog.icebergdb.sbtest21	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest21';
INSERT INTO glue_catalog.icebergdb.sbtest22	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest22';
INSERT INTO glue_catalog.icebergdb.sbtest23	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest23';
INSERT INTO glue_catalog.icebergdb.sbtest24	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest24';
INSERT INTO glue_catalog.icebergdb.sbtest25	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest25';
INSERT INTO glue_catalog.icebergdb.sbtest26	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest26';
INSERT INTO glue_catalog.icebergdb.sbtest27	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest27';
INSERT INTO glue_catalog.icebergdb.sbtest28	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest28';
INSERT INTO glue_catalog.icebergdb.sbtest29	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest29';
INSERT INTO glue_catalog.icebergdb.sbtest30	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest30';
INSERT INTO glue_catalog.icebergdb.sbtest31	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest31';
INSERT INTO glue_catalog.icebergdb.sbtest32	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest32';
INSERT INTO glue_catalog.icebergdb.sbtest33	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest33';
INSERT INTO glue_catalog.icebergdb.sbtest34	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest34';
INSERT INTO glue_catalog.icebergdb.sbtest35	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest35';
INSERT INTO glue_catalog.icebergdb.sbtest36	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest36';
INSERT INTO glue_catalog.icebergdb.sbtest37	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest37';
INSERT INTO glue_catalog.icebergdb.sbtest38	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest38';
INSERT INTO glue_catalog.icebergdb.sbtest39	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest39';
INSERT INTO glue_catalog.icebergdb.sbtest40	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest40';
INSERT INTO glue_catalog.icebergdb.sbtest41	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest41';
INSERT INTO glue_catalog.icebergdb.sbtest42	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest42';
INSERT INTO glue_catalog.icebergdb.sbtest43	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest43';
INSERT INTO glue_catalog.icebergdb.sbtest44	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest44';
INSERT INTO glue_catalog.icebergdb.sbtest45	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest45';
INSERT INTO glue_catalog.icebergdb.sbtest46	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest46';
INSERT INTO glue_catalog.icebergdb.sbtest47	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest47';
INSERT INTO glue_catalog.icebergdb.sbtest48	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest48';
INSERT INTO glue_catalog.icebergdb.sbtest49	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest49';
INSERT INTO glue_catalog.icebergdb.sbtest50	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest50';
INSERT INTO glue_catalog.icebergdb.sbtest51	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest51';
INSERT INTO glue_catalog.icebergdb.sbtest52	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest52';
INSERT INTO glue_catalog.icebergdb.sbtest53	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest53';
INSERT INTO glue_catalog.icebergdb.sbtest54	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest54';
INSERT INTO glue_catalog.icebergdb.sbtest55	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest55';
INSERT INTO glue_catalog.icebergdb.sbtest56	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest56';
INSERT INTO glue_catalog.icebergdb.sbtest57	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest57';
INSERT INTO glue_catalog.icebergdb.sbtest58	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest58';
INSERT INTO glue_catalog.icebergdb.sbtest59	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest59';
INSERT INTO glue_catalog.icebergdb.sbtest60	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest60';
INSERT INTO glue_catalog.icebergdb.sbtest61	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest61';
INSERT INTO glue_catalog.icebergdb.sbtest62	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest62';
INSERT INTO glue_catalog.icebergdb.sbtest63	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest63';
INSERT INTO glue_catalog.icebergdb.sbtest64	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest64';
INSERT INTO glue_catalog.icebergdb.sbtest65	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest65';
INSERT INTO glue_catalog.icebergdb.sbtest66	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest66';
INSERT INTO glue_catalog.icebergdb.sbtest67	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest67';
INSERT INTO glue_catalog.icebergdb.sbtest68	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest68';
INSERT INTO glue_catalog.icebergdb.sbtest69	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest69';
INSERT INTO glue_catalog.icebergdb.sbtest70	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest70';
INSERT INTO glue_catalog.icebergdb.sbtest71	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest71';
INSERT INTO glue_catalog.icebergdb.sbtest72	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest72';
INSERT INTO glue_catalog.icebergdb.sbtest73	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest73';
INSERT INTO glue_catalog.icebergdb.sbtest74	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest74';
INSERT INTO glue_catalog.icebergdb.sbtest75	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest75';
INSERT INTO glue_catalog.icebergdb.sbtest76	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest76';
INSERT INTO glue_catalog.icebergdb.sbtest77	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest77';
INSERT INTO glue_catalog.icebergdb.sbtest78	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest78';
INSERT INTO glue_catalog.icebergdb.sbtest79	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest79';
INSERT INTO glue_catalog.icebergdb.sbtest80	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest80';
INSERT INTO glue_catalog.icebergdb.sbtest81	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest81';
INSERT INTO glue_catalog.icebergdb.sbtest82	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest82';
INSERT INTO glue_catalog.icebergdb.sbtest83	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest83';
INSERT INTO glue_catalog.icebergdb.sbtest84	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest84';
INSERT INTO glue_catalog.icebergdb.sbtest85	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest85';
INSERT INTO glue_catalog.icebergdb.sbtest86	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest86';
INSERT INTO glue_catalog.icebergdb.sbtest87	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest87';
INSERT INTO glue_catalog.icebergdb.sbtest88	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest88';
INSERT INTO glue_catalog.icebergdb.sbtest89	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest89';
INSERT INTO glue_catalog.icebergdb.sbtest90	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest90';
INSERT INTO glue_catalog.icebergdb.sbtest91	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest91';
INSERT INTO glue_catalog.icebergdb.sbtest92	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest92';
INSERT INTO glue_catalog.icebergdb.sbtest93	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest93';
INSERT INTO glue_catalog.icebergdb.sbtest94	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest94';
INSERT INTO glue_catalog.icebergdb.sbtest95	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest95';
INSERT INTO glue_catalog.icebergdb.sbtest96	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest96';
INSERT INTO glue_catalog.icebergdb.sbtest97	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest97';
INSERT INTO glue_catalog.icebergdb.sbtest98	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest98';
INSERT INTO glue_catalog.icebergdb.sbtest99	SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest99';
INSERT INTO glue_catalog.icebergdb.sbtest100 SELECT id , k , c , pad FROM kafka_source_table where origin_database = 'sbtest' and origin_table ='sbtest100';