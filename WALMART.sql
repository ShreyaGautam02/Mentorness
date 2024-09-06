#1
#Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').

SELECT 
    *
FROM
    WALMARTDATA
WHERE
    BRANCH = 'A';
  #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
#2
#Find the total sales for each product line.

SELECT 
    PRODUCT_LINE, ROUND(SUM(TOTAL), 2) AS TOTAL_SALES
FROM
    WALMARTDATA
GROUP BY PRODUCT_LINE;

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#3
#List all sales transactions where the payment method was 'Cash'.

SELECT 
    *
FROM
    WALMARTDATA
WHERE
    PAYMENT = 'CASH';
  #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  #4
  #Calculate the total gross income generated in each city.
  
SELECT 
    CITY,
    ROUND(SUM(GROSS_INCOME), 2) AS Total_gross_income_generated
FROM
    walmartdata
GROUP BY CITY;
    #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #5
    #Find the average rating given by customers in each branch.
    
    SELECT 
    BRANCH, ROUND(AVG(RATING), 2) AS average_rating_by_customers
FROM
    WALMARTDATA
GROUP BY BRANCH;

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#6
#Determine the total quantity of each product line sold.

SELECT 
    PRODUCT_LINE, SUM(QUANTITY) AS Total_Quantity_sold
FROM
    walmartdata
GROUP BY product_line;

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#7
#List the top 5 products by unit price.

SELECT 
    PRODUCT_LINE, UNIT_PRICE
FROM
    WALMARTDATA
ORDER BY UNIT_PRICE
LIMIT 5;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#8
#Find sales transactions with a gross income greater than 30.

SELECT 
    *
FROM
    WALMARTDATA
WHERE
    GROSS_INCOME > 30;
    
   #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #9
    #Retrieve sales transactions that occurred on weekends.
    
   SELECT 
    *,
    CASE
        WHEN Date = 1 THEN 'SUNDAY'
        WHEN Date = 7 THEN 'SATURDAY'
    END AS Weekday_name
FROM
    walmartdata
WHERE
    Date IN (1 , 7);

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#10
#Calculate the total sales and gross income for each month.

SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%m') AS Month,
    ROUND(SUM(Total), 2) AS Total_sales,
    ROUND(SUM(gross_income), 2) AS Total_gross_income
FROM
    walmartdata
GROUP BY DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%m')
ORDER BY month;

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#11
#Find the number of sales transactions that occurred after 6 PM.

SELECT 
    COUNT(*) AS No_Transactions_after_6pm
FROM
    walmartdata
WHERE
    TIME(Time) > '18:00:00';

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#12
#List the sales transactions that have a higher total than the average total of all transactions. 
SELECT 
    *
FROM
    walmartdata
WHERE
    total > (SELECT 
            AVG(total)
        FROM
            walmartdata);


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#13
#Calculate the cumulative gross income for each branch by date.

SELECT 
Branch, Date, gross_income, round(sum(gross_income) 
 OVER (PARTITION BY Branch 
ORDER BY Date),2)
AS Cumulative_Gross_Income
FROM 
 walmartdata
ORDER BY 
 Branch, Date;

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#14 
#Find the total cogs for each customer type in each city.
SELECT CUSTOMER_TYPE, CITY ,ROUND(SUM( COGS),2) AS TOTAL_COGS
FROM WALMARTDATA
GROUP BY CUSTOMER_TYPE, CITY;


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------












    