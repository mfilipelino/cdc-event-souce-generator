CREATE TABLE IF NOT EXISTS `{PROJECT}.{DATASET}.profile`
(
  id INT64 NOT NULL,
  username STRING,
  name STRING,
  sex STRING,
  address STRING,
  mail STRING,
  birthdate DATE,
  operation_type STRING,
  ingestion_time TIMESTAMP,
  event_time TIMESTAMP
)
PARTITION BY DATE(event_time)
OPTIONS (
  require_partition_filter=false,
  DESCRIPTION="[DASA - Test Table] - Table containing test data to validate StreamSets pipeline"
)