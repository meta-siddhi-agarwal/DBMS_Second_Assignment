-- insertion into admin table
INSERT INTO Admin VALUES(1,"John Smith");

INSERT INTO Admin VALUES(2,"Jane Doe");

INSERT INTO Admin VALUES(3,"Richard Roe");

-- insertion into shopper table
INSERT INTO Shopper VALUES (101,"Alice Brown","9876543210","1990-05-14","Female");

INSERT INTO Shopper VALUES (102,"Bob Green","9123456789","1985-09-22","Male");

INSERT INTO Shopper VALUES (103,"Chris White","8123456780","1995-03-11","Male");

INSERT INTO Shopper VALUES (104,"Diana Black","7123456781","1988-07-30","Female");

-- insertion into address table
INSERT INTO Address VALUES(101,"123 Elm Street","Hyderabad","Telangana","India","500001");

INSERT INTO Address VALUES(102,"456 Oak Avenue","Chennai","Tamil Nadu","India","600002");

INSERT INTO Address VALUES(103,"789 Pine Road","Mumbai","Maharashtra","India","400003");

INSERT INTO Address VALUES(104,"101 Maple Lane","Kolkata","West Bangal","India","700004");

-- insertion into products table
INSERT INTO Products (ProductId, Title, Quantity, Price, Description, Product_Status, AddedAt)
VALUES
    (1, 'Laptop', 10, 70000, 'High-end gaming laptop', 'Active', '2025-03-01'),
    (2, 'Smartphone', 25, 25000, 'Latest model smartphone', 'Active', '2025-03-10'),
    (3, 'Headphones', 50, 3000, 'Noise-cancelling device', 'Active', '2025-03-20'),
    (4, 'Smartwatch', 15, 15000, 'Fitness tracking watch', 'Active', '2025-03-25'),
    (5, 'Tablet', 20, 30000, 'Lightweight tablet device', 'Inactive', '2025-04-01'),
    (6, 'Gaming Console', 8, 40000, 'Next-gen gaming console', 'Active', '2025-04-05'),
    (7, 'Keyboard', 30, 2000, 'Mechanical keyboard', 'Active', '2025-04-07'),
    (8, 'Monitor', 12, 15000, 'High-resolution monitor', 'Inactive', '2025-04-09');
    
-- insertion into image table
INSERT INTO Image (ProductId, ImageUrl)
VALUES
    (1, 'laptop.jpg'),
    (2, 'smartphone.jpg'),
    (3, 'headphones.jpg'),
    (4, 'smartwatch.jpg'),
    (5, 'tablet.jpg'),
    (6, 'gaming_console.jpg'),
    (7, 'keyboard.jpg'),
    (8, 'monitor.jpg');
    
-- insertion into category table
INSERT INTO Category (Cat_Id, Cat_Title, Parent_Cat_Id)
VALUES
    (1, 'Electronics', NULL),
    (2, 'Laptops', 1),
    (3, 'Smartphones', 1),
    (4, 'Wearables', 1),
    (5, 'Home Appliances', NULL),
    (6, 'Refrigerators', 5),
    (7, 'Washing Machines', 5),
    (8, 'Televisions', 5);
    
-- insertion into Product_Category table
INSERT INTO Product_Category (ProductId, Cat_Id)
VALUES
    (1, 2), -- Laptop belongs to Laptops category
    (2, 3), -- Smartphone belongs to Smartphones category
    (3, 4), -- Headphones belong to Wearables category
    (4, 4), -- Smartwatch belongs to Wearables category
    (5, 1), -- Tablet belongs to Electronics category
    (6, 1), -- Gaming Console belongs to Electronics category
    (7, 1), -- Keyboard belongs to Electronics category
    (8, 1); -- Monitor belongs to Electronics category
   
-- insertion into orders table
INSERT INTO Orders (ShopperId, OrderDate, OrderTotal, OrderId)
VALUES
    (101, '2025-03-15', 95000, 5001),
    (102, '2025-03-20', 25000, 5002),
    (103, '2025-03-22', 3000, 5003),
    (104, '2025-03-27', 15000, 5004),
    (101, '2025-04-01', 45000, 5005),
    (102, '2025-04-03', 12000, 5006),
    (103, '2025-04-05', 8000, 5007),
    (104, '2025-04-07', 20000, 5008);
    
-- insertion into OrderItem  table
INSERT INTO OrderItem (OrderId, OrderStatus, OrderItemId, Quantity, ProductId)
VALUES
    (5001, 'Shipped', 1001, 1, 1), -- Laptop in Order 5001
    (5002, 'Cancelled', 1002, 1, 2), -- Smartphone in Order 5002
    (5003, 'Returned', 1003, 1, 3), -- Headphones in Order 5003
    (5004, 'Shipped', 1004, 1, 4), -- Smartwatch in Order 5004
    (5005, 'Shipped', 1005, 2, 1), -- 2 Laptops in Order 5005
    (5006, 'Shipped', 1006, 2, 2), -- 2 Smartphones in Order 5006
    (5007, 'Shipped', 1007, 1, 6), -- Gaming Console in Order 5007
    (5008, 'Shipped', 1008, 2, 4); -- 2 Smartwatches in Order 5008
    
ALTER TABLE USER MODIFY UserType VARCHAR(50);

-- insertion into user  table
INSERT INTO User (Email, Password, UserType)
VALUES
    ('alice@example.com', '5f4dcc3b5aa7', 'Shopper'), -- Password hashed for "password"
    ('bob@example.com', 'e99a18c428cb3', 'Shopper'), -- Password hashed for "abc123"
    ('admin1@example.com', '202cb962a', 'Administrator'), -- Password hashed for "123"
    ('admin2@example.com', '098f6bcd462', 'Administrator'); -- Password hashed for "test"
