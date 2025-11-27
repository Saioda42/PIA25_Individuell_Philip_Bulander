from sqlalchemy import Column, Integer, String, Text, DECIMAL, ForeignKey, Date, TIMESTAMP
from sqlalchemy.orm import relationship
from database import Base

class Brand(Base):
    __tablename__ = "brands"

    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    country = Column(String(100))
    founded_year = Column(Integer)
    description = Column(Text)
    created_at = Column(TIMESTAMP)
    
    products = relationship("Product", back_populates="brand")


class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    brand_id = Column(Integer, ForeignKey("brands.id"), nullable=False)
    sku = Column(String(50), unique=True)
    release_year = Column(Integer)
    price = Column(DECIMAL(10, 2), nullable=False)
    warranty_months = Column(Integer)
    category = Column(String(100))
    stock_quantity = Column(Integer, default=0)
    created_at = Column(TIMESTAMP)

    brand = relationship("Brand", back_populates="products")
    order_items = relationship("OrderItem", back_populates="product")
    reviews = relationship("Review", back_populates="product")


class Customer(Base):
    __tablename__ = "customers"

    id = Column(Integer, primary_key=True)
    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    phone = Column(String(20))
    city = Column(String(100))
    registration_date = Column(Date)
    created_at = Column(TIMESTAMP)

    orders = relationship("Order", back_populates="customer")
    reviews = relationship("Review", back_populates="customer")


class Order(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True)
    customer_id = Column(Integer, ForeignKey("customers.id"), nullable=False)
    order_date = Column(Date)
    total_amount = Column(DECIMAL(10,2))
    status = Column(String(50))
    shipping_city = Column(String(100))
    created_at = Column(TIMESTAMP)

    customer = relationship("Customer", back_populates="orders")
    order_items = relationship("OrderItem", back_populates="order")


class OrderItem(Base):
    __tablename__ = "order_items"

    id = Column(Integer, primary_key=True)
    order_id = Column(Integer, ForeignKey("orders.id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer)
    unit_price = Column(DECIMAL(10,2))
    created_at = Column(TIMESTAMP)

    order = relationship("Order", back_populates="order_items")
    product = relationship("Product", back_populates="order_items")


class Review(Base):
    __tablename__ = "reviews"

    id = Column(Integer, primary_key=True)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    customer_id = Column(Integer, ForeignKey("customers.id"), nullable=False)
    rating = Column(Integer)
    comment = Column(Text)
    review_date = Column(Date)
    created_at = Column(TIMESTAMP)

    product = relationship("Product", back_populates="reviews")
    customer = relationship("Customer", back_populates="reviews")