select
    -- visit context (from bronze_visits)
    v.visit_id,
    v.visit_date,
    v.department_code,
    v.diagnosis,
    v.visit_status,
    v.attending_doctor,

    -- patient context (pulled in by the join)
    p.patient_id,
    p.first_name,
    p.last_name,
    p.gender,
    p.date_of_birth,
    p.city,
    p.state,
    p.insurance_payer_code,

    -- business logic: brand-new facts that exist in no source table
    case 
    when v.visit_status = 'cancelled' then true 
    else false 
    end as is_cancelled,
    datediff('year', p.date_of_birth, v.visit_date) as age_at_visit

from {{ ref('bronze_visits') }}    as v
left join {{ ref('bronze_patients') }} as p
    on v.patient_id = p.patient_id