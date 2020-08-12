CREATE TABLE IF NOT EXISTS `{PROJECT}.{DATASET}.purchase`
(
  id INT64 NOT NULL,
  id_profile INT64,
  value INT64,
  dt DATE,
  operation_type STRING,
  ingestion_time TIMESTAMP,
  event_time TIMESTAMP
)
PARTITION BY DATE(event_time)
OPTIONS (
  require_partition_filter=false,
  DESCRIPTION="[DASA - Test Table] - Table containing test data to validate StreamSets pipeline"
)