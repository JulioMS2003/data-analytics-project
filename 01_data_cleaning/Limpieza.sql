-- =====================================
-- 1. CREAR TABLA CLEAN
-- =====================================

IF OBJECT_ID('clean_orders', 'U') IS NOT NULL
DROP TABLE clean_orders;

SELECT *
INTO clean_orders
FROM raw_orders;

-- =====================================
-- 2. CONVERTIR FECHAS
-- =====================================

ALTER TABLE clean_orders
ADD order_date_clean DATE,
    ship_date_clean DATE;

UPDATE clean_orders
SET 
  order_date_clean = TRY_CONVERT(DATE, order_date, 101),
  ship_date_clean = TRY_CONVERT(DATE, ship_date, 101);

-- =====================================
-- 3. ELIMINAR DATOS INVÁLIDOS
-- =====================================

DELETE FROM clean_orders
WHERE order_date_clean IS NULL
   OR sales IS NULL;

-- =====================================
-- 4. LIMPIEZA DE TEXTO
-- =====================================

UPDATE clean_orders
SET 
  customer_name = LTRIM(RTRIM(customer_name)),
  product_name = LTRIM(RTRIM(product_name));

-- =====================================
-- 5. ELIMINAR DUPLICADOS
-- =====================================

WITH cte AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY order_id, product_id 
           ORDER BY order_date_clean
         ) AS rn
  FROM clean_orders
)
DELETE FROM cte
WHERE rn > 1;

-- =====================================
-- 6. VALIDACIÓN
-- =====================================

-- Conteo final
SELECT COUNT(*) AS total_rows FROM clean_orders;

-- Ver fechas convertidas
SELECT TOP 10 order_date, order_date_clean
FROM clean_orders;

-- Ver duplicados (debe ser 0)
SELECT order_id, product_id, COUNT(*) AS duplicates
FROM clean_orders
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;