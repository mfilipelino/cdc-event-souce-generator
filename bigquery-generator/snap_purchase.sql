CREATE OR REPLACE VIEW `{PROJECT}.{DATASET}.snap_vw_purchase`
OPTIONS (DESCRIPTION="[Dasa - Snap View] - View responsible to get the latest data from {DATASET}.purchase")
AS
WITH purchase_snapshot AS (
SELECT
  *,
  ROW_NUMBER() OVER (PARTITION BY id ORDER BY event_time DESC) AS id_rank
FROM `{PROJECT}.{DATASET}.purchase`)
SELECT
  * EXCEPT (id_rank)
FROM purchase_snapshot WHERE (id_rank = 1 AND operation_type <> 'DELETE')