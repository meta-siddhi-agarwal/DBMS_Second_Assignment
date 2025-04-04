-- Create a Stored procedure to retrieve average sales of each product 
-- in a month. Month and year will be input parameter to function.
CREATE DEFINER=`root`@`localhost` PROCEDURE `Avg_Sales`(IN Month_Product INT, IN Year_Product INT)
BEGIN
SELECT ((COUNT(OrderItem.ProductId))*Price /30) 
FROM Products
INNER JOIN OrderItem ON Products.ProductId=OrderItem.ProductId
INNER JOIN Orders ON OrderItem.OrderId=Orders.OrderId
GROUP BY (OrderItem.ProductId)
AND MONTH(OrderDate) = Month_Product 
AND YEAR(OrderDate) = Year_Product;
END

-- Create a stored procedure to retrieve table having order detail 
-- with status for a given period. Start date and end date will be input parameter.
--  Put validation on input dates like start date is less than end date.
--  If start date is greater than end date take first date of month as start date.
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_detail`(IN StartDate DATE,IN EndDate DATE)
BEGIN
DECLARE start Date;
IF startdate > enddate
THEN
SET startdate = date_format(startdate,'%Y-%m-01'); 
SELECT Orders.OrderId,OrderDate,OrderTotal,OrderStatus,Title
FROM Orders
INNER JOIN OrderItem ON Orders.OrderId=OrderItem.OrderId
INNER JOIN Products ON OrderItem.ProductId=Products.ProductId
AND OrderDate BETWEEN start AND EndDate;
ELSE
SELECT Orders.OrderId,OrderDate,OrderTotal,OrderStatus,Title
FROM Orders
INNER JOIN OrderItem ON Orders.OrderId=OrderItem.OrderId
INNER JOIN Products ON OrderItem.ProductId=Products.ProductId
AND OrderDate BETWEEN  startdate AND EndDate;
END IF;
END

  
call Avg_Sales(3,2025);
call order_detail(2,4);
