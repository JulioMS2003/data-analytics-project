-- =====================================
-- KPI GENERALES
-- =====================================

-- Total de ingresos del negocio
SELECT SUM(sales) AS total_revenue
FROM fact_sales;

-- Número total de órdenes únicas
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales;

-- Ticket promedio (valor promedio por orden)
SELECT 
  SUM(sales) / COUNT(DISTINCT order_id) AS avg_order_value
FROM fact_sales;


-- =====================================
-- ANÁLISIS TEMPORAL
-- =====================================

-- Revenue mensual
SELECT 
  d.year,
  d.month,
  SUM(f.sales) AS revenue
FROM fact_sales f
JOIN dim_date d 
  ON f.order_date_clean = d.full_date
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- Crecimiento mes a mes (MoM)
WITH monthly AS (
  -- Cálculo del revenue por mes
  SELECT 
    d.year,
    d.month,
    ROUND(SUM(f.sales), 2) AS revenue
  FROM fact_sales f
  JOIN dim_date d
    ON f.order_date_clean = d.full_date
  GROUP BY d.year, d.month
),
with_lag AS (
  -- Obtención del revenue del mes anterior usando LAG
  SELECT 
    year,
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS prev_revenue
  FROM monthly
)
-- Cálculo del porcentaje de crecimiento
SELECT 
  year,
  month,
  revenue,
  prev_revenue,
  CASE 
    WHEN prev_revenue IS NULL THEN NULL
    WHEN prev_revenue = 0 THEN NULL
    ELSE ROUND((revenue - prev_revenue) * 100.0 / prev_revenue, 2)
  END AS growth_pct
FROM with_lag
ORDER BY year, month;


-- =====================================
-- ANÁLISIS DE CLIENTES
-- =====================================

-- Top 10 clientes por gasto total
SELECT TOP 10
  c.customer_name,
  ROUND(SUM(f.sales),2) AS total_spent
FROM fact_sales f
JOIN dim_customer c 
  ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- Segmentación de clientes según gasto
SELECT 
  c.customer_name,
  ROUND(SUM(f.sales),2) AS total_spent,
  CASE 
    WHEN SUM(f.sales) > 5000 THEN 'VIP'
    WHEN SUM(f.sales) > 1000 THEN 'Frecuente'
    ELSE 'Ocasional'
  END AS segment_type
FROM fact_sales f
JOIN dim_customer c 
  ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;


-- =====================================
-- ANÁLISIS DE PRODUCTOS
-- =====================================

-- Top 10 productos más vendidos
SELECT TOP 10
  p.product_name,
  ROUND(SUM(f.sales),2) AS total_sales
FROM fact_sales f
JOIN dim_product p 
  ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- Revenue por categoría de producto
SELECT 
  p.category,
  ROUND(SUM(f.sales),2) AS revenue
FROM fact_sales f
JOIN dim_product p 
  ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


-- =====================================
-- ANÁLISIS GEOGRÁFICO
-- =====================================

-- Revenue por estado
SELECT 
  c.state,
  ROUND(SUM(f.sales),2) AS revenue
FROM fact_sales f
JOIN dim_customer c 
  ON f.customer_id = c.customer_id
GROUP BY c.state
ORDER BY revenue DESC;