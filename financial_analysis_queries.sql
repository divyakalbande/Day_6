SELECT * FROM day6.sales;
select min(Year) as Start_Date, max(Year) as End_sate
from sales;

select Year,`Month Name`, sum(`Sales`) as `Total Sales`, sum(`Profit`) as `Total Profit`
from sales
group by Year,`Month Name`
order by Year, MONTH(STR_TO_DATE(`Month Name`, '%M'));


SELECT Year, `Month Name`, SUM(`Units Sold`) AS Total_Units_Sold
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));
  
SELECT 
  Year,
  `Month Name`,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Gross_Margin_Percentage
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));

 SELECT 
	Product,
    SUM(Profit) AS Total_Profit
 FROM sales
 GROUP BY Product
 ORDER BY Total_Profit DESC
 LIMIT 5;
 
 SELECT 
  Country,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Country
ORDER BY Total_Sales DESC;

SELECT 
  Segment,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit,
  SUM(`Units Sold`) AS Total_Units
FROM sales
GROUP BY Segment
ORDER BY Total_Profit DESC;

SELECT 
  Year,
  `Month Name`,
  SUM(Discounts) AS Total_Discounts,
  SUM(Sales) AS Total_Sales,
  ROUND(SUM(Discounts) / SUM(`Gross Sales`) * 100, 2) AS Discount_Percentage
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));


SELECT *
FROM sales
WHERE Profit < 0
ORDER BY Profit ASC;


SELECT 
  Product,
  ROUND(SUM(Sales) / SUM(`Units Sold`), 2) AS Avg_Selling_Price
FROM sales
GROUP BY Product
ORDER BY Avg_Selling_Price DESC;


SELECT 
  Year,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Year
ORDER BY Year;
