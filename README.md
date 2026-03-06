
# Data Warehouse & Analytics Project

An end‑to‑end SQL project demonstrating how raw business data can be transformed into a structured **data warehouse** and used to generate **actionable business insights**.

This project simulates a real analytics workflow followed in many organizations: from ingesting operational data to producing analytical reports that support decision‑making.

---

## Project Overview

| Stage | Description |
|------|-------------|
| Data Ingestion | Import raw ERP and CRM datasets from CSV files |
| Data Cleaning | Resolve data quality issues and standardize fields |
| Data Warehouse | Build structured Bronze → Silver → Gold layers |
| Analytics | Perform SQL‑based analytical queries |
| Reporting | Create analytical views for business reporting |
| Insights | Derive business insights from the analytical results |

---

## Business Problem

Organizations collect large volumes of operational data, but raw data alone does not provide meaningful insights.

The objective of this project is to demonstrate how to:

- Organize raw data into a **structured data warehouse**
- Build **analytics‑ready datasets**
- Perform **advanced SQL analysis**
- Generate **business insights** to support decision‑making

---

## Data Architecture

The warehouse follows a layered architecture to ensure clean, reliable, and scalable data processing.

```
Source Systems (ERP & CRM CSV files)
            │
            ▼
        Bronze Layer
     Raw Data Ingestion
            │
            ▼
        Silver Layer
 Data Cleaning & Standardization
            │
            ▼
         Gold Layer
   Analytical Data Model
            │
            ▼
     Analytics & Reporting
```

---

## Data Model

The Gold layer uses a **star schema** optimized for analytical queries.

| Table | Type | Description |
|------|------|-------------|
| fact_sales | Fact | Stores transactional sales data |
| dim_customers | Dimension | Customer attributes and demographics |
| dim_products | Dimension | Product hierarchy and attributes |

This structure allows efficient analysis across:

- Customers
- Products
- Time

---

## Analytical Techniques Implemented

| Analysis Type | Purpose |
|---------------|--------|
| Exploratory Data Analysis | Understand dataset structure and validate data |
| Change Over Time Analysis | Track sales trends across months and years |
| Cumulative Analysis | Monitor running totals and business growth |
| Performance Analysis (YoY / MoM) | Evaluate product performance over time |
| Data Segmentation | Group customers and products into meaningful segments |
| Part‑to‑Whole Analysis | Measure category contributions to total sales |

---

## Reporting Layer

Analytical reports were implemented as SQL views.

| Report | Key Metrics |
|------|-------------|
| Customer Report | Orders, revenue, lifespan, recency, segmentation |
| Product Report | Revenue, customers, sales performance, product segments |
| Sales Summary | Monthly sales, order trends, growth metrics |

These reports simulate the type of **datasets used by BI dashboards**.

---

## Example Business Questions Answered

- Which products generate the highest revenue?
- How have sales evolved over time?
- Which customer segments contribute the most revenue?
- What categories drive the majority of total sales?
- Which products are high‑performers vs low‑performers?

---

## Project Structure

```
data-warehouse-analytics-project
│
├── datasets
│
├── scripts
│   ├── bronze
│   ├── silver
│   └── gold
│
├── analytics
│   ├── change_over_time_analysis.sql
│   ├── cumulative_analysis.sql
│   ├── performance_analysis.sql
│   ├── segmentation_analysis.sql
│   └── part_to_whole_analysis.sql
│
├── reporting
│   ├── customer_report.sql
│   ├── product_report.sql
│   └── sales_summary_report.sql
│
└── insights
    └── business_insights.md
```

---

## Skills Demonstrated

| Category | Skills |
|---------|-------|
| Data Engineering | Data cleaning, ETL logic, layered warehouse architecture |
| SQL Analytics | Aggregations, CTEs, Window Functions, Time Analysis |
| Data Modeling | Fact & Dimension design (Star Schema) |
| Business Analysis | Customer segmentation, product performance analysis |
| Reporting | Analytical SQL views for business reporting |

---

## Tools Used

- SQL (MySQL)
- Data Warehousing Concepts
- Window Functions
- Git & GitHub

---

## About Me

Hi, I'm **Anirudh**.

I built this project as part of my transition into a **Data Analyst role**, focusing on strengthening my skills in:

- SQL analytics
- data modeling
- data warehousing
- business analysis

---

## License

This project is licensed under the **MIT License**.
