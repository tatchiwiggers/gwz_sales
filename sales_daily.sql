WITH tmp AS (
SELECT
    date_date
    , ROUND (SUM(turnover)/1000, 2) AS turnover
    , ROUND ((SUM(turnover_before_promo) - SUM(turnover))/1000, 2) AS discount
    , ROUND ((SUM(turnover) - SUM(purchase_cost))/1000 , 2) AS margin
    FROM `taxifare-379314.batch1552recap.gwz_sales`
    GROUP BY date_date
    ORDER BY date_date
)

SELECT date_date
, SUM(turnover) OVER (ORDER BY date_date) AS cumulative_turnover
FROM tmp