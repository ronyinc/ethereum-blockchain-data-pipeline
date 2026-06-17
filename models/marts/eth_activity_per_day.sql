
{{ config(tags=['eth']) }}

---  practice ci changes .  change  2.0

select
        date,
        transaction_category,
        count(*) as tx_count,
        sum({{ ethereum_conversion('value') }}) as sum_eth_value

from 
         {{ ref('int_transactions_enriched') }}
group by 
date,
transaction_category
