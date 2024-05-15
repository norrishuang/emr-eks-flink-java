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
'write.distribution-mode'='hash',
'format-version'='2');

CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest2 (
                                                              id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');

CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest3 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest4 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest5 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest6 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest7 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest8 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest9 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest10 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest11 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest12 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest13 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest14 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest15 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest16 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest17 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest18 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest19 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest20 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest21 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest22 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest23 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest24 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest25 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest26 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest27 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest28 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest29 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest30 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest31 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest32 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest33 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest34 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest35 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest36 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest37 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest38 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest39 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest40 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest41 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest42 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest43 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest44 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest45 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest46 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest47 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest48 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest49 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest50 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest51 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest52 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest53 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest54 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest55 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest56 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest57 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest58 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest59 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest60 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest61 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest62 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest63 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest64 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest65 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest66 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest67 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest68 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest69 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest70 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest71 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest72 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest73 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest74 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest75 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest76 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest77 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest78 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest79 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest80 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest81 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest82 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest83 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest84 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest85 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest86 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest87 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest88 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest89 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest90 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest91 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest92 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest93 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest94 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest95 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest96 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest97 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest98 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest99 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');
CREATE TABLE IF NOT EXISTS glue_catalog.icebergdb.sbtest100 (id INT,k INT,c STRING,pad STRING) WITH (
'type'='iceberg',
'catalog-name'='glue_catalog',
'write.metadata.delete-after-commit.enabled'='true',
'write.metadata.previous-versions-max'='5',
'write.distribution-mode'='hash',
'format-version'='2');