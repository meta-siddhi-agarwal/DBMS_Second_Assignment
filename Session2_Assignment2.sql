#query 1
SELECT Products.ProductId, Title,Cat_Title,Price 
FROM Products
INNER JOIN Product_Category ON Products.ProductId=Product_Category.ProductId
INNER JOIN Category ON Product_Category.Cat_Id=Category.Cat_Id
AND Product_status="Active"
Order By AddedAt DESC;

#query 2
SELECT DISTINCT Title 
FROM Products,Image 
WHERE Title NOT IN
(SELECT DISTINCT Title 
FROM Products,Image 
WHERE Products.ProductId=Image.ProductId);

#query 2 using {JOIN} keyword
SELECT DISTINCT Title
FROM Products
INNER JOIN Image 
WHERE Title NOT IN
(SELECT DISTINCT Title
FROM Products
INNER JOIN Image ON Products.ProductId=Image.ProductId);

#query 3
SELECT Left_Table.Cat_Id AS Id, Left_Table.Cat_Title AS Title, IFNULL(Right_Table.Cat_Title,"Top Category") AS Parent_Category
FROM Category AS Left_Table
LEFT JOIN
Category AS Right_Table
ON Left_Table.Parent_Cat_Id=Right_Table.Cat_Id;

#query 4
SELECT Left_Table.Cat_Id AS Id, Left_Table.Cat_Title AS Title, Right_Table.Cat_Title AS Parent_Category
FROM Category AS Left_Table
INNER JOIN
Category AS Right_Table
ON Left_Table.Parent_Cat_Id=Right_Table.Cat_Id
AND NOT Left_Table.Cat_Id=Right_Table.Cat_Id;

#query 5
SELECT Title, Price, Description 
FROM Products ,Category ,Product_Category
WHERE 
Products.ProductId=Product_Category.ProductId 
AND Category.Cat_Id=Product_Category.Cat_Id;

#query 5 using {JOIN} Keyword
SELECT Title, Price, Description
FROM Products
INNER JOIN Product_Category ON Products.ProductId=Product_Category.ProductId
INNER JOIN Category ON Product_Category.Cat_Id=Category.Cat_Id;

#query 6
SELECT Title FROM Products
WHERE Quantity<50;
