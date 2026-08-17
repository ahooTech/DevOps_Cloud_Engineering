from fastapi import FastAPI, HTTPException
from prometheus_fastapi_instrumentator import Instrumentator
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"inventory-service","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="inventory-service")

Instrumentator().instrument(app).expose(app, endpoint="/metrics")

INVENTORY = {
    "SKU-001": 50,
    "SKU-002": 20,
    "SKU-003": 100,
    "SKU-004": 10,
}


@app.get("/")
def root():
    return {
        "service": "inventory-service",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.get("/inventory")
def get_inventory():
    return [
        {
            "product_id": product_id,
            "remaining": stock
        }
        for product_id, stock in INVENTORY.items()
    ]


@app.get("/inventory/{product_id}")
def get_product_inventory(product_id: str):
    if product_id not in INVENTORY:
        raise HTTPException(status_code=404, detail="Product not found in inventory")

    return {
        "product_id": product_id,
        "remaining": INVENTORY[product_id]
    }


@app.post("/inventory/{product_id}/reserve")
def reserve_inventory(product_id: str, quantity: int = 1):
    if product_id not in INVENTORY:
        raise HTTPException(status_code=404, detail="Product not found in inventory")

    if quantity <= 0:
        raise HTTPException(status_code=400, detail="Quantity must be greater than zero")

    if INVENTORY[product_id] < quantity:
        raise HTTPException(status_code=409, detail="Insufficient stock")

    INVENTORY[product_id] -= quantity

    logging.info(
        "Reserved %s units of %s. Remaining: %s",
        quantity,
        product_id,
        INVENTORY[product_id]
    )

    return {
        "product_id": product_id,
        "reserved": quantity,
        "remaining": INVENTORY[product_id]
    }