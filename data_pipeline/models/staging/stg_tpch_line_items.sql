SELECT
    {{
            dbt_utils.generate_surrogate_key([
                'L_ORDERKEY',
                'L_LINENUMBER'
            ])
    }} AS ORDER_ITEM_KEY, -- surrogate_key
    L_ORDERKEY AS ORDER_KEY,
	L_PARTKEY AS PART_KEY,
	L_LINENUMBER AS LINE_NUMBER,
	L_QUANTITY AS QUANTITY,
	L_EXTENDEDPRICE AS EXTENDED_PRICE,
	L_DISCOUNT AS DISCOUNT_PERCENTAGE,
	L_TAX AS TAX_RATE
FROM
     {{ source('tpch', 'lineitem')}}