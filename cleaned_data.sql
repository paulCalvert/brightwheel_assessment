SELECT
   company
  ,status
  ,REPLACE(phone, '-', '')            AS phone
  ,ISNULL(address, 'N/A')             AS address
  ,ISNULL(contact_name, 'N/A')        AS contact_name
  ,ISNULL(contact_role, 'N/A')        AS contact_role
  ,ISNULL(email_address, 'N/A')       AS email_address
  ,ISNULL(license_type, 'N/A')        AS license_type
  ,ISNULL(date_created, '1900-01-01') AS date_created
  ,ISNULL(capacity,0)                 AS capacity
FROM leads