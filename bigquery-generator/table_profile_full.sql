CREATE TABLE IF NOT EXISTS `{PROJECT}.{DATASET}.profile_full`
(
  id INT64 NOT NULL,
  username STRING,
  name STRING,
  sex STRING,
  address STRING,
  mail STRING,
  birthdate DATE
)
OPTIONS (
  DESCRIPTION="[DASA - Test Table] - Table containing test data to validate StreamSets pipeline"
)