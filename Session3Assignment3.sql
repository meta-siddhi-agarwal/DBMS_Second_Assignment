USE StoreFont;
DESC orderitem;
SELECT * FROM orderitem;

#query1
SELECT Shopper.ShopperId, Name, MobileNumber,Dob,Gender,
COUNT(Orders.ShopperId)AS Number_Of_Orders
FROM Shopper,Orders
WHERE Shopper.ShopperId=Orders.ShopperId
AND OrderDate BETWEEN  CURDATE()-30 AND CURDATE()
GROUP BY Orders.ShopperId;

#query2
SELECT Name 
FROM Shopper,Orders 
WHERE Shopper.ShopperId=Orders.ShopperId
GROUP BY Orders.ShopperId 
ORDER BY Sum(OrderTotal) DESC
LIMIT 10
;

#query3
SELECT Title,COUNT(OrderItem.ProductId) AS NumberOfTimesOrdered
FROM Products,OrderItem,Orders
WHERE Products.ProductId=OrderItem.ProductId
AND Orders.OrderId=OrderItem.OrderId
AND OrderDate BETWEEN (CURDATE()-60) AND CURDATE()
GROUP BY OrderItem.ProductId
ORDER BY COUNT(OrderItem.ProductId) DESC
LIMIT 20;

#query4
SELECT MONTHNAME(OrderDate), SUM(Price*OrderItem.Quantity) AS Monthly_Sales
FROM Products,OrderItem,Orders
WHERE Products.ProductId=OrderItem.ProductId
AND Orders.OrderId=OrderItem.OrderId
GROUP BY MONTHNAME(OrderDate);

#query5
UPDATE  Products SET Product_Status="Inactive"
WHERE ProductId IN(
SELECT Products.ProductId FROM Products,Orders,OrderItem
WHERE Products.ProductId=OrderItem.ProductId
AND Orders.OrderId=OrderItem.OrderId
AND OrderDate NOT BETWEEN CURDATE()-90 AND CURDATE());

#query6
SELECT Title FROM Products,Product_Category,Category
WHERE Products.ProductId=Product_Category.ProductId
AND Category.Cat_Id=Product_Category.Cat_Id
AND Title LIKE "%%";

#query7
SELECT Title FROM Products,OrderItem
WHERE Products.ProductId=OrderItem.ProductId
AND OrderStatus="Cancelled"
GROUP BY OrderItem.ProductId
ORDER BY (COUNT(OrderItem.ProductId)) DESC;
