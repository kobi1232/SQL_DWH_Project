# Maven Sales Data Warehouse

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![SQL](https://img.shields.io/badge/SQL-Query%20Optimization-blue)](https://www.postgresql.org/)
[![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion-green)](https://www.databricks.com/glossary/medallion-architecture)

## Overview

This repository contains the implementation of a comprehensive SQL-based data warehouse for the **Maven Sales Challenge**. As a BI Developer at MavenTech—a company specializing in selling computer hardware to large businesses—you've been tasked with transforming raw CRM sales data into actionable insights. MavenTech has adopted a new CRM system to track B2B sales opportunities but lacks external visibility into the data. This project addresses that gap by building a robust data warehouse that supports the creation of an interactive dashboard for sales managers to monitor their team's quarterly performance.

The warehouse enables data-driven decision-making by organizing and aggregating sales data across accounts, products, sales teams, and opportunities, providing clear visibility into key metrics like opportunity pipelines, win rates, and quarterly revenue trends.

## Objectives

### Main Objective
Develop a scalable SQL data warehouse to ingest, clean, and aggregate CRM sales data, ultimately powering an interactive dashboard for quarterly sales performance tracking. This empowers sales managers to:
- Visualize team performance metrics (e.g., opportunities closed, revenue generated).
- Identify trends in B2B hardware sales to large enterprises.
- Make informed decisions to drive revenue growth.

### Key Requirements
- **Data Ingestion**: Load raw B2B sales opportunity data from the CRM database, including details on accounts (e.g., company size, industry), products (e.g., hardware types, pricing), sales teams (e.g., reps, territories), and opportunities (e.g., stage, value, close date).
- **Data Quality**: Ensure data is cleaned, validated, and transformed to handle inconsistencies, duplicates, and missing values.
- **Performance Optimization**: Design efficient schemas and queries to support real-time or near-real-time dashboard updates for quarterly reporting.
- **Scalability**: Use a layered architecture to accommodate growing datasets as MavenTech expands.
- **Security & Compliance**: Anonymize sensitive account data and ensure queries adhere to B2B privacy standards.
- **Dashboard Integration**: Structure aggregated data to feed into visualization tools (e.g., Tableau, Power BI) for interactive quarterly reports.

## Dataset

The dataset comprises B2B sales opportunities from a fictitious CRM database for computer hardware sales. Key tables/entities include:
- **Accounts**: Customer profiles (e.g., company name, industry, revenue).
- **Products**: Hardware catalog (e.g., servers, laptops, pricing tiers).
- **Sales Teams**: Rep details (e.g., team member ID, region, manager).
- **Opportunities**: Sales pipeline data (e.g., opportunity ID, stage, amount, expected close date, outcome).

Sample data volume: ~10,000 opportunities spanning multiple quarters, simulating real-world CRM exports in CSV or SQL dump format.

## Technologies & Tools

- **Primary Language**: SQL (dialect-agnostic where possible; tested with PostgreSQL/MySQL).
- **Schema Design**: DDL scripts for tables, indexes, and views.
- **Data Manipulation**: DML for ETL processes (Extract, Transform, Load).
- **Query Optimization**: Indexing, partitioning, and EXPLAIN ANALYZE for performance tuning.
- **Environment**: Local development with Dockerized databases; compatible with cloud warehouses like Snowflake or BigQuery.
- **Version Control**: Git for tracking schema changes and scripts.
- **Documentation**: SQL comments and this README for reproducibility.

No external dependencies beyond standard SQL; scripts are self-contained.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Project started: October 2025. Last updated: October 17, 2025.*
