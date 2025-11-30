-- Hitta alla produkter vars pris är högre än genomsnittspriset

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Hitta kunder som har beställt fler än genomsnittligt antal beställningar

SELECT 
    c.id,
    c.first_name,
    c.last_name,
    COUNT(o.id) AS order_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
HAVING COUNT(o.id) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS sub
);

-- Ranka produkter per tillverkare baserat på pris (ROW_NUMBER)

SELECT 
    p.id,
    p.name,
    b.name AS manufacturer,
    p.price,
    ROW_NUMBER() OVER (PARTITION BY b.name ORDER BY p.price DESC) AS price_rank
FROM products p
JOIN brands b ON p.brand_id = b.id;

-- Visa varje kunds totala spending och deras rank bland alla kunder (RANK)

SELECT 
    c.id,
    c.first_name,
    c.last_name,
    COALESCE(SUM(o.total_amount), 0) AS total_spent,
    RANK() OVER (ORDER BY COALESCE(SUM(o.total_amount), 0) DESC) AS spending_rank
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id;

-- Kategorisera produkter som 'Budget' (<1000), 'Medium' (1000-5000), 'Premium' (>5000)

SELECT 
    p.id,
    p.name,
    p.price,
    CASE 
        WHEN p.price < 1000 THEN 'Budget'
        WHEN p.price BETWEEN 1000 AND 5000 THEN 'Medium'
        ELSE 'Premium'
    END AS price_category
FROM products p;

-- Visa kunder som 'VIP' (>3 beställningar), 'Regular' (2-3), 'New' (1)

SELECT 
    c.id,
    c.first_name,
    c.last_name,
    COUNT(o.id) AS order_count,
    CASE 
        WHEN COUNT(o.id) > 3 THEN 'VIP'
        WHEN COUNT(o.id) BETWEEN 2 AND 3 THEN 'Regular'
        ELSE 'New'
    END AS customer_category
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id;