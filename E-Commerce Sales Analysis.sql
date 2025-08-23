## Sales & Revenue Analysis

-- Total Revenue
SELECT SUM(sales) AS total_revenue FROM superstore;

-- Monthly Revenue Trend 
SELECT month(order_date) AS month, SUM(sales) AS revenue
FROM superstore
GROUP BY month
ORDER BY month;

-- Average Order Value(AOV)
SELECT AVG(sales) AS average_order_value FROM superstore;

-- Revenue By Product Category
SELECT category, SUM(sales) AS category_revenue
FROM superstore
GROUP BY category
ORDER BY category_revenue DESC;

-- Top 5 Profitable Products
SELECT product_name, COUNT(*) AS units_sold
FROM superstore
GROUP BY product_name
ORDER BY units_sold DESC
LIMIT 5;

## Customer Behaviour & Segmentation

-- Top 10 Customers
SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Total Orders Ordered By Each Customer
SELECT customer_name, COUNT(order_id) AS total_orders
FROM superstore
GROUP BY 1
HAVING COUNT(order_id) > 1;

-- Total Amount of Sales Done To Customer
SELECT customer_name, SUM(sales) AS lifetime_value
FROM superstore
GROUP BY 1
ORDER BY lifetime_value DESC;

-- Customer Segmentation By Spend
SELECT customer_name,
  CASE
    WHEN SUM(sales) >= 10000 THEN 'High Value'
    WHEN SUM(sales) BETWEEN 5000 AND 9999 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS segment
FROM superstore
GROUP BY customer_name;

-- Top 5 Cities By Revenue
SELECT city, SUM(sales) AS city_revenue
FROM superstore
GROUP BY city
ORDER BY city_revenue DESC
LIMIT 5;

## Product & Inventory Insights

-- Low Stock Products
SELECT pname, qtyInStock
FROM products
WHERE 2 < 20
ORDER BY 2 asc;

-- Products With High Return
SELECT pcode, pname, COUNT(*) AS return_count
FROM products
GROUP BY 1,2
ORDER BY return_count DESC
LIMIT 5;

-- Sales By Sub_Category
SELECT Sub_category , COUNT(order_id) AS orders
FROM superstore
GROUP BY 1;

-- Manufacturer Performance
SELECT Manufacturer, COUNT(DISTINCT Product_Name) AS Product_Count, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Manufacturer
ORDER BY Total_Sales DESC;

-- Low Profit Orders
SELECT Order_ID, Product_Name, Profit
FROM superstore
WHERE Profit < 0
ORDER BY Profit ASC;

-- Sales vs Profit Correlation
SELECT Sales, Profit
FROM superstore
WHERE Sales > 0 AND Profit IS NOT NULL;

