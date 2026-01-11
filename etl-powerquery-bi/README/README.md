# Product Profitability Analysis  
**Power BI · SQL · Azure SQL**

## 📌 Business Problem
The objective of this project is to analyze product-level profitability by combining sales and cost data, identify loss-making products, and determine break-even points at a monthly level.

The analysis focuses on answering the following business questions:
- Which products generate losses?
- How do fixed and variable costs impact net profitability?
- At what revenue level does the business reach break-even?

---

## 📊 Data Sources
The analysis is based on three raw data sources:
- `sales_raw.csv` – transactional sales data
- `costs_raw.csv` – fixed and variable cost data
- `products.csv` – product master data

Raw files are stored unchanged to preserve data lineage.

---

## 🔄 Data Preparation & ETL
Data preparation was performed using **Power Query (M)** for validation and initial shaping.  
The transformation logic was then replicated in **Azure SQL Database** to simulate a production-ready analytical environment.

ETL steps include:
- Monthly aggregation of sales data
- Separation and allocation of fixed and variable costs
- Product-level cost attribution
- Calculation of profitability metrics

---

## 🗄️ Data Modeling (SQL Layer)
An analytical star schema was designed in SQL, consisting of:
- **Fact table:** Monthly profitability
- **Dimensions:** Product and Date

SQL views were created to centralize business logic:
- Monthly profitability view
- Loss-making products view
- Break-even analysis view

This approach ensures that calculations are handled at the database level, while Power BI acts as the semantic and visualization layer.

---

## 📈 Power BI Dashboard
The Power BI report connects directly to the SQL analytical layer and consists of three main pages:

1. **Executive Summary**  
   High-level KPIs including revenue, total cost, net profit, and margin trends.

2. **Loss-Making Products**  
   Identification of products with negative net profit to support cost and pricing decisions.

3. **Break-Even Analysis**  
   Comparison of revenue versus fixed and variable costs to determine profitability thresholds.

All key metrics are implemented using DAX measures on top of the SQL model.

---

## 🔍 Key Insights
- Several products consistently generate negative net profit.
- Fixed costs significantly impact profitability at lower revenue levels.
- Revenue growth alone does not guarantee profitability without cost optimization.

---

## 🛠️ Tools & Technologies
- **Power BI** (Power Query, DAX, Visualization)
- **SQL** (Analytical modeling, views, transformations)
- **Azure SQL Database** (cloud-based analytical environment)

---

## 📂 Project Structure
├── data_raw/          # Raw CSV files (unchanged)
│   ├── sales_raw.csv
│   ├── costs_raw.csv
│   └── products.csv
│
├── sql/               # SQL schema and analytical views
│   ├── schema.sql
│   ├── views.sql
│   └── README.md
│
├── powerbi/           # Power BI report
│   └── product_profitability.pbix
│
└── README.md

---

## ✅ Outcome
This project demonstrates an end-to-end analytical workflow, from raw data ingestion to cloud-based SQL modeling and executive-level reporting in Power BI, enabling clear visibility into product profitability, loss-making products, and break-even thresholds to support strategic pricing and cost decisions.
