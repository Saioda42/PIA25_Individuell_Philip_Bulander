--Hämta alla produkter sorterade efter namn
SELECT * FROM Products
ORDER BY name; 

--Hämta alla produkter som kostar mer än 5000 kr
SELECT * FROM Products
WHERE price > 5000;

--Hämta alla beställningar från 2024
SELECT * FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

--Hämta alla pending beställningar
SELECT * FROM Orders
WHERE status = 'Pending';

--Visa alla produkter med deras tillverkares namn
SELECT p.*, b.name AS brand_name
FROM Products p
JOIN Brands b ON p.brand_id = b.id;

--Visa alla beställningar med kundens namn och totalt belopp
SELECT o.*, c.first_name, c.last_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.id;

--Visa vilka produkter varje kund har köpt
SELECT c.first_name, c.last_name, p.name AS product_name, oi.quantity, oi.unit_price
FROM Customers c
JOIN Orders o ON c.id = o.customer_id
JOIN Order_items oi ON o.id = oi.order_id
JOIN Products p ON oi.product_id = p.id
ORDER BY c.id;

--Räkna antal produkter per tillverkare
SELECT b.name AS brand_name, COUNT(p.id) AS product_count
FROM Brands b
LEFT JOIN Products p ON b.id = p.brand_id
GROUP BY b.id;

--Hitta kunder som har spenderat mest totalt
SELECT c.id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total_spent DESC
LIMIT 10;

--Visa produkter med genomsnittligt betyg från recensioner
SELECT p.id, p.name, AVG(r.rating) AS average_rating
FROM Products p
LEFT JOIN Reviews r ON p.id = r.product_id
GROUP BY p.id
HAVING AVG(r.rating) IS NOT NULL
ORDER BY average_rating DESC;