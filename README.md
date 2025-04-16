# Day_6
---
# 🧾 Financial Performance Report: SQL-Based Sales Analysis

## 📌 Executive Summary

This report presents an in-depth analysis of a company’s global sales and profitability performance using raw transactional data. The focus is to uncover trends, identify improvement areas, and provide actionable insights — powered entirely through SQL queries.

---

## 🎯 Business Goals

- 📈 Understand how **sales and profit** behave month-over-month.
- 🎯 Identify **top-performing products, countries, and segments**.
- 🧾 Evaluate the **impact of discounts** on overall profit.
- 🔍 Spot **loss-making transactions** or pricing inefficiencies.
- 📊 Enable **data-backed decisions** for product, pricing, and market strategy.

---

## 🧰 Methodology

The analysis was performed using MySQL Workbench. All queries were written in standard SQL to aggregate, group, and filter financial KPIs.

Key data dimensions analyzed:

- Time-based (Month, Year)
- Geography (Country)
- Category (Segment, Product)
- Metrics (Units Sold, Revenue, Profit, COGS, Discount)

---

## 🔎 Key Insights

| 💡 Insight | 🧠 What We Found |
|------------|------------------|
| **Q4 Spike** | December drives highest revenue, driven by volume + promotions. |
| **Discount Pressure** | Discounts reach up to **18%** of gross sales in peak months. |
| **Profit Leaders** | Only a few products generate **bulk of the profit**. |
| **Loss Zones** | Certain transactions generate **negative profit** due to deep discounts or mispricing. |
| **Segment Watch** | The **Government** and **Midmarket** segments yield stronger profit margins. |

---

## 📊 Visual Output Examples


## 🔸 1. Monthly Sales and Profit

```sql
SELECT 
  Year,
  `Month Name`,
  SUM(`Sales`) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));
```

📸 **Output:**

![Monthly Sales](/monthly_sales.png)

---

## 🔸 2. Monthly Units Sold

```sql
SELECT 
  Year,
  `Month Name`,
  SUM(`Units Sold`) AS Total_Units_Sold
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));
```

📸 **Output:**

![Units Sold](/units_sold.png)

---

## 🔸 3. Gross Margin Percentage (Monthly)

```sql
SELECT 
  Year,
  `Month Name`,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Gross_Margin_Percentage
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));
```

📸 **Output:**

![Gross Margin](/gross_margin.png)

---

## 🔸 4. Top 5 Products by Profit

```sql
SELECT 
  Product,
  SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;
```

📸 **Output:**

![Top Products](/top_products-profit.png)

---

## 🔸 5. Country-Wise Revenue and Profit

```sql
SELECT 
  Country,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Country
ORDER BY Total_Sales DESC;
```

📸 **Output:**

![Country Revenue](/country_revenue.png)

---

## 🔸 6. Segment-Wise Financial Performance

```sql
SELECT 
  Segment,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit,
  SUM(`Units Sold`) AS Total_Units
FROM sales
GROUP BY Segment
ORDER BY Total_Profit DESC;
```

📸 **Output:**

![Segment Performance](/segment_performance.png)

---

## 🔸 7. Discount Impact Over Time

```sql
SELECT 
  Year,
  `Month Name`,
  SUM(Discounts) AS Total_Discounts,
  SUM(Gross_Sales) AS Gross_Sales,
  ROUND(SUM(Discounts) / SUM(Gross_Sales) * 100, 2) AS Discount_Percentage
FROM sales
GROUP BY Year, `Month Name`
ORDER BY 
  Year,
  MONTH(STR_TO_DATE(`Month Name`, '%M'));
```

📸 **Output:**

![Discount Impact](/discount_imact.png)

---

## 🔸 8. Loss-Making Records (Profit < 0)

```sql
SELECT *
FROM sales
WHERE Profit < 0
ORDER BY Profit ASC;
```

📸 **Output:**

![Loss-Making Records](/loss_making.png)

---

## 🔸 9. Average Selling Price Per Unit (Product Level)

```sql
SELECT 
  Product,
  ROUND(SUM(Sales) / SUM(`Units Sold`), 2) AS Avg_Selling_Price
FROM sales
GROUP BY Product
ORDER BY Avg_Selling_Price DESC;
```

📸 **Output:**

![Average Price](/avg_selling_price.png)

---

## 🔸 10. Year-over-Year (YoY) Growth in Sales and Profit

```sql
SELECT 
  Year,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Year
ORDER BY Year;
```

📸 **Output:**

![YoY Growth](/yoy_growth.png)



---

## 🛠️ Tools & Tech Stack

| Tool           | Use Case                         |
|----------------|----------------------------------|
| **MySQL**      | Querying and aggregating data    |
| **Workbench**  | Writing and testing SQL          |
| **Excel/BI**   | Visualization and charting (optional) |
| **Markdown**   | Reporting and documentation      |

---

## 📣 Conclusion

The SQL-powered financial dashboard offers deep insight into what's working — and what’s not — in your global product strategy. With just structured queries and a raw dataset, this analysis provides the foundation for smarter business decisions.

---

```
