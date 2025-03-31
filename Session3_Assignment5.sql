USE StoreFont;

#created view named orderitem for  retrieving data which acts as temp. table
CREATE VIEW OrderInfo
AS
SELECT Orders.ShopperId, Price, Title, Name, OrderDate, OrderStatus
FROM Shopper
INNER JOIN Orders ON Orders.ShopperId=Shopper.ShopperId
INNER JOIN OrderItem ON OrderItem.OrderId=Orders.OrderId
INNER JOIN Products ON Products.ProductId=OrderItem.ProductId
WHERE
OrderDate BETWEEN (CURDATE()-60) AND CURDATE()
ORDER BY OrderDate DESC;

#query2
SELECT Title FROM OrderInfo WHERE OrderStatus="Shipped";

#query3
SELECT Title, SUM(Price) FROM OrderInfo 
GROUP BY Title
ORDER BY (SUM(Price)) DESC;
