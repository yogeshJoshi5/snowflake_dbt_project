select
visit_id,
pat_id as patient_id,
cast(vis_dt as date) as visit_date,
upper(dept_cd) as department_code,
diag as diagnosis,
lower(status) as visit_status,
attending_dr as attending_doctor
from {{ source('source','visits') }}