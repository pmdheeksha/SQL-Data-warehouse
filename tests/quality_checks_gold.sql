-- =============================================================================
-- QC 1: Missing Product or Customer in Fact Table
-- =============================================================================
-- Check if any sales in fact_sales have no matching product or customer
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
WHERE p.product_key IS NULL
   OR c.customer_key IS NULL;

-- =============================================================================
-- QC 2: Null or Zero Sales / Quantity / Price
-- =============================================================================
SELECT *
FROM gold.fact_sales
WHERE sales_amount IS NULL
   OR sales_amount <= 0
   OR quantity IS NULL
   OR quantity <= 0
   OR price IS NULL
   OR price <= 0;

-- =============================================================================
-- QC 3: Duplicate Surrogate Keys in Dimensions
-- =============================================================================

-- Customers
SELECT customer_key, COUNT(*) AS cnt
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- Products
SELECT product_key, COUNT(*) AS cnt
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

SELECT *
FROM gold.fact_sales
WHERE order_date > GETDATE();

-- Customers without country or gender
SELECT *
FROM gold.dim_customers
WHERE country IS NULL OR gender IS NULL;

-- Products without category
SELECT *
FROM gold.dim_products
WHERE category IS NULL;
