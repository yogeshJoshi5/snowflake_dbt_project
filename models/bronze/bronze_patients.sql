select
pat_id as patient_id,
initcap(fname) as first_name,
initcap(lname) as last_name,
upper(gender) as gender,
cast(dob as date) as date_of_birth,
trim(city) as city,
state,
upper(ins_payer_cd) as insurance_payer_code,
cast(reg_dt as date) as registration_date
from {{ source('source','patients') }}