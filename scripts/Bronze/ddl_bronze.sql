/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.crm_accounts_info', 'U') IS NOT NULL 
	DROP TABLE bronze.crm_accounts_info;
GO

CREATE TABLE bronze.crm_accounts_info (
	account				NVARCHAR(50),
	sector				NVARCHAR(50),
	year_established	DATE,
	revenue				NUMERIC(10,2),
	employees			INT,
	office_location		NVARCHAR(50),
	subsidiary_of		NVARCHAR(50)

);
Go

IF OBJECT_ID('bronze.crm_products_info', 'U') IS NOT NULL 
	DROP TABLE bronze.crm_products_info;
GO

CREATE TABLE bronze.crm_products_info (
	cst_product				NVARCHAR(50),
	cst_series				NVARCHAR(50),
	cst_sales_price			INT

);
Go

IF OBJECT_ID('bronze.crm_sales_pipeline', 'U') IS NOT NULL 
	DROP TABLE bronze.crm_sales_pipeline;
GO

CREATE TABLE bronze.crm_sales_pipeline (
	cst_opportunity_id		NVARCHAR(50),
	cst_sales_agent			NVARCHAR(50),
	cst_product				NVARCHAR(50),
	cst_account				NVARCHAR(50),
	cst_deal_stage			NVARCHAR(50),
	cst_engage_date			DATE,
	cst_close_date			DATE,
	cst_close_value			INT

);
Go

IF OBJECT_ID('bronze.crm_sales_teams', 'U') IS NOT NULL 
	DROP TABLE bronze.crm_sales_teams;
GO

CREATE TABLE bronze.crm_sales_teams (
	cst_sales_agent			NVARCHAR(50),
	cst_manager				NVARCHAR(50),
	cst_regional_office		NVARCHAR(50)

);
Go
