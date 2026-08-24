select
claim_id,
visit_id,
trim(payer) as payer_raw,
claim_amt as claim_amount,
lower(claim_status) as claim_status,
cast(submit_dt as date) as submit_date,
paid_amt as paid_amount
from {{ source('source','claims') }}