/*
===============================================================================
Stored Procedure: Load Bronze Layer (CSV -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads raw data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV files into bronze tables.

Parameters:
    None. 
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE @batch_start DATETIME = GETDATE();
    PRINT '================================================';
    PRINT 'Starting Bronze Layer Load at: ' + CONVERT(NVARCHAR, @batch_start, 120);
    PRINT '================================================';

    PRINT '------------------------------------------------';
    PRINT 'Loading NTX Tables';
    PRINT '------------------------------------------------';

    -- ntx_movies_info
    DECLARE @table_start DATETIME = GETDATE();
    TRUNCATE TABLE bronze.ntx_movies_info;
    PRINT '>> Inserting Data Into: bronze.ntx_movies_info';
    BULK INSERT bronze.ntx_movies_info
    FROM 'C:\Users\kobi\SQL\data_sets\ntx_movies_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        TABLOCK,
        KEEPNULLS,
        MAXERRORS = 10
    );
    PRINT 'Rows Loaded: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));
    PRINT '>> Table Duration: ' + CAST(DATEDIFF(SECOND, @table_start, GETDATE()) AS NVARCHAR(10)) + ' seconds';

    -- ntx_recommendation_logs
    SET @table_start = GETDATE();
    TRUNCATE TABLE bronze.ntx_recommendation_logs;
    PRINT '>> Inserting Data Into: bronze.ntx_recommendation_logs';
    BULK INSERT bronze.ntx_recommendation_logs
    FROM 'C:\Users\kobi\SQL\data_sets\ntx_recommendation_logs.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        TABLOCK,
        KEEPNULLS,
        MAXERRORS = 10
    );
    PRINT 'Rows Loaded: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));
    PRINT '>> Table Duration: ' + CAST(DATEDIFF(SECOND, @table_start, GETDATE()) AS NVARCHAR(10)) + ' seconds';

    -- ntx_reviews
    SET @table_start = GETDATE();
    TRUNCATE TABLE bronze.ntx_reviews;
    PRINT '>> Inserting Data Into: bronze.ntx_reviews';
    BULK INSERT bronze.ntx_reviews
    FROM 'C:\Users\kobi\SQL\data_sets\ntx_reviews.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        TABLOCK,
        KEEPNULLS,
        MAXERRORS = 10
    );
    PRINT 'Rows Loaded: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));
    PRINT '>> Table Duration: ' + CAST(DATEDIFF(SECOND, @table_start, GETDATE()) AS NVARCHAR(10)) + ' seconds';

    -- ntx_search_logs
    SET @table_start = GETDATE();
    TRUNCATE TABLE bronze.ntx_search_logs;
    PRINT '>> Inserting Data Into: bronze.ntx_search_logs';
    BULK INSERT bronze.ntx_search_logs
    FROM 'C:\Users\kobi\SQL\data_sets\ntx_search_logs.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        TABLOCK,
        KEEPNULLS,
        MAXERRORS = 10
    );
    PRINT 'Rows Loaded: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));
    PRINT '>> Table Duration: ' + CAST(DATEDIFF(SECOND, @table_start, GETDATE()) AS NVARCHAR(10)) + ' seconds';

    -- ntx_users_info
    SET @table_start = GETDATE();
    TRUNCATE TABLE bronze.ntx_users_info;
    PRINT '>> Inserting Data Into: bronze.ntx_users_info';
    BULK INSERT bronze.ntx_users_info
    FROM 'C:\Users\kobi\SQL\data_sets\ntx_users_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        TABLOCK,
        KEEPNULLS,
        MAXERRORS = 10
    );
    PRINT 'Rows Loaded: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));
    PRINT '>> Table Duration: ' + CAST(DATEDIFF(SECOND, @table_start, GETDATE()) AS NVARCHAR(10)) + ' seconds';

    -- ntx_watch_history
    SET @table_start = GETDATE();
    TRUNCATE TABLE bronze.ntx_watch_history;
    PRINT '>> Inserting Data Into: bronze.ntx_watch_history';
    BULK INSERT bronze.ntx_watch_history
    FROM 'C:\Users\kobi\SQL\data_sets\ntx_watch_history.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        TABLOCK,
        KEEPNULLS,
        MAXERRORS = 10
    );
    PRINT 'Rows Loaded: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));
    PRINT '>> Table Duration: ' + CAST(DATEDIFF(SECOND, @table_start, GETDATE()) AS NVARCHAR(10)) + ' seconds';

    DECLARE @batch_end DATETIME = GETDATE();
    PRINT '================================================';
    PRINT 'Bronze Layer Load Completed Successfully';
    PRINT '   - Start Time: ' + CONVERT(NVARCHAR, @batch_start, 120);
    PRINT '   - End Time: ' + CONVERT(NVARCHAR, @batch_end, 120);
    PRINT '   - Total Duration: ' + CAST(DATEDIFF(SECOND, @batch_start, @batch_end) AS NVARCHAR(10)) + ' seconds';
    PRINT '================================================';
END;
GO
