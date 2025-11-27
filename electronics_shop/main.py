from database import get_session
from queries import get_all_products, get_products_by_brand, get_customer_orders

def main():
    session = get_session()
    
    print("Alla produkter:")
    products = get_all_products(session)
    for p in products:
        print(f"{p.name} - {p.price} kr")

    print("\nProdukter från TechCorp:")
    techcorp_products = get_products_by_brand(session, "TechCorp")
    for p in techcorp_products:
        print(f"{p.name} - {p.price} kr")

    print("\nBeställningar för kund 1:")
    orders = get_customer_orders(session, 1)
    for o in orders:
        print(f"Order ID: {o.id}, Totalt: {o.total_amount} kr, Status: {o.status}")

    session.close()


if __name__ == "__main__":
    main()