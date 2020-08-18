CREATE OR REPLACE VIEW `{PROJECT}.{DATASET}.snap_vw_profile`
OPTIONS (DESCRIPTION="[Dasa - Snap View] - View responsible to get the latest data from {DATASET}.profile")
AS
WITH profile_snapshot AS (
SELECT
  *,
  ROW_NUMBER() OVER (PARTITION BY id ORDER BY event_time DESC) AS id_rank
FROM `{PROJECT}.{DATASET}.profile`)
SELECT
  * EXCEPT (id_rank)
FROM profile_snapshot WHERE (id_rank = 1 AND operation_type <> 'DELETE') ORDER BY id