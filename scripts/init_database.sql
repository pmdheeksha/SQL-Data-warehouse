/*
=============================================================
 Project      : Data Warehouse
 Architecture : Medallion Architecture (Bronze, Silver, Gold)
 Description  : This script drops and recreates the 
                DataWarehouse database and creates 
                Bronze, Silver, and Gold schemas 
                for layered data processing.
 Author       : Dheeksha PM
 Date         : 20-Feb-2026
=============================================================
*/

--CREATE database 'dataWarehouse'


IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

-- Create Database
CREATE DATABASE DataWarehouse;
GO

-- Use Database
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
