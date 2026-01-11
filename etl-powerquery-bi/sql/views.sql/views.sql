-- PROFITABILITY BY PRODUCT & MONTH
CREATE VIEW vw_profitability_monthly AS
SELECT
    f.month,
    p.product_name,
    p.category,
    f.total_revenue,
    f.total_variable_cost,
    f.fixed_cost_allocated,
    f.net_profit,
    CASE 
        WHEN f.total_revenue = 0 THEN NULL
        ELSE f.net_profit / f.total_revenue
    END AS net_margin_pct
FROM fact_profitability f
JOIN dim_product p
    ON f.product_id = p.product_id;


-- LOSS-MAKING PRODUCTS
CREATE VIEW vw_loss_makers AS
SELECT
    product_name,
    SUM(net_profit) AS total_net_loss
FROM vw_profitability_monthly
GROUP BY product_name
HAVING SUM(net_profit) < 0;


-- BREAK-EVEN CALCULATION
CREATE VIEW vw_break_even AS
SELECT
    month,
    SUM(total_variable_cost) AS total_variable_cost,
    SUM(fixed_cost_allocated) AS total_fixed_cost,
    SUM(total_revenue) AS total_revenue,
    CASE
        WHEN SUM(total_revenue) - SUM(total_variable_cost) = 0 THEN NULL
        ELSE
            SUM(fixed_cost_allocated) /
            ((SUM(total_revenue) - SUM(total_variable_cost)) / SUM(total_revenue))
    END AS break_even_revenue
FROM fact_profitability
GROUP BY month;
