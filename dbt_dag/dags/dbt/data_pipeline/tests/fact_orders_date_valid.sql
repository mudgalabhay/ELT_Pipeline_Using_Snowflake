SELECT
    *
FROM
    {{ref('fct_orders')}}
WHERE
    DATE(ORDER_DATE) > CURRENT_DATE()
    OR DATE(ORDER_DATE) < DATE('1990-01-01')