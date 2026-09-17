SELECT 
    DATE_TRUNC(date_date, MONTH) AS date_month,
    margin,
    average_basket,
    operational_margin,
    COALESCE(ads_cost, 0)         AS ads_cost,
    COALESCE(ads_impression, 0)   AS ads_impression,
    COALESCE(ads_clicks, 0)       AS ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    operational_margin - COALESCE(ads_cost,0) AS ads_margin,
    shipping_fee,
    log_cost,
    ship_cost
FROM {{ ref('finance_days') }}
LEFT JOIN {{ ref('int_campaigns') }} USING(date_date)