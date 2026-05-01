-- =====================================
-- DIM CUSTOMER
-- =====================================

IF OBJECT_ID('dim_customer', 'U') IS NOT NULL
DROP TABLE dim_customer;

SELECT 
    customer_id,
    MAX(customer_name) AS customer_name,
    MAX(segment) AS segment,
    MAX(country) AS country,
    MAX(city) AS city,
    MAX(state) AS state,
    MAX(postal_code) AS postal_code,
    MAX(region) AS region
INTO dim_customer
FROM clean_orders
GROUP BY customer_id;

ALTER TABLE dim_customer
ADD CONSTRAINT pk_customer PRIMARY KEY (customer_id);

-- =====================================
-- DIM PRODUCT 
-- =====================================

IF OBJECT_ID('dim_product', 'U') IS NOT NULL
DROP TABLE dim_product;

SELECT 
    product_id,
    MAX(product_name) AS product_name,
    MAX(category) AS category,
    MAX(sub_category) AS sub_category
INTO dim_product
FROM clean_orders
GROUP BY product_id;

ALTER TABLE dim_product
ADD CONSTRAINT pk_product PRIMARY KEY (product_id);

-- =====================================
-- DIM DATE 
-- =====================================

IF OBJECT_ID('dim_date', 'U') IS NOT NULL
DROP TABLE dim_date;

SELECT DISTINCT
    order_date_clean AS full_date,
    YEAR(order_date_clean) AS year,
    MONTH(order_date_clean) AS month,
    DATENAME(MONTH, order_date_clean) AS month_name,
    DATEPART(QUARTER, order_date_clean) AS quarter
INTO dim_date
FROM clean_orders

ALTER TABLE dim_date
ALTER COLUMN full_date DATE NOT NULL;

ALTER TABLE dim_date
ADD CONSTRAINT pk_date PRIMARY KEY (full_date);

-- =====================================
-- FACT SALES 
-- =====================================

IF OBJECT_ID('fact_sales', 'U') IS NOT NULL
DROP TABLE fact_sales;

SELECT
    order_id,
    order_date_clean,
    customer_id,
    product_id,
    sales
INTO fact_sales
FROM clean_orders;

ALTER TABLE fact_sales
ADD CONSTRAINT pk_fact 
PRIMARY KEY (order_id, product_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES dim_customer(customer_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES dim_product(product_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_date
FOREIGN KEY (order_date_clean)
REFERENCES dim_date(full_date);

