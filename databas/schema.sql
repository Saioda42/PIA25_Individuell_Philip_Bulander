CREATE DATABASE electronics_db;

DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Order_items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Brands;


CREATE TABLE Brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    founded_year INT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL,
    sku VARCHAR(50) UNIQUE,
    release_year INT,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    warranty_months INT,
    category VARCHAR(100),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_brand
        FOREIGN KEY (brand_id) REFERENCES Brands(id) ON DELETE CASCADE
);

CREATE INDEX idx_products_brand_id ON Products(brand_id);

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(100),
    registration_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50) DEFAULT 'Pending',
    shipping_city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);

CREATE INDEX idx_orders_customer_id ON Orders(customer_id);

CREATE TABLE Order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE RESTRICT
);

CREATE INDEX idx_orderitems_order_id ON Order_items(order_id);
CREATE INDEX idx_orderitems_product_id ON Order_items(product_id);

CREATE TABLE Reviews (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reviews_product
        FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);

CREATE INDEX idx_reviews_product_id ON Reviews(product_id);
CREATE INDEX idx_reviews_customer_id ON Reviews(customer_id);