from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from prometheus_fastapi_instrumentator import Instrumentator
import httpx
import os
import uuid
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"checkout-service","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="checkout-service")

Instrumentator().instrument(app).expose(app, endpoint="/metrics")

PRODUCT_API_URL = os.getenv("PRODUCT_API_URL", "http://localhost:8001")
CART_SERVICE_URL = os.getenv("CART_SERVICE_URL", "http://localhost:8002")
INVENTORY_SERVICE_URL = os.getenv("INVENTORY_SERVICE_URL", "http://localhost:8005")
PAYMENT_SERVICE_URL = os.getenv("PAYMENT_SERVICE_URL", "http://localhost:8004")
NOTIFICATION_SERVICE_URL = os.getenv("NOTIFICATION_SERVICE_URL", "http://localhost:8006")


class CheckoutRequest(BaseModel):
    cart_id: str
    email: str


@app.get("/")
def root():
    return {
        "service": "checkout-service",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.post("/checkout")
async def checkout(request: CheckoutRequest):
    order_id = str(uuid.uuid4())

    async with httpx.AsyncClient(timeout=10.0) as client:
        cart_response = await client.get(f"{CART_SERVICE_URL}/cart/{request.cart_id}")

        if cart_response.status_code != 200:
            raise HTTPException(status_code=400, detail="Cart not found")

        cart = cart_response.json()
        items = cart.get("items", {})

        if not items:
            raise HTTPException(status_code=400, detail="Cart is empty")

        total = 0.0

        for product_id, quantity in items.items():
            quantity = int(quantity)

            product_response = await client.get(f"{PRODUCT_API_URL}/products/{product_id}")

            if product_response.status_code != 200:
                raise HTTPException(status_code=400, detail=f"Product {product_id} not found")

            product = product_response.json()
            total += float(product["price"]) * quantity

            reserve_response = await client.post(
                f"{INVENTORY_SERVICE_URL}/inventory/{product_id}/reserve",
                params={"quantity": quantity}
            )

            if reserve_response.status_code != 200:
                raise HTTPException(status_code=409, detail=f"Could not reserve stock for {product_id}")

        payment_response = await client.post(
            f"{PAYMENT_SERVICE_URL}/payments",
            json={
                "amount": total,
                "currency": "KES",
                "customer_email": request.email
            }
        )

        if payment_response.status_code != 200:
            raise HTTPException(status_code=402, detail="Payment failed")

        await client.post(
            f"{NOTIFICATION_SERVICE_URL}/notifications",
            json={
                "to": request.email,
                "message": f"Your order {order_id} has been confirmed. Total: KES {total}",
                "type": "email"
            }
        )

        await client.delete(f"{CART_SERVICE_URL}/cart/{request.cart_id}")

        logging.info(
            "Order %s completed successfully. Total: %s",
            order_id,
            total
        )

        return {
            "order_id": order_id,
            "status": "completed",
            "total": total,
            "currency": "KES"
        }