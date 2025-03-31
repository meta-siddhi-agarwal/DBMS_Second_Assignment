USE StoreFont;

-- creating index for orders table
CREATE INDEX Index_Orders 
ON Orders(ShopperId, OrderDate,OrderTotal);

-- creating index for products table
CREATE INDEX Index_Products
ON Products(Title, Price, AddedAt);

-- creating index for category table
CREATE INDEX Index_Category
ON Category(Cat_Title, Parent_Cat_Id);