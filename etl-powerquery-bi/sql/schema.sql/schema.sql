-- DIMENSION: PRODUCTS
CREATE TABLE dim_product (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- DIMENSION: MONTH
CREATE TABLE dim_month (
    month DATE PRIMARY KEY
);

-- FACT: PROFITABILITY
CREATE TABLE fact_profitability (
    month DATE,
    product_id VARCHAR(20),
    total_revenue DECIMAL(12,2),
    total_variable_cost DECIMAL(12,2),
    fixed_cost_allocated DECIMAL(12,2),
    net_profit DECIMAL(12,2),

    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),

    CONSTRAINT fk_month
        FOREIGN KEY (month) REFERENCES dim_month(month)
);
