
{{ config(materialized='view')}}

select

        t.hash,  -- a single transaction hash can have multiple token transfers
        t.block_number,
        t.date,
        t.from_address,
        t.to_address,
        t.value,
        t.receipt_contract_address,
        t.input,
        tt.token_transfer_count,

        case
            when t.receipt_contract_address is not null then 'contract_creation'
            when tt.transaction_hash is not null then 'token_transfer'
            when t.input = '0x' and t.value > 0 then 'plain_eth_transfer'
            else 'other'
        end as transaction_category

from {{ ref('stg_transactions')}} t

left join
            {{ ref('token_transfer_aggs')}} tt on t.hash = tt.transaction_hash
