SELECT
    category_1
    , ROUND (SUM(turnover_before_promo), 2) AS turnover
    , ROUND (SUM(turnover) - SUM(purchase_cost), 2) AS margin
    FROM `taxifare-379314.batch1552recap.gwz_sales`
    GROUP BY category_1, date_date
    ORDER BY category_1, date_date