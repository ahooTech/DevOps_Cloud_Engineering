from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from prometheus_fastapi_instrumentator import Instrumentator
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"product-api","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="product-api")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

Instrumentator().instrument(app).expose(app, endpoint="/metrics")

PRODUCTS = {
    "SKU-001": {
        "id": "SKU-001",
        "name": "Wireless Mouse",
        "price": 1500,
        "currency": "KES"
    },
    "SKU-002": {
        "id": "SKU-002",
        "name": "Mechanical Keyboard",
        "price": 6500,
        "currency": "KES"
    },
    "SKU-003": {
        "id": "SKU-003",
        "name": "USB-C Cable",
        "price": 700,
        "currency": "KES"
    },
    "SKU-004": {
        "id": "SKU-004",
        "name": "Laptop Stand",
        "price": 3200,
        "currency": "KES"
    },
}


@app.get("/")
def root():
    return {
        "service": "product-api",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.get("/products")
def get_products():
    return list(PRODUCTS.values())


@app.get("/products/{product_id}")
def get_product(product_id: str):
    if product_id not in PRODUCTS:
        raise HTTPException(status_code=404, detail="Product not found")

    return PRODUCTS[product_id]