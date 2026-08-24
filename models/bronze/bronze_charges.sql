select
charge_id,
visit_id,
cpt_cd as procedure_code,
chrg_amt as charge_amount,
cast(chrg_dt as date) as charge_date
from {{ source('source','charges') }}