# 📈 Quantitative Stock Trend Analytics & Portfolio Optimization Engine

<p align="center">

![SQL](https://img.shields.io/badge/SQL-Database-blue?logo=mysql)
![Power BI](https://img.shields.io/badge/Power%20BI-Business%20Intelligence-yellow?logo=powerbi)
![DAX](https://img.shields.io/badge/DAX-Analytics-green)
![Finance](https://img.shields.io/badge/Finance-Quantitative%20Analysis-success)
![License](https://img.shields.io/badge/License-Academic-brightgreen)

**Financial Analytics • SQL • Power BI • Portfolio Optimization • Time-Series Analysis**

</p>

---

# Overview

This project presents an end-to-end **financial analytics pipeline** that combines **SQL-based data engineering** with **Power BI visualization** to analyze stock market trends and evaluate portfolio performance.

The system automates the computation of key financial indicators, identifies long-term market trends using moving averages, and visualizes portfolio performance through an interactive dashboard.

---

# Objectives

The project aims to:

- Build a structured financial database for historical stock market data.
- Automate computation of quantitative financial indicators.
- Detect trend reversals using moving average crossover strategies.
- Visualize stock performance through interactive dashboards.
- Analyze portfolio risk and return characteristics.

---

# Workflow

```
Historical Stock Data
          │
          ▼
      SQL Database
          │
          ▼
 Financial Feature Engineering
(Daily Returns • Volatility • MAs)
          │
          ▼
      Power BI Dashboard
          │
          ▼
 Portfolio Analytics &
 Investment Insights
```

---

# Key Features

### SQL Database Engineering

- Designed a relational SQL database to efficiently store historical stock market data.
- Performed data cleaning and preprocessing.
- Utilized SQL views and Common Table Expressions (CTEs) for reusable analytical queries.

---

### Financial Analytics

Automated calculation of several quantitative metrics including:

- Daily Returns
- Log Returns
- Rolling Volatility
- 50-Day Moving Average
- 200-Day Moving Average
- Trend Detection
- Golden Cross Signals
- Death Cross Signals

---

### Portfolio Optimization Dashboard

Developed an interactive Power BI dashboard providing:

- Portfolio Performance
- Historical Price Trends
- Moving Average Analysis
- Volatility Tracking
- Risk vs Return Comparison
- Dynamic Portfolio Allocation
- Stock-wise Performance Metrics

---

# Technologies Used

| Category | Tools |
|-----------|-------|
| Database | SQL, MySQL |
| Business Intelligence | Power BI |
| Analytics | DAX |
| Data Processing | SQL Window Functions |
| Visualization | Power BI Dashboards |

---

# SQL Concepts Used

- Common Table Expressions (CTEs)
- Window Functions
- PARTITION BY
- OVER()
- Aggregate Functions
- Views
- Joins
- Subqueries
- Ranking Functions

---

# Dashboard Preview

## Portfolio Intelligence Dashboard

<p align="center">
<img src="images/dashboard.png" width="900">
</p>

---

## Moving Average Trend Analysis

<p align="center">
<img src="images/moving_average.png" width="700">
</p>

---

## Portfolio Allocation

<p align="center">
<img src="images/portfolio.png" width="700">
</p>

---

# Project Structure

```
.
├── SQL/
│   ├── database.sql
│   ├── analysis_queries.sql
│
├── PowerBI/
│   ├── Portfolio Dashboard.pbix
│
├── Dataset/
│   ├── all_stocks.csv
│
├── images/
│   ├── dashboard.png
│   ├── moving_average.png
│   ├── portfolio.png
│
├── README.md
└── requirements.txt
```

---

# Business Insights

The dashboard enables users to:

- Monitor long-term stock trends.
- Detect bullish and bearish market reversals.
- Compare historical stock volatility.
- Analyze portfolio diversification.
- Evaluate investment performance using quantitative indicators.

---

# Skills Demonstrated

- SQL
- Database Design
- Window Functions
- Financial Analytics
- Power BI
- DAX
- Portfolio Optimization
- Time-Series Analysis
- Data Visualization
- Business Intelligence

---

# Future Improvements

- Integrate live market data APIs.
- Implement CAPM and Efficient Frontier optimization.
- Add Sharpe Ratio and Sortino Ratio analysis.
- Include Monte Carlo portfolio simulation.
- Deploy dashboard to Power BI Service.

---

# Author

**Aditya Garg**

B.Tech, Mechanical Engineering

Indian Institute of Technology Ropar

---

## License

This project is intended for academic and educational purposes.
