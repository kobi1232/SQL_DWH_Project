# Netflix User Behavior Data Warehouse

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![SQL Server](https://img.shields.io/badge/SQL-Server-blue)](https://learn.microsoft.com/en-us/sql/sql-server/)
[![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion-green)](https://www.databricks.com/glossary/medallion-architecture)
[![Data Source](https://img.shields.io/badge/Dataset-Kaggle-red)](https://www.kaggle.com/datasets/sayeeduddin/netflix-2025user-behavior-dataset-210k-records)

---

## 🎯 Overview

This repository contains a complete **SQL-based Data Warehouse project** designed to model, transform, and analyze **Netflix user behavior** data.
The goal is to simulate a real-world analytical pipeline — from **raw behavioral logs (Bronze)** to **cleaned Silver data**, and finally **business-ready Gold analytical views**.

The project leverages the **Medallion Architecture** to create a clear, layered flow:

* **Bronze Layer** → raw ingestion of user activity logs.
* **Silver Layer** → data cleaning, deduplication, and type enforcement.
* **Gold Layer** → analytical views and KPIs used for BI dashboards and ML models.

This data warehouse helps uncover insights such as:

* Which users are most engaged.
* Which movies perform best across genres.
* How engagement evolves daily across different user segments.

---

## 🧠 Business Objective

Netflix relies heavily on understanding **user engagement patterns** to personalize recommendations and improve retention.
This project builds a **modular SQL data warehouse** that allows analysts to explore:

* Viewing trends and engagement levels.
* Correlation between reviews, searches, and watch time.
* Content performance across ratings, watch hours, and recommendation clicks.

---

## 📦 Dataset

**Source:** [Netflix 2025 User Behavior Dataset (Kaggle)](https://www.kaggle.com/datasets/sayeeduddin/netflix-2025user-behavior-dataset-210k-records)

**Files Included:**

* `users_info.csv` — basic user demographics, subscription type, and spend.
* `movies_info.csv` — content metadata (genre, type, year, IMDb rating).
* `watch_history.csv` — watch durations and timestamps.
* `reviews.csv` — user ratings and sentiment.
* `search_logs.csv` — keyword search activity.
* `recommendation_logs.csv` — recommendations shown vs. clicked.

**Volume:** ~210,000 records across six entities
**Format:** CSV (structured, relational)

---

## 🧱 Architecture

**Medallion Structure**

```
Bronze (Raw)  →  Silver (Cleaned & Typed)  →  Gold (Aggregated & Analytical)
```

### 🔹 Bronze Layer

* Stores unprocessed CSVs imported from the Kaggle dataset.
* Preserves all raw data for traceability.

### 🔸 Silver Layer

* Cleans duplicates and invalid entries.
* Enforces proper datatypes (`DATE`, `INT`, `DECIMAL`).
* Adds audit columns (`dwh_create_date`).

**ETL Managed by:**
`silver.load_silver_unified` procedure — transforms and loads 6 silver tables:

```
ntx_users_info
ntx_movies_info
ntx_reviews
ntx_search_logs
ntx_watch_history
ntx_recommendation_logs
```

### 🟡 Gold Layer

* Contains **3 business views** built for analytics and BI dashboards.

#### 1. `gold.user_profile`

Aggregates user-level KPIs:

* Lifetime searches, total reviews, average rating, total watch hours.
* Adds weighted **Engagement Score (0–100)** and **Subscription Tenure**.

#### 2. `gold.user_engagement`

Tracks **daily activity per user**, combining watch, review, search, and recommendation data.
Includes normalized **Daily Engagement Score** and an activity category (`High`, `Medium`, `Low`).

#### 3. `gold.content_performance`

Ranks content (movies/shows) by overall engagement:

* Combines watch hours, reviews, ratings, sentiment, and clicks.
* Calculates **Content Engagement Index (0–100)** and a popularity rank.

---

## ⚙️ Technologies & Tools

| Category                 | Tool / Technology           |
| ------------------------ | --------------------------- |
| Database Engine          | Microsoft SQL Server (SSMS) |
| Query Language           | T-SQL                       |
| ETL                      | Stored Procedures + DML     |
| Modeling Approach        | Medallion Architecture      |
| Version Control          | Git / GitHub                |
| Visualization (Optional) | Power BI / Tableau          |
| Dataset Source           | Kaggle (CSV import)         |

---

## 🧪 Validation & Testing

After deploying the warehouse:

1. Run `silver_full_load.sql` → populates the silver schema.
2. Execute `gold_ddl.sql` → builds gold analytical views.
3. Execute `gold_validation.sql` → validates metrics, nulls, and normalization.

Key tests:

* Engagement scores range between 0–100.
* No duplicate user/day combinations.
* Referential integrity between gold and silver layers.
* Consistent top performers across KPIs.

---

## 📊 Example Insights

| KPI                          | Description                                             |
| ---------------------------- | ------------------------------------------------------- |
| **Engagement Score**         | Weighted measure of total user activity.                |
| **Daily Activity Level**     | Categorizes users into Low, Medium, or High engagement. |
| **Content Engagement Index** | Aggregates watch, rating, sentiment, and clicks.        |
| **Popularity Rank**          | DENSE_RANK-based movie ranking by engagement weight.    |

---

## 🚀 How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/<your-username>/netflix-dwh.git
   ```
2. Open in **SSMS** or **Azure Data Studio**.
3. Run:

   ```sql
   :r .\silver_full_load.sql
   :r .\gold_ddl.sql
   :r .\gold_validation.sql
   ```

   *(Ensure SQLCMD mode is enabled in SSMS.)*

---

## 📁 Repository Structure

```
/sql
 ├── bronze/                   # Raw dataset import scripts
 ├── silver/                   # Cleansing and type enforcement
 ├── gold/
 │    ├── gold_ddl.sql         # Analytical views
 │    └── gold_validation.sql  # Validation script
 └── utils/                    # Helper procedures, logs

/docs
 ├── data_model_diagram.png
 ├── etl_flow.png
 └── README.md

README.md                     # This file
```

---

## 🧾 License

This project is licensed under the [MIT License](LICENSE).

---

**Project started:** October 2025
**Last updated:** October 21, 2025
**Author:** Kobi Asulin

---

