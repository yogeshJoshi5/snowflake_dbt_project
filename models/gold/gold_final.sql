with claims as (
    select * from {{ ref('silver_claims') }}
)

select
    payer,
    department_code,
    count(*)                                               as total_claims,
    sum(case when is_denied then 1 else 0 end)             as denied_claims,
    sum(case when is_denied then claim_amount else 0 end)  as denied_amount
                                                       
from claims
group by payer, department_code
order by denied_amount desc