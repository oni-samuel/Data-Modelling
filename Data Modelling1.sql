-- Retrieve all properties
SELECT * FROM property;

-- Find all transactions in 2023
SELECT * FROM transactions
WHERE EXTRACT(YEAR FROM transaction_date) = 2023;


-- Count transactions per year
SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year, 
    COUNT(*) AS total_transactions 
FROM transactions
GROUP BY year
ORDER BY year;

--- Average sale price per city
SELECT city, AVG(saleprice) AS average_price FROM location
JOIN transactions ON location.locationid = transactions.locationid
GROUP BY city
ORDER BY city


-- List properties sold with city and agent name
SELECT p.propertyname,l.city,a.agentname, t.saleprice 
FROM transactions t
JOIN property p ON t.propertyid = p.propertyid
JOIN agent a ON t.agentid = a.agentid
JOIN location l ON t.locationid = l.locationid;

-- Transactions where agent's name contains 'John'
SELECT *
FROM transactions t
JOIN agent a ON t.agentid = a.agentid
WHERE a.agentname ILIKE '%john%';

-- Agents with more than 10 transactions
SELECT a.agentid, a.agentname, COUNT(*) AS total_sales 
FROM transactions t
JOIN agent a ON t.agentid = a.agentid
GROUP BY a.agentid, a.agentname
HAVING COUNT(*) > 10
ORDER BY total_sales DESC;

---- Rank transactions by SalePrice within each city
SELECT transactionid, saleprice,l.City,
    RANK() OVER (PARTITION BY l.City ORDER BY t.SalePrice DESC) AS rank
FROM transactions t
JOIN location l ON l.locationid = t.locationid;

-- Cumulative sum of sales per year
SELECT Year, SalePrice, SUM(SalePrice) OVER (PARTITION BY Year ORDER BY Date) AS cumulative_sales
FROM transactions t
JOIN date ON t.transaction_Date = date.transaction_date;

-- Categorize properties by age
SELECT PropertyName, YearBuilt, 
	CASE 
		WHEN yearbuilt < 2000 THEN 'old'
		WHEN yearbuilt BETWEEN 2000 AND 2015 THEN 'moderate'
		ELSE 'new'
	END AS category
FROM property;


-- Highest sale price per agent and city
SELECT a.AgentName, l.City, MAX(t.SalePrice) AS max_sale_price
FROM transactions t
JOIN agent a ON t.AgentID = a.AgentID
JOIN location l ON t.Locationid = l.Locationid
GROUP BY a.AgentName, l.City;

--Identify the Most Profitable Cities Over the Last 5 Years
SELECT 
    l.city, 
    SUM(t.saleprice) AS total_sales
FROM transactions t
JOIN location l ON t.locationid = l.locationid
WHERE transaction_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY l.city
ORDER BY total_sales DESC
LIMIT 10;

















































