with claims as (
    select * from {{ ref('bronze_claims') }}
),

visits as (
    select * from {{ ref('bronze_visits') }}
),

charges as (
   
    select
        visit_id,
        sum(charge_amount) as total_charged
    from {{ ref('bronze_charges') }}
    group by visit_id
)

select
    c.claim_id,
    c.visit_id,
    initcap(trim(c.payer_raw)) as payer,

    c.claim_amount,
    c.claim_status,
    c.paid_amount,
    c.submit_date,

    v.visit_date,
    v.department_code,

    ch.total_charged,

    case 
    when c.claim_status = 'denied' then true 
    else false 
    end as is_denied,
    
    coalesce(c.claim_amount, 0) - coalesce(c.paid_amount, 0)     as unpaid_amount

from claims c
left join visits  v  on c.visit_id = v.visit_id
left join charges ch on c.visit_id = ch.visit_id