USE StoreFont;

SHOW Tables;

DESC Address;
-- list of constraints in address table
-- 1).ShopperId-Foreign key
-- 2).AddressLine-Unique key
-- 3).City-NOT NULL
-- 4).State-NOT NULL
-- 5).Country-NOT NULL
-- 6).Pin code-NOT NULL

DESC Admin;
-- list of constraints in address table
-- 1).Adminid-primary key
-- 2).name-not null

DESC User;
-- list of constraints in user table
-- 1).email-uniq. key
-- 2).password-primary key

DESC Shopper;
-- list of constraints in shopper table
-- 1).shopper id-primary key
-- 2).mobile no.-nuiq. key

DESC Products;
-- list of constraints in products table
-- 1).productid-primary. key
-- 2).title-not null
-- 3).quantity-not null
-- 4).price-not null
-- 5).productstatus-default 

DESC Product_Category;
-- list of constraints in Product_Category table
-- 1).productid-foreign key
-- 2).cat_id-foreign null

DESC Category;
-- list of constraints in Category table
-- 1).cat_id-primary key
-- 2).cat_title-uniq. key
-- 3).parent_cat_id-foreign key

DESC Orders;
-- list of constraints in Orders table
-- 1).shopperid-foreign key
-- 2).orderdate-not null
-- 3).ordertotal-not  null
-- 4).orderid=primary key

DESC OrderItem;
-- list of constraints in OrderItem table
-- 1).orderid-foreign key
-- 2).orderitemid-primary key
-- 3).productid-foreign key
-- 4).orderstatus-check constraint
