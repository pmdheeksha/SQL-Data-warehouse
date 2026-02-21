/*
This stored procedure loads data into the Bronze layer tables.
It first truncates existing data and then performs BULK INSERT 
from CRM and ERP CSV source files.

The procedure records load start and end time to calculate 
execution duration and prints progress messages for monitoring.

This ensures fresh raw data is loaded into Bronze tables 
for further processing in the Silver layer.
*/
EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
    DECLARE @start_time DATETIME,@end_time DATETIME;
    BEGIN TRY
        PRINT'=================================================';
        PRINT'Loading Bronze Layer';
        PRINT'=================================================';

        PRINT'-------------------------------------------------';
        PRINT'Loading CRM Tables';
        PRINT'-------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '>>Truncating Table:bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>>Inserting Data Into:bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\Lenovo\Documents\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );
        SET @end_time = GETDATE();
        PRINT '>>Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';


        --SELECT * FROM bronze.crm_cust_info 

        --SELECT COUNT(*) FROM bronze.crm_cust_info 
        SET @start_time = GETDATE();
        PRINT '>>Truncating Table:bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>>Inserting Data Into:bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\Lenovo\Documents\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
   
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT '>>Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';

        --SELECT * FROM bronze.crm_prd_info
        SET @start_time = GETDATE();
        PRINT '>>Truncating Table:bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>>Inserting Data Into:bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\Lenovo\Documents\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
   
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT '>>Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';

        
        PRINT'-------------------------------------------------';
        PRINT'Loading ERP Tables';
        PRINT'-------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '>>Truncating Table:bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12

        PRINT '>>Inserting Data Into:bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\Lenovo\Documents\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
   
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT '>>Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
        
        SET @start_time = GETDATE();
        PRINT '>>Truncating Table:bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101

        PRINT '>>Inserting Data Into:bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\Lenovo\Documents\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
   
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT '>>Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';

        SET @start_time = GETDATE();
        PRINT '>>Truncating Table:bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2

        PRINT '>>Inserting Data Into:bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\Lenovo\Documents\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
   
            TABLOCK
        )
        SET @end_time = GETDATE();
        PRINT '>>Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
    END TRY
    BEGIN CATCH
    END CATCH

END
