CREATE TABLE IF NOT EXISTS `{PROJECT}.{DATASET}.purchase_full`
(
  id INT64 NOT NULL,
  id_profile INT64,
  value INT64,
  dt DATE
)
OPTIONS (
  DESCRIPTION="[DASA - Test Table] - Table containing test data to validate StreamSets pipeline"
)