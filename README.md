# Europe-Air-Traffic-Analysis-2025

## Project Overview

This project analyzes European airport traffic data to identify traffic trends, seasonal demand patterns, airport dependency, and country-level airport performance.

The complete workflow was handled using SQL for data cleaning and analysis, followed by Power BI for dashboard creation and business insight presentation. The final dashboard contains three pages: Executive Summary, Rankings & Network Performance, and Seasonal Traffic Analysis.

## Tools Used

* MySQL
* Power BI
* Power Query
* DAX
* SQL

## Project Workflow

1. Imported raw airport traffic data into MySQL.
2. Cleaned and prepared the dataset using SQL.
3. Removed unnecessary fields and handled missing/limited-value columns.
4. Created analytical SQL queries for traffic trends, rankings, growth, seasonality, and airport contribution.
5. Exported SQL-driven result tables for Power BI.
6. Built a 3-page interactive Power BI dashboard.
7. Added business insights to explain key traffic patterns.

## Dashboard Pages

### 1. Executive Summary

This page gives a high-level overview of European airport traffic.

Key elements:

* Total Flights: 17M
* Total Airports: 331
* Total Countries: 42
* Quarterly Traffic Trend
* Countries with Highest Q2 Traffic Growth
* Executive insights

Key finding: Q3 recorded the highest traffic volume, while Q2 showed the strongest quarter-over-quarter growth.

### 2. Rankings & Network Performance

This page focuses on country and airport rankings.

Key elements:

* Top 10 Countries by Air Traffic
* Top 10 Airports by Total Traffic
* Average Airport Traffic for Top Countries
* Most Contributing Airports in Country Traffic

Key findings:

* Spain recorded the highest total air traffic among European countries.
* Istanbul Airport ranked first by total airport traffic.
* Amsterdam Schiphol handled over 91% of its country's traffic, showing strong reliance on a single airport.
* Germany recorded the highest average traffic per airport among the analyzed European countries.
* Spain had the highest total traffic, but its average traffic per airport was lower than several other leading countries, indicating a more distributed airport network.

### 3. Seasonal Traffic Analysis

This page analyzes seasonal air traffic behavior across Europe.

Key elements:

* Quarter-over-Quarter Growth by Country
* Top 6 Countries Monthly Traffic
* Top Airports Driving Q2 Growth
* Seasonal insights

Key findings:

* Greece experienced the strongest seasonal surge, with +137% growth in Q2 before declining by 53% in Q4.
* Spain maintained the highest monthly traffic throughout the year.
* Most countries reached peak traffic during the summer months.
* Antalya, Catania, and Faro were among the airports contributing most to the seasonal increase in air traffic.

## Key Business Insights

* Spain was the busiest European country by total air traffic.
* Istanbul was the busiest airport by total traffic.
* Germany had the highest average traffic per airport among the leading countries.
* Amsterdam Schiphol contributed more than 91% of the Netherlands' total airport traffic, highlighting high airport dependency.
* Q2 and Q3 showed stronger air traffic activity, indicating clear seasonal demand.
* Greece showed the strongest seasonal traffic pattern among the analyzed countries.

## SQL Skills Demonstrated

* Data Cleaning
* Aggregate Functions
* CASE Statements
* CTEs
* Window Functions
* Date Functions
* Ranking Queries
* Quarter-over-Quarter Growth Analysis
* Percentage Contribution Analysis
* Average Traffic per Airport Calculation
* Grouping and Filtering

## Power BI Skills Demonstrated

* KPI Cards
* Bar Charts
* Line Charts
* Combo Charts
* Slicers
* Dashboard Page Design
* Data Modeling
* Power Query
* DAX Measures
* Business Insight Presentation

## Files Included

* `01_Data_Cleaning.sql` — SQL script used for cleaning and preparing the dataset.
* `02_Analysis_Queries.sql` — SQL queries used to generate analysis tables.
* `Dashboard & Visualizations.pdf` — Exported Power BI dashboard report.
* `Europe Airport Traffic Dashboard.pbix` — Power BI dashboard file.
* `README.md` — Project documentation.

## Conclusion

This project demonstrates an end-to-end data analytics workflow using SQL and Power BI. The analysis goes beyond simple rankings by identifying traffic seasonality, airport dependency, country-level performance, and airport utilization patterns across Europe.

The dashboard helps users understand not only which countries and airports handle the most traffic, but also how traffic changes over time and how airport networks differ across countries.
