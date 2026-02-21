-- Use the DataWarehouse database
USE DataWarehouse;

---------------------------------------------------
-- Create Bronze CRM Customer Information Table
---------------------------------------------------

-- If table already exists, drop it
IF OBJECT_ID ('bronze.crm_cust_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

-- Create table to store raw customer data from CRM system
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,                     -- Customer ID
	cst_key NVARCHAR(50),           -- Customer Business Key
	cst_firstname NVARCHAR(50),     -- Customer First Name
	cst_lastname NVARCHAR(50),      -- Customer Last Name
	cst_material_status NVARCHAR(50), -- Marital Status
	cst_gndr NVARCHAR(50),          -- Gender
	cst_create_date DATE            -- Customer Creation Date
);

---------------------------------------------------
-- Create Bronze CRM Product Information Table
---------------------------------------------------

IF OBJECT_ID ('bronze.crm_prd_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;

-- Store raw product data from CRM
CREATE TABLE bronze.crm_prd_info (
	prd_id NVARCHAR(50),        -- Product ID
	prd_key NVARCHAR(50),       -- Product Business Key
	prd_nm NVARCHAR(50),        -- Product Name
	prd_cost NVARCHAR(50),      -- Product Cost (raw format)
	prd_line NVARCHAR(50),      -- Product Line
	prd_start_dt DATETIME,      -- Product Start Date
	prd_end_dt DATETIME         -- Product End Date
);

---------------------------------------------------
-- Create Bronze CRM Sales Details Table
---------------------------------------------------

IF OBJECT_ID ('bronze.crm_sales_details' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

-- Store raw sales transaction data
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(50),   -- Sales Order Number
	sls_prd_key NVARCHAR(50),   -- Product Key
	sls_cust_id INT,            -- Customer ID
	sls_order_dt INT,           -- Order Date (raw format)
	sls_ship_dt INT,            -- Ship Date (raw format)
	sls_due_dt INT,             -- Due Date (raw format)
	sls_sales INT,              -- Sales Amount
	sls_quantity INT,           -- Quantity Sold
	sls_price INT               -- Product Price
);

---------------------------------------------------
-- Create Bronze ERP Location Table
---------------------------------------------------

IF OBJECT_ID ('bronze.erp_loc_a101' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;

-- Store raw location data from ERP
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),       -- Customer ID
	cntry NVARCHAR(50)      -- Country
);

---------------------------------------------------
-- Create Bronze ERP Customer Additional Info
---------------------------------------------------

IF OBJECT_ID ('bronze.erp_cust_az12' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;

-- Store additional customer details from ERP
CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),   -- Customer ID
	bdate DATE,         -- Birth Date
	gen NVARCHAR(50)    -- Gender
);

---------------------------------------------------
-- Create Bronze ERP Product Category Table
---------------------------------------------------

IF OBJECT_ID ('bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;

-- Store product category information
CREATE TABLE bronze.erp_px_cat_g1v2(
	id NVARCHAR(50),        -- Product ID
	cat NVARCHAR(50),       -- Category
	subcat NVARCHAR(50),    -- Subcategory
	maintenance NVARCHAR(50) -- Maintenance Type
);


