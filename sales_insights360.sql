# 1. What is the Total revenue in million from starting year till to date?
SELECT sum(sales_amount)/1000000 AS Total_Revenue 
FROM sales.transactions;

# 2. What is the Total sales quantity in million from starting year till to date?
SELECT sum(sales_qty)/1000000 AS Total_Sales_qty 
FROM sales.transactions;

# 3. What is the Total profit margin in million from starting year till to date?
SELECT sum(profit_margin)/1000000 AS Total_profit_margin 
FROM sales.transactions;

# 4. List down Top 5 customer in Revenue in the year 2020?
SELECT custmer_name, sum(sales_amount)/1000000 As Revenue 
FROM transactions t
JOIN customers c ON c.customer_code = t.customer_code
JOIN date d ON d.date = t.order_date
WHERE d.year = 2020
GROUP BY custmer_name
ORDER BY revenue DESC
LIMIT 5;

#5. List down Top 5 Market in Revenue in the year 2020?
SELECT markets_name, sum(sales_amount)/1000000 As Revenue 
FROM transactions t
JOIN markets m ON t.market_code = m.markets_code
JOIN date d ON d.date = t.order_date
WHERE d.year = 2020
GROUP BY markets_name
ORDER BY Revenue DESC
LIMIT 5;

#6.List down revenue in percentage contributed by different customers from starting date till to date.
SELECT customer_type, 
(sum(sales_amount)/(select sum(sales_amount) from transactions))*100 AS
Revenue_percentage
FROM transactions t
JOIN customers c 
ON c.customer_code = t.customer_code
GROUP BY customer_type;

#7.List down revenue in percentage contributed by different market zone from starting date till to date.
SELECT zone, 
(sum(sales_amount)/(select sum(sales_amount) from transactions))*100 AS
Revenue_percentage
from transactions t
JOIN markets m 
ON m.markets_code = t.market_code
GROUP BY zone