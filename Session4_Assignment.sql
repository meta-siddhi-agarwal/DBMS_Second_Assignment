SHOW DATABASES;

USE StoreFont;

#function to cal. no. of orders in a month
DELIMITER $$
CREATE FUNCTION Cal_No_Of_Orders_In_Month(Month_Order INT, Year_Order INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE No_Of_Orders INT;
SELECT COUNT(OrderId) INTO No_Of_Orders FROM ORDERS
WHERE MONTH(orderdate) = Month_Order 
AND YEAR(orderdate) = Year_Order
GROUP BY MONTH(orderdate)
ORDER BY MONTH(orderdate);
RETURN No_Of_Orders;
END $$
DELIMITER;

#function for cal. month which have the max orders provided year
DELIMITER $$
CREATE FUNCTION Month_Max_Orders(Year_Max_Order INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE Month_Max_Order INT;
SELECT MONTH(OrderDate) INTO Month_Max_Order
FROM ORDERS
WHERE YEAR(OrderDate)=Year_Max_Order
GROUP BY MONTH(OrderDate)
ORDER BY COUNT(OrderId) DESC
LIMIT 1;
RETURN Month_Max_Order;
END $$
DELIMITER ;
