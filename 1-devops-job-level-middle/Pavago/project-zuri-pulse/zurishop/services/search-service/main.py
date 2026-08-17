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