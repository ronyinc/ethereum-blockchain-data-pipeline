
{{ config(tags=['eth']) }}

---  practice ci changes .  change  3.0

select
        date,
        transaction_category,
        count(*) as transaction_count,
        sum({{ ethereum_conversion('value') }}) as sum_ethereum_value

from 
         {{ ref('int_transactions_enriched') }}
group by 
        date,
        transaction_category
