# Indian Aviation Performance Dashboard ✈️

## 📌 Project Overview

This project analyzes the performance of Indian airlines using data analysis, SQL, and Power BI.

The objective is to understand airline operational performance, on-time performance (OTP), flight cancellations, scheduled flights, operating days, and average flight duration for the period **January to May 2024**.

The project follows an end-to-end data analytics workflow:

**Python → SQL → Power BI**

---

## 🎯 Business Objectives

The main objectives of this project are:

- Analyze airline On-Time Performance (OTP)
- Identify airlines with higher cancellation rates
- Compare scheduled and cancelled flights
- Analyze average flight duration by airline
- Compare average operating days per week
- Analyze monthly OTP trends
- Identify differences in operational performance across airlines
- Build an interactive dashboard for business insights

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and exploratory data analysis |
| Pandas | Data manipulation and transformation |
| NumPy | Numerical operations |
| SQL | Data querying and business analysis |
| Power BI | Interactive dashboard and visualization |
| Power Query | Data transformation |
| DAX | KPI calculations and measures |

---

## 🔄 Project Workflow

### 1. Data Collection
Collected airline operational data containing information related to flights, OTP, cancellations, and airline performance.

### 2. Data Cleaning using Python

Python was used to:

- Load the dataset
- Inspect the data
- Handle missing values
- Clean and transform columns
- Perform exploratory data analysis
- Prepare the dataset for SQL and Power BI

### 3. SQL Analysis

SQL was used to perform business-oriented analysis such as:

- Total scheduled flights
- Total cancelled flights
- Airline-wise OTP
- Airline-wise cancellation rate
- Average flight duration
- Average operating days
- Monthly performance analysis

### 4. Power BI Dashboard

The cleaned and analyzed data was imported into Power BI to create an interactive dashboard.

The dashboard contains:

- KPI cards
- Airline-wise OTP analysis
- Scheduled flights comparison
- Cancelled flights comparison
- Cancellation rate analysis
- Average flight duration
- Average operating days
- Monthly OTP trend
- OTP vs cancellation rate analysis
- Airline slicer for interactive filtering

---

## 📊 Key KPIs

The dashboard tracks the following major KPIs:

- **Total Airlines**
- **Total Scheduled Flights**
- **Total Cancelled Flights**
- **Average OTP (%)**
- **Overall Cancellation Rate (%)**

---

## 📈 Dashboard Pages

### Page 1 — Airline Performance Overview

This page provides a high-level overview of airline performance through KPI cards and multiple airline-wise visualizations.

It includes:

- Airline-wise Average OTP
- Scheduled Flights by Airline
- Average Operating Days per Week
- Cancellation Rate by Airline
- Cancelled Flights by Airline
- Average Flight Duration

### Page 2 — Detailed Performance Analysis

This page focuses on deeper performance analysis through:

- Monthly On-Time Performance
- Airline OTP vs Cancellation Rate

These visuals help identify monthly trends and the relationship between airline OTP and cancellation rates.

---

## 💡 Business Insights

The dashboard helps answer questions such as:

1. Which airlines have the highest On-Time Performance?
2. Which airlines have the highest cancellation rate?
3. Which airline operates the most scheduled flights?
4. Which airlines have the highest number of cancelled flights?
5. How does OTP change from January to May?
6. Which airlines have longer average flight durations?
7. Is there a relationship between OTP and cancellation rate?

---

## 📷 Dashboard Preview

### Page 1
![Dashboard Page 1](Screenshots/page1.png)

### Page 2
![Dashboard Page 2](Screenshots/page2.png)

---

## 📂 Project Structure

```text
Indian-Aviation-Performance-Dashboard/
│
├── README.md
│
├── Python/
│   └── data_analysis.py
│
├── SQL/
│   └── aviation_analysis.sql
│
├── PowerBI/
│   └── Indian_Aviation_Performance_Dashboard.pbix
│
├── Dataset/
│   └── aviation_data.csv
│
└── Screenshots/
    ├── page1.png
    └── page2.png
