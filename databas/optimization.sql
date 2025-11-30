-- Hämta alla produkter sorterade efter namn (före index)
EXPLAIN ANALYZE
SELECT * FROM Products
ORDER BY name;

-- Hämta alla produkter som kostar mer än 5000 kr (före index)
EXPLAIN ANALYZE
SELECT * FROM Products
WHERE price > 5000;

-- Hämta alla beställningar från 2024 (före index)
EXPLAIN ANALYZE
SELECT * FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- Hämta alla pending beställningar (före index)
EXPLAIN ANALYZE
SELECT * FROM Orders
WHERE status = 'Pending';

-- Index för snabb sortering av produkter efter namn
CREATE INDEX IF NOT EXISTS idx_products_name ON Products(name);

-- Index för snabb filtrering av produkter baserat på pris
CREATE INDEX IF NOT EXISTS idx_products_price ON Products(price);

-- Index på order_date för snabb filtrering av år
CREATE INDEX IF NOT EXISTS idx_orders_order_date ON Orders(order_date);

-- Index på status för snabb filtrering av orders
CREATE INDEX IF NOT EXISTS idx_orders_status ON Orders(status);

-- Hämta alla produkter sorterade efter namn (efter index)
EXPLAIN ANALYZE
SELECT * FROM Products
ORDER BY name;

-- Hämta alla produkter som kostar mer än 5000 kr (efter index)
EXPLAIN ANALYZE
SELECT * FROM Products
WHERE price > 5000;

-- Hämta alla beställningar från 2024 (efter index)
EXPLAIN ANALYZE
SELECT * FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- Hämta alla pending beställningar (efter index)
EXPLAIN ANALYZE
SELECT * FROM Orders
WHERE status = 'Pending';