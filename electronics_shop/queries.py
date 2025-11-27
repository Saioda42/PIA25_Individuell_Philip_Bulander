from sqlalchemy.orm import Session
from models import Product, Brand, Customer, Order, OrderItem
from sqlalchemy import func

def get_all_products(session: Session):
    """
    Hämtar alla produkter sorterade efter namn.
    """
    return session.query(Product).order_by(Product.name).all()


def get_products_by_brand(session: Session, brand_name: str):
    """
    Hämtar alla produkter från en specifik tillverkare.
    Parameter:
        brand_name: Namnet på tillverkaren
    """
    return session.query(Product).join(Brand).filter(Brand.name == brand_name).all()


def get_customer_orders(session: Session, customer_id: int):
    """
    Hämtar alla beställningar för en specifik kund.
    Parameter:
        customer_id: Kundens ID
    """
    return session.query(Order).filter(Order.customer_id == customer_id).all()


def get_products_with_avg_rating(session: Session):
    """
    Hämtar produkter med genomsnittligt betyg från recensioner.
    Endast produkter med minst en recension inkluderas.
    """
    return (session.query(Product, func.avg(Product.reviews[0].rating).label("avg_rating"))
            .join(Product.reviews)
            .group_by(Product.id)
            .order_by(func.avg(Product.reviews[0].rating).desc())
            .all())