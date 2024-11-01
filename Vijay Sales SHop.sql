CReate database vijay_sales_shop;
use vijay_sales_shop;

-- 1. Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    category_id INT,
    brand_id INT,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    warranty_period INT,
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

-- 2. Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

-- 3. Brands
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(255) NOT NULL,
    brand_country VARCHAR(255)
);

-- 4. Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10)
);

-- 5. Sales
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    sale_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. SalesDetails
CREATE TABLE SalesDetails (
    sale_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_sale DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 7. Inventory
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    location_id INT,
    quantity INT NOT NULL,
    last_updated DATETIME,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- 8. Locations
CREATE TABLE Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(255) NOT NULL,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10)
);

-- 9. Suppliers
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(255) UNIQUE,
    address TEXT
);

-- 10. Purchases
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    order_date DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 11. PurchaseDetails
CREATE TABLE PurchaseDetails (
    purchase_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT,
    product_id INT,
    quantity INT NOT NULL,
    cost_price DECIMAL(10, 2),
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 12. Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    payment_date DATETIME NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_type VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id)
);


-- INSERT VALUES --

INSERT INTO Products (product_id, product_name, category_id, brand_id, price, description, warranty_period, stock_quantity)
VALUES
  (1, 'Samsung LED TV 43"', 1, 1, 29999.99, '43-inch LED TV with Full HD resolution', 24, 10),
  (2, 'iPhone 14', 2, 2, 79999.99, '128GB, Midnight Black', 12, 15),
  (3, 'Dell Inspiron Laptop', 3, 3, 45999.99, 'Core i5, 8GB RAM, 512GB SSD', 12, 8),
  (4, 'Sony Headphones WH-1000XM4', 4, 4, 19999.99, 'Noise-canceling wireless headphones', 12, 20),
  (5, 'LG Refrigerator 190L', 5, 5, 15999.99, '190L single-door refrigerator with smart inverter compressor', 24, 12),
  (6, 'HP Pavilion Laptop 14"', 3, 6, 60999.99, 'Core i7, 16GB RAM, 1TB SSD', 12, 7),
  (7, 'Canon EOS 1500D DSLR Camera', 6, 7, 35999.99, '24.1MP DSLR camera with dual-lens kit', 12, 5),
  (8, 'Philips Air Fryer HD9216', 7, 8, 8499.99, 'Rapid Air Technology for healthier frying', 12, 18),
  (9, 'Sony Bravia 55" LED TV', 1, 9, 54999.99, '4K UHD Smart LED TV with HDR and Android OS', 24, 15),
  (10, 'Samsung Galaxy S21', 2, 2, 69999.99, '128GB storage, 8GB RAM, Exynos 2100', 12, 20),
  (11, 'Dell Inspiron 15"', 3, 10, 48999.99, 'Core i5, 8GB RAM, 512GB SSD, Windows 10', 12, 10),
  (12, 'Whirlpool Washing Machine 6.5kg', 5, 11, 17999.99, '6.5kg fully automatic front-load', 24, 8),
  (13, 'Nikon D5600 DSLR Camera', 6, 12, 44999.99, '24.2MP DSLR with 18-55mm lens', 12, 5),
  (14, 'Bajaj Microwave Oven 20L', 7, 13, 5999.99, 'Convection microwave with digital display', 12, 12);
  
INSERT INTO Categories (category_id, category_name)
VALUES
  (1, 'Television'),
  (2, 'Mobile Phones'),
  (3, 'Laptops'),
  (4, 'Headphones'),
  (5, 'Refrigerators'),
  (6, 'Cameras'),
  (7, 'Kitchen Appliances'),
  (8, 'Microwaves'),
  (9, 'Washing Machines');
  
INSERT INTO Brands (brand_id, brand_name, brand_country)
VALUES
  (1, 'Samsung', 'South Korea'),
  (2, 'Apple', 'United States'),
  (3, 'Dell', 'United States'),
  (4, 'Sony', 'Japan'),
  (5, 'LG', 'South Korea'),
  (6, 'HP', 'United States'),
  (7, 'Canon', 'Japan'),
  (8, 'Philips', 'Netherlands'),
  (9, 'Sony', 'Japan'),
  (10, 'Dell', 'United States'),
  (11, 'Whirlpool', 'United States'),
  (12, 'Nikon', 'Japan'),
  (13, 'Bajaj', 'India');
  
INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address, city, state, zip_code)
VALUES
  (1, 'Ravi', 'Sharma', 'ravi.sharma@gmail.com', '9123456789', '123 Main Street', 'Mumbai', 'Maharashtra', '400001'),
  (2, 'Anita', 'Verma', 'anita.verma@gmail.com', '9234567890', '456 Park Avenue', 'Pune', 'Maharashtra', '411001'),
  (3, 'Raj', 'Patel', 'raj.patel@gmail.com', '9345678901', '789 Hill Road', 'Surat', 'Gujarat', '395007'),
  (4, 'Priya', 'Kumar', 'priya.kumar@gmail.com', '9456123456', 'Apartment 42, Sector 22', 'Noida', 'Uttar Pradesh', '201301'),
  (5, 'Amit', 'Singh', 'amit.singh@gmail.com', '9561234567', 'Bungalow 19, Shivaji Nagar', 'Nagpur', 'Maharashtra', '440010'),
  (6, 'Neha', 'Joshi', 'neha.joshi@gmail.com', '9671234568', 'Flat 13B, Race Course Road', 'Indore', 'Madhya Pradesh', '452001'),
  (7, 'Rajesh', 'Patel', 'rajesh.patel@gmail.com', '9876543210', 'House 29, MG Road', 'Pune', 'Maharashtra', '411001'),
  (8, 'Suman', 'Sharma', 'suman.sharma@gmail.com', '9765432189', 'Apartment 4A, South City', 'Kolkata', 'West Bengal', '700047'),
  (9, 'Akhil', 'Verma', 'akhil.verma@gmail.com', '8896541234', 'Building 21, Banjara Hills', 'Hyderabad', 'Telangana', '500034');

INSERT INTO Sales (sale_id, customer_id, sale_date, total_amount, payment_method)
VALUES
  (1, 1, '2024-10-01', 109999.97, 'Credit Card'),
  (2, 2, '2024-10-02', 79999.99, 'Debit Card'),
  (3, 3, '2024-10-03', 29999.99, 'Cash'),
  (4, 4, '2024-10-04', 15999.99, 'UPI'),
  (5, 5, '2024-10-05', 60999.99, 'Credit Card'),
  (6, 6, '2024-10-06', 8499.99, 'Debit Card'),
  (7, 7, '2024-10-07', 54999.99, 'Credit Card'),
  (8, 8, '2024-10-08', 69999.99, 'UPI'),
  (9, 9, '2024-10-09', 17999.99, 'Cash');
  
INSERT INTO SalesDetails (sale_detail_id, sale_id, product_id, quantity, price_at_sale, discount)
VALUES
  (1, 1, 1, 1, 29999.99, 0),
  (2, 1, 2, 1, 79999.99, 0),
  (3, 2, 2, 1, 79999.99, 0),
  (4, 3, 1, 1, 29999.99, 0),
  (5, 4, 5, 1, 15999.99, 500),
  (6, 5, 6, 1, 60999.99, 0),
  (7, 6, 8, 1, 8499.99, 200),
  (8, 7, 9, 1, 54999.99, 0),
  (9, 8, 10, 1, 69999.99, 2000),
  (10, 9, 12, 1, 17999.99, 500);
  
INSERT INTO Inventory (inventory_id, product_id, location_id, quantity, last_updated)
VALUES
  (1, 1, 1, 10, '2024-10-01'),
  (2, 2, 1, 15, '2024-10-01'),
  (3, 3, 2, 8, '2024-10-01'),
  (4, 4, 2, 20, '2024-10-01'),
  (5, 5, 1, 12, '2024-10-04'),
  (6, 6, 1, 7, '2024-10-05'),
  (7, 7, 2, 5, '2024-10-06'),
  (8, 8, 2, 18, '2024-10-06'),
  (9, 9, 3, 15, '2024-10-07'),
  (10, 10, 2, 20, '2024-10-08'),
  (11, 11, 1, 10, '2024-10-09'),
  (12, 12, 2, 8, '2024-10-09');
  
INSERT INTO Locations (location_id, store_name, address, city, state, zip_code)
VALUES
  (1, 'Vijay Sales - Andheri', 'Plot 21, Andheri West', 'Mumbai', 'Maharashtra', '400053'),
  (2, 'Vijay Sales - Bandra', 'Shop No. 10, Linking Road', 'Mumbai', 'Maharashtra', '400050'),
  (3, 'Vijay Sales - Thane', 'Shop No. 22, Ghodbunder Road', 'Thane', 'Maharashtra', '400601'),
  (4, 'Vijay Sales - Vashi', 'Plot 5, Sector 17', 'Navi Mumbai', 'Maharashtra', '400703'),
  (5, 'Vijay Sales - Andheri', 'Plot No. 9, Andheri West', 'Mumbai', 'Maharashtra', '400058'),
  (6, 'Vijay Sales - Kandivali', 'Station Road, Kandivali East', 'Mumbai', 'Maharashtra', '400101');
  
INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email, address)
VALUES
  (1, 'Samsung Electronics', '9876543210', 'contact@samsung.com', 'Seoul, South Korea'),
  (2, 'Apple Inc.', '9765432109', 'sales@apple.com', 'Cupertino, CA, USA'),
  (3, 'Dell India', '9654321098', 'info@dell.com', 'Bangalore, Karnataka, India'),
  (4, 'LG Electronics', '9988776655', 'lg@lgelectronics.com', 'Seoul, South Korea'),
  (5, 'HP India', '9876543212', 'info@hp.com', 'Bengaluru, Karnataka, India'),
  (6, 'Canon India', '9765432107', 'support@canon.in', 'Noida, Uttar Pradesh, India'),
  (7, 'Philips India', '9654321096', 'service@philips.com', 'Gurgaon, Haryana, India'),
  (8, 'Sony India', '9898989898', 'support@sony.co.in', 'Tokyo, Japan'),
  (9, 'Whirlpool India', '9797979797', 'contact@whirlpool.com', 'Pune, Maharashtra, India'),
  (10, 'Nikon India', '9696969696', 'service@nikon.in', 'Tokyo, Japan'),
  (11, 'Bajaj Electricals', '9595959595', 'support@bajajelectricals.com', 'Mumbai, Maharashtra, India');
  
INSERT INTO Purchases (purchase_id, supplier_id, order_date, total_cost, status)
VALUES
  (1, 1, '2024-09-01', 250000.00, 'Ordered'),
  (2, 2, '2024-09-10', 500000.00, 'Received'),
  (3, 3, '2024-09-15', 150000.00, 'Ordered'),
  (4, 4, '2024-10-04', 120000.00, 'Ordered'),
  (5, 5, '2024-10-05', 250000.00, 'Received'),
  (6, 6, '2024-10-06', 180000.00, 'Ordered'),
  (7, 8, '2024-10-07', 400000.00, 'Ordered'),
  (8, 9, '2024-10-08', 150000.00, 'Received'),
  (9, 10, '2024-10-09', 250000.00, 'Pending');
  
INSERT INTO PurchaseDetails (purchase_detail_id, purchase_id, product_id, quantity, cost_price)
VALUES
  (1, 1, 1, 10, 25000.00),
  (2, 2, 2, 5, 75000.00),
  (3, 3, 3, 3, 50000.00),
  (4, 4, 5, 10, 12000.00),
  (5, 5, 6, 5, 50000.00),
  (6, 6, 7, 3, 60000.00),
  (7, 7, 9, 8, 45000.00),
  (8, 8, 12, 6, 12000.00),
  (9, 9, 13, 4, 40000.00);
  
INSERT INTO Payments (payment_id, sale_id, payment_date, payment_amount, payment_type, payment_status)
VALUES
  (1, 1, '2024-10-01', 109999.97, 'Credit Card', 'Completed'),
  (2, 2, '2024-10-02', 79999.99, 'Debit Card', 'Completed'),
  (3, 3, '2024-10-03', 29999.99, 'Cash', 'Completed'),
  (4, 4, '2024-10-04', 15999.99, 'UPI', 'Completed'),
  (5, 5, '2024-10-05', 60999.99, 'Credit Card', 'Completed'),
  (6, 6, '2024-10-06', 8499.99, 'Debit Card', 'Completed'),
  (7, 7, '2024-10-07', 54999.99, 'Credit Card', 'Completed'),
  (8, 8, '2024-10-08', 69999.99, 'UPI', 'Completed'),
  (9, 9, '2024-10-09', 17999.99, 'Cash', 'Completed');

-- SELECT & DESC -----
select * from Products; 
select * from Categories;
select * from Brands;
select * from Customers;
select * from Sales;
select * from SalesDetails;
select * from Inventory;
select * from Locations;
select * from Suppliers;
select * from Purchases;
select * from PurchaseDetails;
select * from Payments;

DESC Products; 
DESC Categories;
DESC Brands;
DESC Customers;
DESC Sales;
DESC SalesDetails;
DESC Inventory;
DESC Locations;
DESC Suppliers;
DESC Purchases;
DESC PurchaseDetails;
DESC Payments;

-- Questions --

-- How many SHop are in Mumbai?
SELECT store_name, address ,city
FROM locations
WHERE city = 'Mumbai';

-- How many customers are from Mumbai?
SELECT first_name, last_name ,city,state
FROM Customers
WHERE state = 'Maharashtra';



-- How many Brands are from Japan?
SELECT Brand_name
FROM Brands
WHERE brand_country = 'Japan';

-- find all products with names that start with "Samsung":
SELECT * FROM Products
WHERE product_name LIKE 'Samsung%';

-- find all products where the second character in the name is "a":
SELECT * FROM Products
WHERE product_name LIKE '_a%';

-- find all products that contain "Laptop" in their name:
SELECT * FROM Products
WHERE product_name LIKE '%Laptop%';

-- What are the first names, last names, and email addresses of customers 
-- whose first names start with the letter "A"?
SELECT first_name, last_name, email
FROM Customers
WHERE first_name LIKE 'A%';

-- What is the total revenue generated from sales?
SELECT SUM(total_amount) AS total_revenue
FROM Sales;

-- What is the total number of customers and the total sales amount?
SELECT (SELECT COUNT(*) FROM Customers) AS total_customers,
    (SELECT SUM(total_amount) FROM Sales) AS total_sales;


-- What is the list of all products along with their category, brand, price, and stock quantity?
SELECT 
    p.product_name, 
    c.category_name, 
    b.brand_name, 
    p.price, 
    p.stock_quantity
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
JOIN Brands b ON p.brand_id = b.brand_id;

-- Which products are currently out of stock?
SELECT product_name 
FROM Products 
WHERE stock_quantity = 0;

-- What is the total amount spent by each customer?
SELECT 
    c.first_name, 
    c.last_name, 
    SUM(s.total_amount) AS total_spent
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- What is the total quantity sold and total revenue for each product?
SELECT 
    p.product_name, 
    SUM(sd.quantity) AS total_quantity_sold, 
    SUM(sd.price_at_sale * sd.quantity) AS total_revenue
FROM SalesDetails sd
JOIN Products p ON sd.product_id = p.product_id
GROUP BY p.product_name;

-- Who are the top 5 customers based on total purchase amount?
SELECT 
    c.first_name, 
    c.last_name, 
    SUM(s.total_amount) AS total_spent
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;
 
-- What is the inventory count for each product across all store locations?
SELECT 
    l.store_name, 
    p.product_name, 
    i.quantity AS stock_quantity
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
JOIN Locations l ON i.location_id = l.location_id;

-- How much revenue is generated by each payment method?
SELECT 
    payment_method, 
    SUM(total_amount) AS total_revenue
FROM Sales
GROUP BY payment_method;

-- What is the average discount offered on each product?
SELECT 
    p.product_name, 
    AVG(sd.discount) AS average_discount
FROM SalesDetails sd
JOIN Products p ON sd.product_id = p.product_id
GROUP BY p.product_name;

-- List the suppliers and the status of their latest purchase orders.
SELECT 
    s.supplier_name, 
    p.order_date, 
    p.status
FROM Purchases p
JOIN Suppliers s ON p.supplier_id = s.supplier_id
ORDER BY s.supplier_name, p.order_date DESC;

-- Which products have stock below 10 units?
SELECT 
    product_name, 
    stock_quantity 
FROM Products 
WHERE stock_quantity < 	10;


-- What are the sales made between specific dates?
SELECT 
    sale_id, 
    customer_id, 
    sale_date, 
    total_amount
FROM Sales
WHERE sale_date BETWEEN '2024-10-01' AND '2024-10-31';


-- What products has a specific customer purchased?
SELECT 
    c.first_name, 
    c.last_name, 
    p.product_name, 
    sd.quantity, 
    sd.price_at_sale
FROM SalesDetails sd
JOIN Sales s ON sd.sale_id = s.sale_id
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON sd.product_id = p.product_id
WHERE c.customer_id = 1;

-- What are the contact details of all customers?
SELECT 
    first_name, 
    last_name, 
    email, 
    phone
FROM Customers;

-- Which products have generated the highest revenue?
SELECT 
    p.product_name, 
    SUM(sd.price_at_sale * sd.quantity) AS total_revenue
FROM SalesDetails sd
JOIN Products p ON sd.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- How many sales were made each month?
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month, 
    COUNT(sale_id) AS total_sales
FROM Sales
GROUP BY month
ORDER BY month;

-- What is the total sales amount for each product category?
SELECT 
    c.category_name, 
    SUM(s.total_amount) AS total_sales
FROM Sales s
JOIN SalesDetails sd ON s.sale_id = sd.sale_id
JOIN Products p ON sd.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- How many purchases has each customer made?
SELECT 
    c.first_name, 
    c.last_name, 
    COUNT(s.sale_id) AS purchase_count
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id;

-- Which products are currently being offered at a discount?
SELECT 
    p.product_name, 
    sd.discount
FROM SalesDetails sd
JOIN Products p ON sd.product_id = p.product_id
WHERE sd.discount > 0;

-- What is the total revenue generated each month?
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month, 
    SUM(s.total_amount) AS total_revenue
FROM Sales s
GROUP BY month
ORDER BY month;

-- Which suppliers have pending purchase orders?
SELECT 
    s.supplier_name, 
    p.order_date, 
    p.status
FROM Purchases p
JOIN Suppliers s ON p.supplier_id = s.supplier_id
WHERE p.status = 'Pending';

-- What is the total sales amount for each brand?
SELECT 
    b.brand_name, 
    SUM(s.total_amount) AS total_sales
FROM Sales s
JOIN SalesDetails sd ON s.sale_id = sd.sale_id
JOIN Products p ON sd.product_id = p.product_id
JOIN Brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name;

-- Which products have the highest number of sales?
SELECT 
    p.product_name, 
    COUNT(sd.sale_id) AS number_of_sales
FROM SalesDetails sd
JOIN Products p ON sd.product_id = p.product_id
GROUP BY p.product_name
ORDER BY number_of_sales DESC;

-- What is the average order value across all sales?
SELECT AVG(total_amount) AS average_order_value
FROM Sales;

-- What is the spending trend of customers over the last six months?
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month, 
    SUM(s.total_amount) AS total_spent
FROM Sales s
WHERE s.sale_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY month
ORDER BY month;

-- What is the total value of stock for each product?
SELECT 
    p.product_name, 
    (p.price * p.stock_quantity) AS total_stock_value
FROM Products p;



