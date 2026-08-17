# Staff Canteen Management System

Generated: 08/17/2026 20:52:22

---

## Table of Contents

- docker-compose.yml
- legacy-reports\Generate-ZuriShopReport.ps1
- observability\prometheus.yml
- requirements-dev.txt
- services\cart-service\Dockerfile
- services\cart-service\main.py
- services\cart-service\requirements.txt
- services\checkout-service\Dockerfile
- services\checkout-service\main.py
- services\checkout-service\requirements.txt
- services\inventory-service\Dockerfile
- services\inventory-service\main.py
- services\inventory-service\requirements.txt
- services\notification-service\Dockerfile
- services\notification-service\main.py
- services\notification-service\requirements.txt
- services\payment-service\Dockerfile
- services\payment-service\main.py
- services\payment-service\requirements.txt
- services\product-api\Dockerfile
- services\product-api\main.py
- services\product-api\requirements.txt
- services\search-service\Dockerfile
- services\search-service\main.py
- services\search-service\requirements.txt
- storefront-web\Dockerfile
- storefront-web\index.html
- zurishop-report.csv

---


<div style='page-break-after: always;'></div>

# File: docker-compose.yml

```yml
services:
  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.13.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
      - ES_JAVA_OPTS=-Xms512m -Xmx512m
    ports:
      - "9200:9200"

  product-api:
    build: ./services/product-api
    ports:
      - "8001:8000"

  cart-service:
    build: ./services/cart-service
    environment:
      REDIS_HOST: redis
      REDIS_PORT: 6379
    ports:
      - "8002:8000"
    depends_on:
      - redis

  payment-service:
    build: ./services/payment-service
    ports:
      - "8004:8000"

  inventory-service:
    build: ./services/inventory-service
    ports:
      - "8005:8000"

  notification-service:
    build: ./services/notification-service
    ports:
      - "8006:8000"

  checkout-service:
    build: ./services/checkout-service
    environment:
      PRODUCT_API_URL: http://product-api:8000
      CART_SERVICE_URL: http://cart-service:8000
      INVENTORY_SERVICE_URL: http://inventory-service:8000
      PAYMENT_SERVICE_URL: http://payment-service:8000
      NOTIFICATION_SERVICE_URL: http://notification-service:8000
    ports:
      - "8003:8000"
    depends_on:
      - product-api
      - cart-service
      - inventory-service
      - payment-service
      - notification-service

  search-service:
    build: ./services/search-service
    environment:
      ELASTICSEARCH_URL: http://elasticsearch:9200
      PRODUCT_API_URL: http://product-api:8000
    ports:
      - "8007:8000"
    depends_on:
      - elasticsearch
      - product-api

  storefront-web:
    build: ./storefront-web
    ports:
      - "8080:80"

  prometheus:
    image: prom/prometheus
    volumes:
      - ./observability/prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
```


<div style='page-break-after: always;'></div>

# File: legacy-reports\Generate-ZuriShopReport.ps1

```ps1
param(
    [string]$ProductApiUrl = "http://localhost:8001/products",
    [string]$InventoryApiUrl = "http://localhost:8005/inventory",
    [string]$OutputCsv = "zurishop-report.csv"
)

try {
    Write-Output "Fetching products from $ProductApiUrl"
    $products = Invoke-RestMethod -Uri $ProductApiUrl

    Write-Output "Fetching inventory from $InventoryApiUrl"
    $inventory = Invoke-RestMethod -Uri $InventoryApiUrl

    $inventoryMap = @{}

    foreach ($item in $inventory) {
        $inventoryMap[$item.product_id] = $item.remaining
    }

    $report = foreach ($product in $products) {
        [PSCustomObject]@{
            ProductId = $product.id
            Name      = $product.name
            Price     = $product.price
            Currency  = $product.currency
            Stock     = $inventoryMap[$product.id]
        }
    }

    $report | Export-Csv -Path $OutputCsv -NoTypeInformation

    Write-Output "Report generated successfully: $OutputCsv"
}
catch {
    Write-Error "Failed to generate report: $_"
    exit 1
}
```


<div style='page-break-after: always;'></div>

# File: observability\prometheus.yml

```yml
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: product-api
    metrics_path: /metrics
    static_configs:
      - targets: ["product-api:8000"]

  - job_name: cart-service
    metrics_path: /metrics
    static_configs:
      - targets: ["cart-service:8000"]

  - job_name: checkout-service
    metrics_path: /metrics
    static_configs:
      - targets: ["checkout-service:8000"]

  - job_name: payment-service
    metrics_path: /metrics
    static_configs:
      - targets: ["payment-service:8000"]

  - job_name: inventory-service
    metrics_path: /metrics
    static_configs:
      - targets: ["inventory-service:8000"]

  - job_name: notification-service
    metrics_path: /metrics
    static_configs:
      - targets: ["notification-service:8000"]

  - job_name: search-service
    metrics_path: /metrics
    static_configs:
      - targets: ["search-service:8000"]
```


<div style='page-break-after: always;'></div>

# File: requirements-dev.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\cart-service\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\cart-service\main.py

```py
from fastapi import FastAPI
from pydantic import BaseModel
from prometheus_fastapi_instrumentator import Instrumentator
import redis
import os
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"cart-service","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="cart-service")

Instrumentator().instrument(app).expose(app, endpoint="/metrics")

REDIS_HOST = os.getenv("REDIS_HOST", "localhost")
REDIS_PORT = int(os.getenv("REDIS_PORT", "6379"))

redis_client = redis.Redis(
    host=REDIS_HOST,
    port=REDIS_PORT,
    db=0,
    decode_responses=True
)


class CartItem(BaseModel):
    product_id: str
    quantity: int = 1


@app.get("/")
def root():
    return {
        "service": "cart-service",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.post("/cart/{cart_id}/items")
def add_item_to_cart(cart_id: str, item: CartItem):
    key = f"cart:{cart_id}"

    redis_client.hincrby(
        key,
        item.product_id,
        item.quantity
    )

    items = redis_client.hgetall(key)

    logging.info(
        "Added item %s to cart %s",
        item.product_id,
        cart_id
    )

    return {
        "cart_id": cart_id,
        "items": items
    }


@app.get("/cart/{cart_id}")
def get_cart(cart_id: str):
    key = f"cart:{cart_id}"
    items = redis_client.hgetall(key)

    return {
        "cart_id": cart_id,
        "items": items,
        "item_count": len(items)
    }


@app.delete("/cart/{cart_id}")
def clear_cart(cart_id: str):
    key = f"cart:{cart_id}"
    redis_client.delete(key)

    return {
        "cart_id": cart_id,
        "status": "cleared"
    }
```


<div style='page-break-after: always;'></div>

# File: services\cart-service\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\checkout-service\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\checkout-service\main.py

```py
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
```


<div style='page-break-after: always;'></div>

# File: services\checkout-service\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\inventory-service\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\inventory-service\main.py

```py
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
```


<div style='page-break-after: always;'></div>

# File: services\inventory-service\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\notification-service\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\notification-service\main.py

```py
from fastapi import FastAPI
from pydantic import BaseModel
from prometheus_fastapi_instrumentator import Instrumentator
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"notification-service","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="notification-service")

Instrumentator().instrument(app).expose(app, endpoint="/metrics")


class NotificationRequest(BaseModel):
    to: str
    message: str
    type: str = "email"


@app.get("/")
def root():
    return {
        "service": "notification-service",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.post("/notifications")
def send_notification(request: NotificationRequest):
    logging.info(
        "Sending %s notification to %s: %s",
        request.type,
        request.to,
        request.message
    )

    return {
        "status": "queued",
        "to": request.to,
        "type": request.type
    }
```


<div style='page-break-after: always;'></div>

# File: services\notification-service\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\payment-service\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\payment-service\main.py

```py
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from prometheus_fastapi_instrumentator import Instrumentator
from typing import Optional
import uuid
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"payment-service","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="payment-service")

Instrumentator().instrument(app).expose(app, endpoint="/metrics")


class PaymentRequest(BaseModel):
    amount: float
    currency: str = "KES"
    customer_email: Optional[str] = None


@app.get("/")
def root():
    return {
        "service": "payment-service",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.post("/payments")
def create_payment(request: PaymentRequest):
    payment_id = str(uuid.uuid4())

    if request.amount <= 0:
        raise HTTPException(status_code=400, detail="Payment amount must be greater than zero")

    if request.amount > 200000:
        raise HTTPException(status_code=402, detail="Payment declined by mock payment provider")

    logging.info(
        "Payment approved: %s for amount %s",
        payment_id,
        request.amount
    )

    return {
        "payment_id": payment_id,
        "status": "approved",
        "amount": request.amount,
        "currency": request.currency
    }
```


<div style='page-break-after: always;'></div>

# File: services\payment-service\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\product-api\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\product-api\main.py

```py
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
```


<div style='page-break-after: always;'></div>

# File: services\product-api\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch
pydantic
```


<div style='page-break-after: always;'></div>

# File: services\search-service\Dockerfile

```text
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=15s --timeout=3s --start-period=20s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/healthz')" || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```


<div style='page-break-after: always;'></div>

# File: services\search-service\main.py

```py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware 
from prometheus_fastapi_instrumentator import Instrumentator
from elasticsearch import Elasticsearch
import httpx
import os
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"search-service","message":"%(message)s"}',
    stream=sys.stdout
)

app = FastAPI(title="search-service")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

Instrumentator().instrument(app).expose(app, endpoint="/metrics")

ELASTICSEARCH_URL = os.getenv("ELASTICSEARCH_URL", "http://localhost:9200")
PRODUCT_API_URL = os.getenv("PRODUCT_API_URL", "http://localhost:8001")
INDEX_NAME = "products"

es = Elasticsearch([ELASTICSEARCH_URL])


@app.on_event("startup")
def create_index():
    try:
        if not es.indices.exists(index=INDEX_NAME):
            es.indices.create(index=INDEX_NAME)
            logging.info("Created Elasticsearch index: %s", INDEX_NAME)
    except Exception as error:
        logging.warning("Could not create Elasticsearch index: %s", error)


@app.get("/")
def root():
    return {
        "service": "search-service",
        "status": "running"
    }


@app.get("/healthz")
def healthz():
    return {
        "status": "healthy"
    }


@app.post("/search/index")
async def index_products():
    async with httpx.AsyncClient(timeout=10.0) as client:
        response = await client.get(f"{PRODUCT_API_URL}/products")
        response.raise_for_status()
        products = response.json()

    indexed = 0

    for product in products:
        es.index(
            index=INDEX_NAME,
            id=product["id"],
            document=product
        )
        indexed += 1

    es.indices.refresh(index=INDEX_NAME)

    logging.info("Indexed %s products into Elasticsearch", indexed)

    return {
        "indexed": indexed
    }


@app.get("/search")
def search_products(q: str = ""):
    if not q:
        return {
            "count": 0,
            "hits": []
        }

    query = {
        "query": {
            "multi_match": {
                "query": q,
                "fields": ["name", "id"]
            }
        }
    }

    response = es.search(index=INDEX_NAME, body=query)

    hits = [
        hit["_source"]
        for hit in response["hits"]["hits"]
    ]

    return {
        "count": len(hits),
        "hits": hits
    }
```


<div style='page-break-after: always;'></div>

# File: services\search-service\requirements.txt

```txt
fastapi
uvicorn[standard]
prometheus-fastapi-instrumentator
httpx
redis
elasticsearch==8.13.0
pydantic
```


<div style='page-break-after: always;'></div>

# File: storefront-web\Dockerfile

```text
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=15s --timeout=3s --start-period=10s \
  CMD wget -qO- http://localhost/ > /dev/null || exit 1
```


<div style='page-break-after: always;'></div>

# File: storefront-web\index.html

```html
<!doctype html>
<html>
<head>
  <title>ZuriShop</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background: #f5f5f5;
    }

    .card {
      background: white;
      padding: 20px;
      border-radius: 8px;
      max-width: 900px;
    }

    input {
      padding: 8px;
      width: 300px;
      margin-right: 8px;
    }

    button {
      padding: 8px 12px;
      cursor: pointer;
    }

    pre {
      background: #111;
      color: #0f0;
      padding: 12px;
      overflow: auto;
      border-radius: 6px;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>ZuriShop</h1>
    <p>Simple retail storefront for the ZuriMart DevOps mastery project.</p>

    <input id="search" placeholder="Search products" />
    <button onclick="searchProducts()">Search</button>
    <button onclick="loadProducts()">Load All Products</button>

    <h2>Output</h2>
    <pre id="output">Loading...</pre>
  </div>

  <script>
    const PRODUCT_API_URL = "http://localhost:8001";
    const SEARCH_API_URL = "http://localhost:8007";

    async function loadProducts() {
      try {
        const response = await fetch(`${PRODUCT_API_URL}/products`);
        const data = await response.json();
        document.getElementById("output").textContent = JSON.stringify(data, null, 2);
      } catch (error) {
        document.getElementById("output").textContent = `Error: ${error}`;
      }
    }

    async function searchProducts() {
      try {
        const query = document.getElementById("search").value;
        const response = await fetch(`${SEARCH_API_URL}/search?q=${encodeURIComponent(query)}`);
        const data = await response.json();
        document.getElementById("output").textContent = JSON.stringify(data, null, 2);
      } catch (error) {
        document.getElementById("output").textContent = `Error: ${error}`;
      }
    }

    loadProducts();
  </script>
</body>
</html>
```


<div style='page-break-after: always;'></div>

# File: zurishop-report.csv

```csv
"ProductId","Name","Price","Currency","Stock"
"SKU-001","Wireless Mouse","1500","KES","50"
"SKU-002","Mechanical Keyboard","6500","KES","19"
"SKU-003","USB-C Cable","700","KES","100"
"SKU-004","Laptop Stand","3200","KES","10"

```

