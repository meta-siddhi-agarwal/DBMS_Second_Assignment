USE StoreFont;

#query 1
SELECT OrderId, OrderDate, OrderTotal FROM Orders 
ORDER BY OrderDate DESC
LIMIT 50 ;

#query 2
SELECT OrderId, OrderDate, OrderTotal FROM ORDERS
ORDER BY OrderTotal DESC 
LIMIT 10;

#query3
SELECT Orders.OrderId, OrderDate, OrderTotal FROM Orders,OrderItem
WHERE  Orders.OrderId=OrderItem.OrderId AND OrderDate<(CURDATE()-10) 
AND (OrderStatus="Cancelled" OR OrderStatus="Returned" )
GROUP BY OrderItem.OrderId
HAVING COUNT(OrderItem.OrderId)>=1;

#query4
SELECT Name
FROM Shopper,Orders 
WHERE Shopper.ShopperId=Orders.ShopperId
AND OrderDate<(CURDATE()-58);

#query 4 using {JOIN} keyword
-- SELECT Name 
-- FROM Shopper
-- INNER JOIN Orders ON ;

#query5
SELECT Name,Shopper.ShopperId,OrderDate,OrderTotal,OrderId
FROM Shopper,Orders
WHERE Shopper.ShopperId=Orders.ShopperId
AND OrderDate>=(CURDATE()-15) AND OrderDate<=(CURDATE());

#query 5 using {JOIN} Keyowrd
SELECT Name,Shopper.ShopperId,OrderDate,OrderTotal,OrderId
FROM Shopper
INNER JOIN Orders
ON Shopper.ShopperId=Orders.ShopperId
AND OrderDate>=(CURDATE()-15) AND OrderDate<=(CURDATE());


#query6
SELECT Title FROM Products,OrderItem,Orders
WHERE Products.ProductId=OrderItem.ProductId
AND Orders.OrderId=OrderItem.OrderId 
AND OrderStatus="Shipped";

#query7
SELECT Title,OrderDate FROM Products,OrderItem,Orders
WHERE Products.ProductId=OrderItem.ProductId
AND Orders.OrderId=OrderItem.OrderId 
AND Price BETWEEN 20 AND 50;

#query7 using {JOIN} Keyword
SELECT Title,OrderDate
FROM Products
INNER JOIN OrderItem ON Products.ProductId=OrderItem.ProductId
INNER JOIN Orders ON Orders.OrderId=Orders.OrderId
AND Price BETWEEN 20 AND 50;
 