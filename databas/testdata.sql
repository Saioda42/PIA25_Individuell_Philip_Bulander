--Brands
INSERT INTO Brands (name, country, founded_year, description)
VALUES
('TechCorp', 'USA', 1998, 'Leading tech manufacturer'),
('GadgetWorks', 'Germany', 2005, 'High-quality gadgets'),
('ElectroPlus', 'Japan', 2010, 'Innovative electronics');

--Products
INSERT INTO Products (name, brand_id, sku, release_year, price, warranty_months, category, stock_quantity)
VALUES
('TechPhone X', 1, 'TCX-001', 2022, 7999.99, 24, 'Smartphone', 50),
('TechPhone Y', 1, 'TCY-002', 2023, 8999.99, 24, 'Smartphone', 30),
('TechTablet A', 1, 'TTA-003', 2021, 499.99, 12, 'Tablet', 20),
('GadgetWatch 1', 2, 'GW1-004', 2020, 199.99, 12, 'Smartwatch', 40),
('GadgetWatch 2', 2, 'GW2-005', 2022, 249.99, 12, 'Smartwatch', 25),
('GadgetEarbuds', 2, 'GE-006', 2023, 149.99, 6, 'Audio', 60),
('ElectroTV 50"', 3, 'ETV50-007', 2021, 699.99, 36, 'TV', 15),
('ElectroTV 65"', 3, 'ETV65-008', 2022, 999.99, 36, 'TV', 10),
('ElectroSpeaker', 3, 'ES-009', 2023, 199.99, 12, 'Audio', 30),
('ElectroCamera', 3, 'EC-010', 2020, 449.99, 24, 'Camera', 12),
('BudgetPhone 1', 1, 'BP1-011', 2023, 499.99, 12, 'Smartphone', 100),
('BudgetTablet 1', 2, 'BT1-012', 2022, 799.99, 12, 'Tablet', 50),
('BudgetSpeaker', 3, 'BS-013', 2023, 299.99, 6, 'Audio', 30),
('MidPhone 1', 1, 'MP1-014', 2023, 1499.99, 24, 'Smartphone', 40),
('MidTablet 2', 2, 'MT2-015', 2022, 2499.99, 18, 'Tablet', 20),
('MidCamera', 3, 'MC-016', 2021, 3999.99, 24, 'Camera', 15),
('PremiumPhone X', 1, 'PPX-017', 2023, 6999.99, 24, 'Smartphone', 10),
('PremiumLaptop Z', 2, 'PLZ-018', 2023, 8999.99, 36, 'Laptop', 5),
('PremiumTV 75"', 3, 'PTV75-019', 2023, 10999.99, 36, 'TV', 8);

--Customers
INSERT INTO Customers (first_name, last_name, email, phone, city)
VALUES
('Alice', 'Andersson', 'alice@example.com', '0701111111', 'Stockholm'),
('Bob', 'Berg', 'bob@example.com', '0702222222', 'Göteborg'),
('Charlie', 'Carlsson', 'charlie@example.com', '0703333333', 'Malmö'),
('Diana', 'Dahl', 'diana@example.com', '0704444444', 'Uppsala'),
('Elias', 'Eklund', 'elias@example.com', '0705555555', 'Västerås'),
('Fiona', 'Fors', 'fiona@example.com', '0706666666', 'Linköping'),
('Gustav', 'Gustafsson', 'gustav@example.com', '0707777777', 'Helsingborg');

--Orders
INSERT INTO Orders (customer_id, order_date, total_amount, status, shipping_city)
VALUES
(1, '2024-01-15', 8999.99, 'Pending', 'Stockholm'),
(1, '2024-02-10', 2999.99, 'Delivered', 'Stockholm'),
(1, '2024-05-22', 1499.99, 'Delivered', 'Stockholm'),
(2, '2024-01-10', 799.99, 'Pending', 'Göteborg'),
(2, '2024-04-11', 1299.49, 'Delivered', 'Göteborg'),
(2, '2024-06-18', 499.00, 'Delivered', 'Göteborg'),
(3, '2024-01-25', 999.00, 'Pending', 'Malmö'),
(3, '2024-03-17', 599.99, 'Delivered', 'Malmö'),
(4, '2024-01-02', 1199.00, 'Delivered', 'Uppsala'),
(4, '2024-04-22', 799.00, 'Delivered', 'Uppsala'),
(5, '2024-02-05', 349.00, 'Pending', 'Västerås'),
(5, '2024-04-12', 999.00, 'Delivered', 'Västerås'),
(1, '2024-06-01', 249.00, 'Delivered', 'Stockholm'),
(2, '2024-06-20', 179.00, 'Pending', 'Göteborg'),
(3, '2024-06-21', 429.00, 'Delivered', 'Malmö'),
(4, '2024-06-22', 529.00, 'Pending', 'Uppsala'),
(5, '2024-06-23', 389.00, 'Delivered', 'Västerås');

--Order_items
INSERT INTO Order_items (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 7999.99),
(1, 2, 1, 8999.99),
(2, 4, 1, 199.99),
(2, 6, 1, 149.99),
(3, 2, 1, 8999.99),
(3, 5, 1, 249.99),
(4, 7, 1, 699.99),
(4, 3, 1, 200.00),
(5, 10, 1, 449.99),
(6, 5, 2, 249.99),
(7, 8, 1, 999.99),
(7, 2, 1, 8999.99),
(8, 4, 2, 199.99),
(9, 7, 1, 699.98),
(10, 6, 2, 149.99);

--Reviews
INSERT INTO Reviews (product_id, customer_id, rating, comment)
VALUES
(1, 1, 5, 'Excellent phone, works perfectly!'),
(2, 3, 4, 'Good phone, battery could be better.'),
(3, 5, 3, 'Tablet is okay, could be faster.'),
(4, 2, 5, 'Love this smartwatch!'),
(5, 4, 3, 'Decent watch, a bit pricey.'),
(6, 5, 4, 'Great earbuds, sound quality is good.'),
(7, 1, 5, 'Amazing TV, crystal clear picture!'),
(8, 2, 4, 'Very good TV, but setup was tricky.'),
(9, 3, 5, 'Fantastic speaker!'),
(10, 4, 4, 'Camera takes excellent photos.'),
(1, 6, 4, 'Phone is good but a bit expensive.'),
(5, 7, 5, 'Love the smartwatch, very comfortable.'),
(6, 3, 2, 'Earbuds broke after a week, disappointed.'),
(7, 2, 3, 'TV picture is okay, sound could be better.'),
(9, 1, 5, 'Speaker is perfect for parties!');