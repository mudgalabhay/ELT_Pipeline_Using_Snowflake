SELECT
    *
FROM
    {{ref('fct_orders')}}
WHERE
    ITEM_DISCOUNT_AMOUNT > 0