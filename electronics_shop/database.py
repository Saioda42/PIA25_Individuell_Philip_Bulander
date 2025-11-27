import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv

load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise ValueError("Miljövariabeln DATABASE_URL är inte satt!")

engine = create_engine(DATABASE_URL, echo=False)

SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

Base = declarative_base()

def get_engine():
    """Returnerar SQLAlchemy engine."""
    return engine

def get_session():
    """Returnerar en SQLAlchemy-session."""
    try:
        session = SessionLocal()
        return session
    except Exception as e:
        print(f"Fel vid skapande av session: {e}")
        return None