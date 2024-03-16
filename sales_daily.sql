WITH tmp AS (
SELECT
    date_date
    , category_1
    , ROUND (SUM(turnover)/1000, 2) AS turnover
    , ROUND (SUM(turnover_before_promo)/1000, 2) AS turnover_before_promo
    , ROUND ((SUM(turnover_before_promo) - SUM(turnover))/1000, 2) AS discount
    , ROUND ((SUM(turnover) - SUM(purchase_cost))/1000 , 2) AS margin
    FROM `taxifare-379314.batch1552recap.gwz_sales`
    GROUP BY category_1, date_date
    ORDER BY category_1, date_date
),

cat_window AS(
  SELECT
  date_date
  , category_1
  , SUM(turnover) OVER(PARTITION BY category_1 ORDER BY date_date) AS turnover_part
  , SUM(margin) OVER(PARTITION BY category_1 ORDER BY date_date) AS margin
  FROM tmp
)
SELECT date_date
, category_1
, ROUND(turnover_part,2)
, ROUND(margin,2)
FROM cat_window