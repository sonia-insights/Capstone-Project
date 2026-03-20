select * from Blinkit_data ;

select count(*) from Blinkit_data;

update Blinkit_data
set Item_Fat_Content = 
case 
when Item_Fat_Content IN ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end 

select CAST(sum(Total_Sales)/1000000 as DECIMAL(10,2)) 
AS Total_Sales_Millions
From Blinkit_data
where Item_Fat_Content ='Low fat'

'''changing filter condition ''' 
where Outlet_Establishment_Year = 2022 

select distinct(item_fat_content) from Blinkit_data

select CAST(avg(Total_Sales) as DECIMAL(10,0)) AS avg_sales from Blinkit_data

select COUNT(*) AS NO_OF_ITEMS FROM Blinkit_data

'''changing filter condition ''' 
where Outlet_Establishment_Year = 2022 

select CAST(avg(Rating) as decimal(10,2) as Avg_Rating from Blinkit_data

'''GRANULAR REQUIREMENTS '''


SELECT Item_Fat_Content , 
	cast(sum(Total_Sales)/1000 as decimal(10,2)) as Total_Sales_Thousands 
	CAST(avg(Total_Sales) as DECIMAL(10,0)) AS avg_sales
	COUNT(*) AS NO_OF_ITEMS
	CAST(avg(Rating) as decimal(10,2) as Avg_Rating
from Blinkit_data 
	where Outlet_Establishment_Year = 2022 
group by Item_Fat_Content 
order by  Total_Sales DESC

SELECT TOP 5 Item_type, 
	cast(sum(Total_Sales)/1000 as decimal(10,2)) as Total_Sales
	CAST(avg(Total_Sales) as DECIMAL(10,0)) AS avg_sales
	COUNT(*) AS NO_OF_ITEMS
	CAST(avg(Rating) as decimal(10,2) as Avg_Rating
from Blinkit_data 
	where Outlet_Establishment_Year = 2022 
group by Item_type 
order by  Total_Sales ASC ('''AUTOMATICALLY COMES IN WORST 5''')

SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


SELECT Outlet_Establishment_Year, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC 

SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


SELECT Outlet_Location_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC
 

SELECT Outlet_Type, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC










