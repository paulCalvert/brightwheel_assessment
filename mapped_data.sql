SELECT
   _s0.company
  ,_s0.status
  ,_s0.phone
  ,CONCAT(_s0.street,CONCAT(_s0.city,CONCAT(_s0.state,_s0.postal_code)))  AS address
  ,CONCAT(_s0.first_name, CONCAT(" ", _s0.last_name))                     AS contact_name
  ,_s0.title                                                              AS contact_role
  ,_s0.email                                                              AS email_address
  ,NULL                                                                   AS license_type
  ,_s0.created_date                                                       AS date_created
  ,_s0.capacity_c                                                         AS capacity
FROM salesforce_leads _s0 -- Tab 1 data source

UNION ALL -- To allow duplicates, can clean up or test for later

SELECT
   _s1.name                                                           AS company
  ,_s1.status
  ,_s1.phone
  ,_s1.address
  ,_s1.primary_contact_name                                           AS contact_name
  ,_s1.primary_contact_role                                           AS contact_role
  ,NULL                                                               AS email_address
  ,_s1.credential_type                                                AS license_type
  ,_s1.first_issue_date                                               AS date_created
  ,NULL                                                               AS capacity
FROM source1 _sl -- Tab 2 data source

UNION ALL -- To allow duplicates, can clean up or test for later

SELECT
   _s2.company
  ,NULL                                                               AS status
  ,_s2.phone
  ,CONCAT(_s2.address1,CONCAT(_s2.address2,CONCAT(_s2.city,CONCAT(_s2.state, _s2.zip))))  AS address
  ,_s2.primary_caregiver                                              AS contact_name
  ,'Primary Caregiver'                                                AS contact_role
  ,_s2.email                                                          AS email_address
  ,_s2.type_license                                                   AS license_type
  ,NULL                                                               AS date_created
  ,_s2.total_cap                                                      AS capacity
FROM source2 _s2 -- Tab 3 data source

UNION ALL -- To allow duplicates, can clean up or test for later

SELECT
   _s3.company
  ,_s3.status
  ,_s3.phone
  ,CONCAT(_s3.address,CONCAT(_s3.city,CONCAT(_s3.state,_s3.zip)))     AS address
  ,NULL                                                               AS contact_name
  ,NULL                                                               AS contact_role
  ,_s3.email                                                          AS email_address
  ,_s3.type                                                           AS license_type
  ,_s3.issue_date                                                     AS date_created
  ,_s2.capacity                                                       AS capacity
FROM source3 _s3 -- Tab 4 data source