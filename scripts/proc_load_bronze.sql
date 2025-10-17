/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
			SET @batch_start_time = GETDATE();
			PRINT '================================================';
			PRINT 'Loading Bronze Layer';
			PRINT '================================================';

			PRINT '------------------------------------------------';
			PRINT 'Loading CRM Tables';
			PRINT '------------------------------------------------';

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_accounts_info';
			TRUNCATE TABLE bronze.crm_accounts_info;
			PRINT '>> Inserting Data Into: bronze.crm_accounts_info';
			BULK INSERT bronze.crm_accounts_info
			FROM 'C:\Users\kobi\SQL\data_sets\crm_accounts_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '>> -------------';

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_products_info';
			TRUNCATE TABLE bronze.crm_products_info;
			PRINT '>> Inserting Data Into: bronze.crm_products_info';
			BULK INSERT bronze.crm_products_info
			FROM 'C:\Users\kobi\SQL\data_sets\crm_products_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '>> -------------';

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_sales_pipeline';
			TRUNCATE TABLE bronze.crm_sales_pipeline;
			PRINT '>> Inserting Data Into: bronze.crm_sales_pipeline';
			BULK INSERT bronze.crm_sales_pipeline
			FROM 'C:\Users\kobi\SQL\data_sets\crm_sales_pipeline.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '>> -------------';

			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_sales_teams';
			TRUNCATE TABLE bronze.crm_sales_teams;
			PRINT '>> Inserting Data Into: bronze.crm_sales_teams';
			BULK INSERT bronze.crm_sales_teams
			FROM 'C:\Users\kobi\SQL\data_sets\crm_sales_teams.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
			PRINT '>> -------------';

		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END
