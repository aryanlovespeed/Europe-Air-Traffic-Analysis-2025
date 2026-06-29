-- quarterly Traffic Trends --

 WITH table_a AS
 (SELECT *,
	LAG(total_traffic) OVER(ORDER BY qtr ASC ) AS previous_quarter_traffic
 FROM 
(SELECT QUARTER(`date`) qtr,
	SUM(flt_total) AS total_traffic
FROM airport2
	GROUP BY QUARTER(`date`) ) x)
    
SELECT *,
	((total_traffic - previous_quarter_traffic) / previous_quarter_traffic ) * 100 AS percentage_growth
FROM table_a;

-- Top Countries with Q2 Growth --

 WITH table_a AS
 (SELECT *,
	LAG(total_traffic) OVER(PARTITION BY country_name ORDER BY qtr ASC ) AS previous_quarter_traffic
 FROM 
(SELECT QUARTER(`date`) qtr, country_name,
	SUM(flt_total) AS total_traffic
FROM airport2
	GROUP BY QUARTER(`date`), country_name ) x)

SELECT *,
	(total_traffic - previous_quarter_traffic) AS difference,
	((total_traffic - previous_quarter_traffic) / previous_quarter_traffic ) * 100 AS percentage_growth,
    DENSE_RANK() OVER(ORDER BY (total_traffic - previous_quarter_traffic) DESC ) AS ranking
FROM table_a
		WHERE  (total_traffic - previous_quarter_traffic) > 50000 AND qtr = 2;
        
-- Top 10 countries Air Traffic --

SELECT country_name,
	SUM(flt_total) AS total_traffic,
    DENSE_RANK() OVER(ORDER BY SUM(flt_total) DESC) AS rankings
FROM airport2
	GROUP BY country_name
    LIMIT 10;
    
-- Top 10 Airports by Total Traffic --

 SELECT *,
	DENSE_RANK() OVER(ORDER BY total_traffic DESC) AS rankings
 FROM 
(SELECT country_name, airport_name,
	SUM(flt_total) AS total_traffic
FROM airport2
	GROUP BY country_name, airport_name) x
LIMIT 10;

-- Average Airport Rush of Top 5 countries --

SELECT country_name,
	COUNT(DISTINCT airport_name) AS Total_airports,
    SUM(flt_total) AS Total_traffic,
    (SUM(flt_total) / COUNT(DISTINCT airport_name)) AS avg_airport_traffic
FROM airport2
GROUP BY country_name
ORDER BY SUM(flt_total) DESC
LIMIT 5;

-- Most Contributing Airport in Countries Air Traffic --

WITH table_a AS
(SELECT country_name,
	airport_name,
    SUM(flt_total) AS Total_traffic
FROM airport2
	GROUP BY country_name, airport_name),
table_b AS
(SELECT *,
	SUM(Total_traffic) OVER(PARTITION BY country_name) AS country_total
FROM table_a),
table_c AS
(SELECT *,
	(Total_traffic / country_total) * 100 AS percentage_contribution,
    COUNT(*) OVER(PARTITION BY country_name) AS Total_airports
FROM table_b),
table_d AS
(SELECT *,
	DENSE_RANK() OVER(ORDER BY percentage_contribution DESC) AS rankings
FROM table_c
WHERE Total_airports >=3 AND country_total > 100000)

SELECT *
FROM table_d
	WHERE rankings <= 5;

-- Quarter-over-Quarter growth by country(%) --

WITH table_a AS
(SELECT *,
	LAG(total_flights) OVER(PARTITION BY country_name ORDER BY qtr ) AS previous_qtr_flights
FROM 
(SELECT country_name, QUARTER(`date`) qtr,
	SUM(flt_total) AS total_flights
FROM airport2
	GROUP BY country_name, QUARTER(`date`)
ORDER BY country_name)  x),
table_b AS
(SELECT *,
	(total_flights - previous_qtr_flights) AS difference,
	((total_flights - previous_qtr_flights) / previous_qtr_flights) * 100 AS growth_percentage
FROM table_a)

SELECT qtr,
	SUM(CASE WHEN country_name = 'Greece' THEN growth_percentage END) AS Greece,
    SUM(CASE WHEN country_name = 'Türkiye' THEN growth_percentage END) AS Türkiye,
    SUM(CASE WHEN country_name = 'Italy' THEN growth_percentage END) AS Italy,
    SUM(CASE WHEN country_name = 'Germany' THEN growth_percentage END) AS Germany,
    SUM(CASE WHEN country_name = 'France' THEN growth_percentage END) AS France,
    SUM(CASE WHEN country_name = 'United Kingdom' THEN growth_percentage END) AS United_kingdom,
    SUM(CASE WHEN country_name = 'Spain' THEN growth_percentage END) AS spain
FROM table_b
	GROUP BY qtr;
    
-- Top 6 Countries Monthly Traffic --

WITH table_a AS
(SELECT country_name, MONTH(`date`) AS months,
	SUM(flt_total) AS total_traffic
FROM airport2
	WHERE country_name IN ('United Kingdom','Germany','France','Italy','Spain','Türkiye')
	GROUP BY country_name, months)
    
SELECT months,
	SUM(CASE WHEN country_name = 'United Kingdom' THEN total_traffic END) AS United_kingdom,
    SUM(CASE WHEN country_name = 'Germany' THEN total_traffic END) AS Germany,
    SUM(CASE WHEN country_name = 'France' THEN total_traffic END) AS France,
    SUM(CASE WHEN country_name = 'Italy' THEN total_traffic END) AS Italy,
    SUM(CASE WHEN country_name = 'Spain' THEN total_traffic END) AS Spain,
    SUM(CASE WHEN country_name = 'Türkiye' THEN total_traffic END) AS Türkiye
FROM table_a
GROUP BY months;

-- Top Airport Growth in Quarter 2--

WITH table_a AS
(SELECT *,
	LAG(Total_traffic) OVER(PARTITION BY airport_name ORDER BY quarters ASC) AS previous_quarter_total
FROM 
(SELECT country_name, QUARTER(`date`) AS quarters, airport_name,
	SUM(flt_total) AS Total_traffic
FROM airport2
	GROUP BY country_name, QUARTER(`date`), airport_name) x),
table_b AS
(SELECT *,
	((Total_traffic - previous_quarter_total) / previous_quarter_total) * 100 AS growth_percentage,
    (Total_traffic - previous_quarter_total) AS difference
FROM table_a
WHERE Total_traffic > 20000 AND quarters = 2
ORDER BY growth_percentage DESC
LIMIT 10
 )

SELECT *
FROM table_b;

