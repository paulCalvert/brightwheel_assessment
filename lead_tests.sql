WITH cte_phoneDupCheck AS (
  SELECT
     COUNT(DISTINCT phone)      AS unique_phones
    ,COUNT(phone)               AS all_phones
    ,all_phones - unique_phones AS dup_phone
  FROM leads_clean
  )
SELECT
  CASE  WHEN dup_phone = 0
          THEN 'No Duplicates!'
          ELSE CONCAT(CAST(dup_phone AS VARCHAR(100)), ' duplicate phones found'
  END AS duplicate_phone_test
FROM cte_phoneDupCheck