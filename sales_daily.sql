SELECT
    date_date
    , ROUND (SUM(turnover), 2) AS turnover
    , ROUND (SUM(turnover_before_promo) -SUM(turnover), 2) AS discount
    FROM `taxifare-379314.batch1552recap.gwz_sales`
    GROUP BY date_date
    ORDER BY date_date