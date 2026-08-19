# Staff Canteen Management System

Generated: 08/18/2026 18:43:02

---

## Table of Contents

- .env
- .env.example
- .gitignore
- docker-compose.yml
- docs\CV-PROJECT-ENTRY.md
- docs\📘 ZuriShop End-to-End Interview Runbook.md
- infra\postgres\init.sql
- legacy-reports\Generate-ZuriShopReport.ps1
- observability\prometheus.yml
- requirements-dev.txt
- scripts\smoke-test.ps1
- services\cart-service\.dockerignore
- services\cart-service\Dockerfile
- services\cart-service\main.py
- services\cart-service\requirements.txt
- services\checkout-service\.dockerignore
- services\checkout-service\Dockerfile
- services\checkout-service\main.py
- services\checkout-service\requirements.txt
- services\inventory-service\.dockerignore
- services\inventory-service\Dockerfile
- services\inventory-service\main.py
- services\inventory-service\requirements.txt
- services\notification-service\.dockerignore
- services\notification-service\Dockerfile
- services\notification-service\main.py
- services\notification-service\requirements.txt
- services\payment-service\.dockerignore
- services\payment-service\Dockerfile
- services\payment-service\main.py
- services\payment-service\requirements.txt
- services\product-api\.dockerignore
- services\product-api\Dockerfile
- services\product-api\main.py
- services\product-api\requirements.txt
- services\search-service\.dockerignore
- services\search-service\Dockerfile
- services\search-service\main.py
- services\search-service\requirements.txt
- storefront-web\.dockerignore
- storefront-web\Dockerfile
- storefront-web\index.html
- zurishop-report.csv

---


<div style='page-break-after: always;'></div>

# File: .env

```env
POSTGRES_USER=zurishop
POSTGRES_PASSWORD=zurishop_dev_password
POSTGRES_DB=zurishop
```


<div style='page-break-after: always;'></div>

# File: .env.example

```example
POSTGRES_USER=zurishop
POSTGRES_PASSWORD=change_me_in_production
POSTGRES_DB=zurishop
```


<div style='page-break-after: always;'></div>

# File: .gitignore

```gitignore
.env
.venv/
__pycache__/
*.pyc
*.csv
```


<div style='page-break-after: always;'></div>

# File: docker-compose.yml

```yml
services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./infra/postgres/init.sql:/docker-entrypoint-initdb.d/init.sql:ro
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}"]
      interval: 5s
      timeout: 3s
      retries: 10

  postgres-exporter:
    image: quay.io/prometheuscommunity/postgres-exporter
    environment:
      DATA_SOURCE_NAME: "postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}?sslmode=disable"
    ports:
      - "9187:9187"
    depends_on:
      postgres:
        condition: service_healthy

  redis:
    image: redis:7-alpine
    command: ["redis-server", "--save", "", "--appendonly", "no"]
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
    environment:
      DATABASE_URL: postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}
    ports:
      - "8001:8000"
    depends_on:
      postgres:
        condition: service_healthy

  cart-service:
    build: ./services/cart-service
    environment:
      REDIS_HOST: redis
      REDIS_PORT: 6379
      CART_TTL_SECONDS: 3600
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
    environment:
      DATABASE_URL: postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}
    ports:
      - "8005:8000"
    depends_on:
      postgres:
        condition: service_healthy

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
      DATABASE_URL: postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}
    ports:
      - "8003:8000"
    depends_on:
      postgres:
        condition: service_healthy
      product-api:
        condition: service_started
      cart-service:
        condition: service_started
      inventory-service:
        condition: service_started
      payment-service:
        condition: service_started
      notification-service:
        condition: service_started

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

volumes:
  postgres_data:
```


<div style='page-break-after: always;'></div>

# File: docs\CV-PROJECT-ENTRY.md

```md
# 📄 CV-PROJECT-ENTRY.md

> **Your CV should be a receipt of problems solved, not a list of tools watched.** Everything below is 100% truthful to what you actually built and debugged in this project, phrased the way a hiring manager reads impact. Paste it under a **Projects / Hands-On Portfolio** section (not under employment), and let the upcoming phases (Kubernetes, CI/CD, Terraform, multi-cloud) add more bullets later.

---

## 📄 CV-READY PROJECT ENTRY (Paste This)

**ZuriShop — Containerized Multi-Service Retail Platform** | *DevOps Portfolio Project* | 2026
*Stack: Docker, Docker Compose, Python (FastAPI), PostgreSQL, Redis, Elasticsearch, Prometheus, Grafana, NGINX, PowerShell, REST/JSON, Linux*

- Designed, containerized, and operated a 14-container retail platform: 7 Python/FastAPI microservices, NGINX storefront, PostgreSQL, Redis, Elasticsearch, Prometheus, Grafana, and postgres-exporter.
- Hardened container security and reduced image footprint using **multi-stage Docker builds**, completely stripping `pip` and build tooling from the final runtime image to minimize the CVE attack surface.
- Enforced **12-factor application principles** by externalizing all database credentials into gitignored `.env` files with Compose interpolation, ensuring zero secrets in version control and a seamless migration path to Kubernetes Secrets.
- Replaced fragile in-memory state with PostgreSQL as the source of truth: 3-schema data model (catalog / inventory / orders), migration-style bootstrap (`init.sql`), threaded connection pooling, and **atomic inventory reservation** (`UPDATE … RETURNING` + `CHECK` constraints) that eliminates oversell race conditions at the database layer.
- Engineered automated **cache eviction** by implementing Time-To-Live (TTL) expirations on Redis session keys, preventing memory leaks and Out-Of-Memory (OOM) crashes from abandoned shopping carts.
- Built full-stack observability: Prometheus scraping 8 targets (including database metrics via postgres_exporter), custom Grafana dashboards (request rate, error-budget burn, DB health), and structured JSON logging across every service.
- Executed chaos-engineering and incident-response drills: injected payment-gateway outages, triaged DNS/connection failures through structured logs, and implemented **graceful degradation** (clean HTTP 503 instead of raw 500 stack traces) with visual error-rate recovery proof in Grafana.
- Diagnosed and resolved a multi-layer Redis persistence bug — "ghost" keys surviving restarts due to default RDB snapshots, container writable layers, and an image-declared anonymous volume — then enforced true ephemeral cache behavior (`--save "" --appendonly no`, `--renew-anon-volumes`).
- Proved stateful resilience through crash testing: PostgreSQL orders survived infrastructure restarts via persistent volumes while Redis correctly lost transient carts; documented stale connection-pool behavior and its Kubernetes liveness-probe remedy.
- Automated platform verification with a 15-check PowerShell smoke-test suite (service health, DB connectivity, search indexing, end-to-end checkout) designed as a CI-ready deployment gate; fixed cross-platform pitfalls including UTF-8 payload encoding and swallowed exceptions.
- Resolved Elasticsearch 8.x client incompatibilities (connection/SSL defaults, deprecated query syntax, missing-index crashes) and made the search API degrade gracefully to empty results instead of 500 errors.
- Fixed a browser CORS failure between the storefront and APIs, and designed the production-grade remedy: single-origin routing through an Ingress controller.
- Integrated a legacy PowerShell reporting workload with modern REST APIs to produce enterprise CSV reconciliation reports, demonstrating hybrid/legacy operations.
- Authored a 7-workflow end-to-end operations runbook (golden-path transaction, search lifecycle, load generation, chaos drill, stateful resilience, automated health gate) used for operational validation and stakeholder demos.

---

## 🧾 THE "PROBLEMS WE SOLVED" LEDGER (Your Interview Defense)

Every CV line above maps to a real bug you hit. Keep this list in your head (or notes) so you can defend any bullet with a story:

**1. Elasticsearch indexing returned 500.**
*Real problem:* `/search/index` failed with a 500 because of ES 8.x connection/SSL defaults.
*What you did:* Pinned the client to `==8.13.0`, fixed client initialization, and disabled enrollment/SSL.
*Defends CV bullet:* The Elasticsearch resilience bullet.

**2. Storefront search failed with `TypeError: Failed to fetch`.**
*Real problem:* The browser blocked cross-origin calls from the storefront to the search API.
*What you did:* Root-caused it as a CORS failure, added CORS middleware, and designed the production remedy (single-origin Ingress routing).
*Defends CV bullet:* The CORS bullet.

**3. Application logs were drowned by monitoring noise.**
*Real problem:* Constant `/metrics` and `/healthz` scrapes flooded the logs, hiding real business events.
*What you did:* Implemented structured JSON logging and time-window filtering (`--since` + pattern matching) to cut through the noise.
*Defends CV bullet:* The observability bullet.

**4. State was lost on every restart; there was no source of truth.**
*Real problem:* Services held data in memory, so every restart wiped products, stock, and orders.
*What you did:* Introduced PostgreSQL with a 3-schema model, `init.sql` migration bootstrap, connection pooling, and health-gated startup ordering.
*Defends CV bullet:* The PostgreSQL bullet.

**5. Oversell race condition risk in inventory.**
*Real problem:* Read-modify-write reservation logic could allow two checkouts to sell the same stock.
*What you did:* Replaced it with an atomic `UPDATE … RETURNING` guarded by `CHECK (remaining >= 0)` so the database itself prevents overselling.
*Defends CV bullet:* The PostgreSQL bullet.

**6. Killing the payment service produced ugly raw 500 errors.**
*Real problem:* An unhandled `httpx.ConnectError` (DNS removal on container stop) bubbled up as a 500 stack trace.
*What you did:* Caught `httpx.RequestError` and returned a clean HTTP 503, then proved detect → triage → recover with a chaos drill and a Grafana error-burn chart.
*Defends CV bullet:* The chaos-engineering bullet.

**7. A single error was invisible on the dashboards.**
*Real problem:* One failed request renders as ~0.017 req/s on a rate chart — flat and unreadable.
*What you did:* Generated a 60-request failure burst and switched to `increase()[1m]` on a 15-minute window to make the error spike interview-visible.
*Defends CV bullet:* The observability bullet.

**8. Redis "ghost" keys survived restarts.**
*Real problem:* 60 carts came back after restarts due to default RDB snapshots, container writable layers, and an image-declared anonymous volume that Compose reuses on recreate.
*What you did:* Traced all three layers, disabled persistence (`--save "" --appendonly no`), and renewed the anonymous volume (`--renew-anon-volumes`).
*Defends CV bullet:* The Redis persistence bullet.

**9. First request after a Postgres restart returned 500.**
*Real problem:* Application connection pools held dead TCP sockets after the database rebooted.
*What you did:* Identified the stale-pool behavior, documented it, and prescribed Kubernetes liveness probes / pod restarts as the production remedy.
*Defends CV bullet:* The stateful resilience bullet.

**10. The smoke test failed with 422s and silent failures.**
*Real problem:* PowerShell's `Invoke-RestMethod` sent JSON with the wrong encoding, and `catch` blocks swallowed the real errors.
*What you did:* Forced UTF-8 byte-array payloads, added `.Trim()` for hidden carriage returns, surfaced exception messages — 15/15 checks passed.
*Defends CV bullet:* The automation bullet.

**11. Finance needed legacy CSV reconciliation reports.**
*Real problem:* The business still depends on PowerShell-driven on-prem reporting while the platform is modern REST.
*What you did:* Wrote a PowerShell bridge script that pulls live data from the microservices and emits the enterprise CSV format.
*Defends CV bullet:* The legacy integration bullet.

**12. Database passwords were hardcoded in the Compose file and Python code.**
*Real problem:* Hardcoded secrets fail security scans and would be leaked if pushed to Git.
*What you did:* Enforced 12-factor app principles, moved credentials to a gitignored `.env` file, updated Compose to use `${VAR}` interpolation, and made Python fail fast if `DATABASE_URL` is missing.
*Defends CV bullet:* The Secrets Management bullet.

**13. Abandoned shopping carts caused Redis memory bloat.**
*Real problem:* If a user added items but never checked out, the cart stayed in Redis forever, eventually causing an Out-Of-Memory (OOM) crash.
*What you did:* Implemented `redis_client.expire(key, 3600)` to attach a 1-hour Time-To-Live (TTL) to every cart write, ensuring self-cleaning cache eviction.
*Defends CV bullet:* The Cache Eviction bullet.

**14. Docker images were bloated and contained `pip` and build tools.**
*Real problem:* The default `python:3.12-slim` image includes `pip`, increasing the image size and the CVE attack surface.
*What you did:* Upgraded to multi-stage Dockerfiles (`builder` and `runtime` stages), copying only the compiled dependencies and explicitly running `python -m pip uninstall pip -y` in the final stage.
*Defends CV bullet:* The Container Hardening bullet.

---

## ⚠️ HONESTY RULE (Protects You in the Interview)

- **Do NOT claim yet:** AWS/Azure/GCP, Kubernetes, Terraform, CloudFormation, Pulumi, GitHub Actions/Jenkins/GitLab CI. You haven't built them *yet*.
- **Do claim now:** Docker, microservices, PostgreSQL, Redis, Elasticsearch, Prometheus, Grafana, Python, PowerShell, incident response, troubleshooting, documentation, container security, secrets management.
- As you finish Phase 4 (CI/CD), Phase 5 (Kubernetes), and Phases 2–3 (IaC), **add one bullet per phase** using the same "problem → action → measurable result" formula. By Week 10 your CV will cover the entire Pavago JD with evidence.

---

## 🎯 ONE-LINE PROFESSIONAL SUMMARY (Top of CV)

> *DevOps engineer with hands-on experience building and operating secure, containerized microservices platforms. Proven troubleshooting mindset demonstrated through chaos engineering, incident response, database reliability engineering, container hardening, and automated platform verification with Docker, PostgreSQL, Redis, Elasticsearch, Prometheus, Grafana, Python, and PowerShell.*

---

Save this file as `docs/CV-PROJECT-ENTRY.md` in your repo.
```


<div style='page-break-after: always;'></div>

# File: docs\📘 ZuriShop End-to-End Interview Runbook.md

```md
# 📘 ZuriShop End-to-End Interview Runbook

This is your master interview script. It is structured as a series of **End-to-End Workflows**. For each workflow, you will start with a **Clean Slate**, execute the demonstration across CLI and GUI, and deliver a specific **Interview Narrative**. 

By the end of this runbook, you will have proven every layer of the application, every tool in the Pavago JD, and your ability to operate a production-grade platform.

---


## 0. Service & Port Map

| Layer            | Service              | Port  |
|------------------|----------------------|-------|
| Frontend         | storefront-web       | 8080  |
| API              | product-api          | 8001  |
| API              | cart-service         | 8002  |
| API              | checkout-service     | 8003  |
| API              | payment-service      | 8004  |
| API              | inventory-service    | 8005  |
| API              | notification-service | 8006  |
| API              | search-service       | 8007  |
| Database         | postgres             | 5432  |
| Cache            | redis                | 6379  |
| Search engine    | elasticsearch        | 9200  |
| DB metrics       | postgres-exporter    | 9187  |
| Metrics          | prometheus           | 9090  |
| Dashboards       | grafana              | 3000  |



## 🧹 The Master Reset Commands

Before starting any workflow, you need a way to guarantee a clean state. Use these commands depending on how deep of a reset you need.

### Option A: The "Soft Reset" (Fast - Clears Data Only)
Use this between workflows to clear transactions without waiting for heavy containers like Elasticsearch to reboot.
```powershell
# Flush Redis (Clears all shopping carts)
docker compose exec redis redis-cli FLUSHALL

# Truncate Postgres (Clears all orders, keeps product catalog and stock)
docker compose exec postgres psql -U zurishop -d zurishop -c "TRUNCATE TABLE orders.orders;"

# Reset Inventory to original levels
docker compose exec postgres psql -U zurishop -d zurishop -c "UPDATE inventory.stock SET remaining = 50 WHERE product_id = 'SKU-001'; UPDATE inventory.stock SET remaining = 20 WHERE product_id = 'SKU-002'; UPDATE inventory.stock SET remaining = 100 WHERE product_id = 'SKU-003'; UPDATE inventory.stock SET remaining = 10 WHERE product_id = 'SKU-004';"
```

### Option B: The "Hard Reset" (Slow - Destroys Everything)
Use this if you want to show the platform booting up from absolute zero (e.g., at the very beginning of the interview).
```powershell
docker compose down
docker volume rm zurishop_postgres_data
docker compose up -d --build
Start-Sleep -Seconds 45 # Wait for ES and PG to initialize
curl.exe -X POST http://localhost:8007/search/index # Re-seed search  Or do via GUI
```

---

## 🔄 WORKFLOW 1: The "Golden Path" Transaction (Microservices Orchestration)
**Goal:** Prove that a user action on the frontend successfully orchestrates 5 distinct microservices, writes to a relational database, and cleans up transient cache.

### Step 1: Soft Reset
```powershell
docker compose exec redis redis-cli FLUSHALL
docker compose exec postgres psql -U zurishop -d zurishop -c "TRUNCATE TABLE orders.orders;"
```

### Step 2: Frontend GUI (The User Experience)
1. Open your browser to **http://localhost:8080**
2. **Action:** Click **"Load All Products"**.
   * *Result:* The JSON output populates with 4 items from the `product-api` (PostgreSQL).
3. **Action:** Type `keyboard` in the search box and click **"Search"**.
   * *Result:* The Mechanical Keyboard is returned from Elasticsearch via the `search-service`.

### Step 3: Backend Orchestration (The Checkout Flow)
*Simulate a user adding an item to their cart and checking out.*
```powershell
# 1. Add to Cart (Writes to Redis)
curl.exe -X POST http://localhost:8002/cart/wf1-cart/items -H "Content-Type: application/json" -d '{\"product_id\": \"SKU-002\", \"quantity\": 1}'
# 2. View the state of the cart in redis
docker compose exec redis redis-cli HGETALL cart:wf1-cart

# 3. Trigger Checkout (Orchestrates Inventory, Payment, Notification, DB, and Cart-Clear)
curl.exe -X POST http://localhost:8003/checkout -H "Content-Type: application/json" -d '{\"cart_id\": \"wf1-cart\", \"email\": \"njeri@zurimart.co.ke\"}'
```
✅ **Expected Output:** `{"order_id":"<uuid>","status":"completed","total":6500.0,"currency":"KES"}`

### Step 4: Verification (The DevOps Proof)
```powershell
# Prove the order is permanently saved in PostgreSQL
docker compose exec postgres psql -U zurishop -d zurishop -c "SELECT order_id, total, status FROM orders.orders;"

# Prove the inventory was atomically decremented in PostgreSQL
docker compose exec postgres psql -U zurishop -d zurishop -c "SELECT remaining FROM inventory.stock WHERE product_id = 'SKU-002';"
# ✅ Expected: 19

# Prove the transient cart was cleaned up from Redis
docker compose exec redis redis-cli HGETALL cart:wf1-cart
# ✅ Expected: (empty array)
```

🎤 **Interview Narrative:** 
> *"This demonstrates our core microservices orchestration. A single checkout API call securely reserves inventory in Postgres using atomic constraints, processes a mock payment, queues an email notification, and cleans up the transient Redis cart. I designed this so the database is the single source of truth for permanent state, while Redis handles high-speed session state."*

---

## 🔍 WORKFLOW 2: Decoupled Search Engine Lifecycle (Elasticsearch)
**Goal:** Prove that the search engine is decoupled from the primary database and can be wiped and re-seeded independently without affecting the core application.

### Step 1: Clean Slate (Wipe the Search Index)
```powershell
# Delete the Elasticsearch index entirely
curl.exe -X DELETE "http://localhost:9200/products"
# ✅ Expected: {"acknowledged":true}

# Verify search is now broken (decoupled)
curl.exe "http://localhost:8007/search?q=keyboard"
# ✅ Expected: {"count":0,"hits":[]}
```

### Step 2: Re-Seed the Search Engine
```powershell
# Trigger the search-service to read from product-api and rebuild the ES index
curl.exe -X POST http://localhost:8007/search/index
# ✅ Expected: {"indexed":4}
```

### Step 3: Verification via Elasticsearch API
```powershell
# Check cluster health
curl.exe "http://localhost:9200/_cluster/health?pretty"

# Check index document count
curl.exe "http://localhost:9200/products/_count?pretty"
# ✅ Expected: "count" : 4

# Execute a direct fuzzy search query against Elasticsearch
curl.exe "http://localhost:9200/products/_search?q=mouse&pretty"
```

🎤 **Interview Narrative:** 
> *"In modern architectures, search must be decoupled from the transactional database to prevent load spikes from taking down checkout. Here I wiped the Elasticsearch index and rebuilt it asynchronously by having the search-service pull from the product catalog API. This proves our observability and search layers are resilient and independently deployable."*

---

## 📊 WORKFLOW 3: Traffic Generation & Observability (Prometheus & Grafana)
**Goal:** Generate synthetic load and prove that the observability stack (Prometheus, Grafana, Postgres Exporter) captures it in real-time.

### Step 1: Generate Synthetic Traffic
*Run this PowerShell loop to hammer the checkout service with 50 requests.*
```powershell
1..50 | ForEach-Object {
    $cartId = "load-test-$_"
    Invoke-RestMethod -Uri "http://localhost:8002/cart/$cartId/items" -Method Post -ContentType "application/json" -Body '{"product_id":"SKU-003","quantity":1}' | Out-Null
    Invoke-RestMethod -Uri "http://localhost:8003/checkout" -Method Post -ContentType "application/json" -Body "{`"cart_id`":`"$cartId`",`"email`":`"test@zurimart.co.ke`"}" | Out-Null
    Write-Host "Processed order $_"
}
```

### Step 2: Prometheus GUI Verification
1. Open browser to **http://localhost:9090**
2. **Action:** Click **Status** → **Targets** in the top menu.
   * *Result:* Show the interviewer that all 8 targets (7 Python services + `postgres-exporter`) are highlighted in **GREEN (UP)**.
3. **Action:** Click **Graph** in the top menu.
4. **Action:** Enter this PromQL query and click **Execute**, then switch to the **Graph** tab:
   ```promql
   sum(rate(http_requests_total[1m])) by (job)
   ```
   * *Result:* A multi-colored line chart showing the massive spike in requests per second across your microservices.

### Step 3: Grafana GUI Verification
1. Open browser to **http://localhost:3000** (Login: `admin` / `admin`)
2. **Action:** Go to **Connections** → **Data Sources** → **Add data source** → **Prometheus**.
3. **Action:** Set URL to `http://prometheus:9090` → Click **Save & test**.
4. **Action:** Click the **Dashboards** icon (left menu) → **New** → **New Dashboard** → **Add visualization**.
5. **Action:** Select your Prometheus data source.
6. **Action:** Paste this query to show Database Connection health:
   ```promql
   pg_up
   ```
7. **Action:** Click **Apply**, then **Save Dashboard** (Name it: *ZuriShop Executive Overview*).

🎤 **Interview Narrative:** 
> *"I don't just deploy applications; I make them observable. By integrating the Prometheus FastAPI instrumentator and the Postgres Exporter, I've captured the Golden Signals. In Grafana, we can now visualize the exact traffic spike we just generated, and more importantly, monitor the underlying database connection pool health to prevent saturation during events like the 'Nairobi Mega Sale'."*

---

## 📜 WORKFLOW 4: Legacy Enterprise Integration (PowerShell Automation)
**Goal:** Prove that modern cloud-native microservices can seamlessly integrate with legacy enterprise reporting tools (a specific requirement in the Pavago JD).

### Step 1: Soft Reset
```powershell
docker compose exec redis redis-cli FLUSHALL
```

### Step 2: Execute the Legacy Workload
```powershell
# Run the PowerShell script that queries the modern APIs and generates an enterprise CSV
pwsh legacy-reports/Generate-ZuriShopReport.ps1
```

### Step 3: Verification
```powershell
# Display the generated CSV in the terminal
cat zurishop-report.csv
```
✅ **Expected Output:**
```csv
"ProductId","Name","Price","Currency","Stock"
"SKU-001","Wireless Mouse","1500","KES","50"
"SKU-002","Mechanical Keyboard","6500","KES","20"
...
```

🎤 **Interview Narrative:** 
> *"Real enterprises rarely migrate everything at once. ZuriMart's finance team still relies on PowerShell scripts for end-of-day reconciliation. I wrote this script to bridge the gap, pulling live data from our modern FastAPI microservices and formatting it into the legacy CSV format their on-prem systems expect. This proves I can operate in hybrid environments and automate cross-platform workflows."*

---

## 🔥 WORKFLOW 5: Chaos Engineering & Incident Response (SRE / MR-3)
**Goal:** Simulate a production outage, prove that monitoring detects it, and demonstrate the incident response loop (Detect → Triage → Recover).

### Step 1: The Sabotage (Break the Platform)
```powershell
# Silently kill the payment gateway
docker compose stop payment-service
```

### Step 2: The User Impact (Attempt Checkout)
```powershell
curl.exe -X POST http://localhost:8002/cart/chaos-burst/items -H "Content-Type: application/json" -d '{\"product_id\": \"SKU-001\", \"quantity\": 1}'
curl.exe -X POST http://localhost:8003/checkout -H "Content-Type: application/json" -d '{\"cart_id\": \"chaos-burst\", \"email\": \"angry@customer.com\"}'

docker compose exec redis redis-cli HGETALL cart:chaos-burst

docker compose exec postgres psql -U zurishop -d zurishop -c "SELECT remaining FROM inventory.stock WHERE product_id = 'SKU-001';"
```
❌ **Expected Output:** `{"detail":"Payment service unavailable"}` (HTTP 503)

### Step 3: Triage via Logs (The DevOps Investigation)
```powershell
# Filter out the noise and find the exact failure point in the last 1 minute
docker compose logs --since=1m checkout-service | Select-String "ERROR|Payment service unreachable"
```
✅ **Expected Output:** Shows the `checkout-service` failing to connect to the `payment-service`.

### Step 4: Triage via Grafana (The Executive View)
# Generate a failure burst, then zoom in

1..60 | ForEach-Object {
    $cartId = "chaos-burst-$_"
    Invoke-RestMethod -Uri "http://localhost:8002/cart/$cartId/items" -Method Post -ContentType "application/json" -Body '{"product_id":"SKU-001","quantity":1}' | Out-Null
    try {
        Invoke-RestMethod -Uri "http://localhost:8003/checkout" -Method Post -ContentType "application/json" -Body "{`"cart_id`":`"$cartId`",`"email`":`"angry@customer.com`"}" | Out-Null
    } catch {
        Write-Host "[$_] 503 as expected"
    }
}


2. Open **http://localhost:3000**
3. **Action:** Add a new panel to your dashboard with this PromQL query:
   ```promql

   sum(increase(http_requests_total{status=~"4..|5.."}[1m])) by (job)

   sum(rate(http_requests_total{status=~"4..|5.."}[1m])) by (job)
   ```
   * *Result:* (spike to ~15/min): You killed payment-service and fired the 60-request failure burst → checkout-service burns error budget.

### Step 5: The Recovery
```powershell
# Restore the service
docker compose start payment-service

# Verify the platform is green again

curl.exe -X POST http://localhost:8003/checkout -H "Content-Type: application/json" -d '{\"cart_id\": \"chaos-burst\", \"email\": \"angry@customer.com\"}'

```
✅ **Expected Output:** `{"order_id":"...","status":"completed"...}` if there is still stock or `{"detail":"Could not reserve stock for SKU-001"}` if there is no stock 

# If could not reserve stock update by quantity in redis then try again 
docker compose exec redis redis-cli HGETALL cart:chaos-burst

docker compose exec postgres psql -U zurishop -d zurishop -c "UPDATE inventory.stock SET remaining = 1 WHERE product_id = 'SKU-001';"

curl.exe -X POST http://localhost:8003/checkout -H "Content-Type: application/json" -d '{\"cart_id\": \"chaos-burst\", \"email\": \"angry@customer.com\"}'

🎤 **Interview Narrative:** 
> *"Incidents are inevitable; slow recovery is not. I just simulated a Sev-1 payment gateway failure. Because we have structured JSON logging, I immediately filtered out the Prometheus health-check noise to find the exact connection error. In a real production environment, that Grafana error-rate panel would trigger an Alertmanager webhook to PagerDuty, paging me before customers even notice."*

---

## 🛡️ WORKFLOW 6: Stateful Resilience (Database vs. Cache)
**Goal:** Prove you understand the architectural difference between persistent storage (Volumes) and transient cache, and how Docker handles state during crashes.

### Step 1: Create Persistent State
```powershell
# Create an order
curl.exe -X POST http://localhost:8002/cart/res-cart/items -H "Content-Type: application/json" -d '{\"product_id\": \"SKU-004\", \"quantity\": 1}'

docker compose exec redis redis-cli TTL cart:ttl-cart

curl.exe -X POST http://localhost:8003/checkout -H "Content-Type: application/json" -d '{\"cart_id\": \"res-cart\", \"email\": \"resilience@zurimart.co.ke\"}'
```

### Step 2: Simulate a Total Infrastructure Crash
```powershell
# Hard restart the database and the cache
docker compose restart postgres redis
```

### Step 3: Verify Persistent vs Transient State
```powershell
# 1. Check Postgres (Persistent Volume)
curl.exe http://localhost:8003/orders
# ✅ Expected: The order YOU just created is still there. Data survived the crash.

# 2. Check Redis (Transient Memory)
docker compose exec redis redis-cli DBSIZE
# ✅ Expected: (integer) 0. All carts are gone. This is EXPECTED and CORRECT behavior.
```

🎤 **Interview Narrative:** 
> *"This demonstrates my understanding of stateful workloads. When the infrastructure crashed, PostgreSQL retained the financial records because it is backed by a persistent Docker volume. Redis lost the shopping carts because it is an in-memory cache. Designing systems with this distinction is critical for Disaster Recovery planning and ensuring we never lose Tier-1 financial data."*

---

## 🤖 WORKFLOW 7: The Automated Platform Health Check
**Goal:** Prove that you don't rely on manual clicking. You build automation to verify platform health (CI/CD readiness).

### Step 1: Execute the Master Smoke Test
```powershell
pwsh scripts/smoke-test.ps1
```

✅ **Expected Output:**
```text
=== ZuriShop Smoke Test ===
[PASS] product-api /healthz
[PASS] cart-service /healthz
[PASS] checkout-service /healthz
[PASS] payment-service /healthz
[PASS] inventory-service /healthz
[PASS] notification-service /healthz
[PASS] search-service /healthz
[PASS] storefront-web
[PASS] elasticsearch
[PASS] prometheus
[PASS] postgres
[PASS] search indexing
[PASS] search query
[PASS] checkout flow
[PASS] order persisted in Postgres
ALL CHECKS PASSED
```

🎤 **Interview Narrative:** 
> *"Manual verification doesn't scale. I wrote this PowerShell smoke test to act as the final gate in our CI/CD pipeline. Before any new code is promoted to staging, this script runs automatically. If any microservice, database connection, or search index fails this test, the pipeline halts, and the deployment is rejected. This is how we maintain reliability at speed."*

---

### 🎯 Final Interview Tip
Keep this Markdown file open on one side of your screen during the interview. When they ask, *"Walk me through your project,"* you simply say: 

> *"Let me share my screen and walk you through the 6 end-to-end workflows I use to validate the ZuriShop platform..."* 

Then, just follow the numbers. You will look like an absolute senior-level professional.
```


<div style='page-break-after: always;'></div>

# File: infra\postgres\init.sql

```sql
-- ZuriShop database bootstrap (acts as our migration)
-- Runs automatically on first boot of the postgres container.

CREATE SCHEMA IF NOT EXISTS catalog;
CREATE SCHEMA IF NOT EXISTS inventory;
CREATE SCHEMA IF NOT EXISTS orders;

-- ============ CATALOG ============
CREATE TABLE IF NOT EXISTS catalog.products (
    id       TEXT PRIMARY KEY,
    name     TEXT NOT NULL,
    price    NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    currency TEXT NOT NULL DEFAULT 'KES'
);

INSERT INTO catalog.products (id, name, price, currency) VALUES
    ('SKU-001', 'Wireless Mouse',      1500, 'KES'),
    ('SKU-002', 'Mechanical Keyboard', 6500, 'KES'),
    ('SKU-003', 'USB-C Cable',          700, 'KES'),
    ('SKU-004', 'Laptop Stand',        3200, 'KES')
ON CONFLICT (id) DO NOTHING;

-- ============ INVENTORY ============
CREATE TABLE IF NOT EXISTS inventory.stock (
    product_id TEXT PRIMARY KEY,
    remaining  INTEGER NOT NULL CHECK (remaining >= 0)
);

INSERT INTO inventory.stock (product_id, remaining) VALUES
    ('SKU-001', 50),
    ('SKU-002', 20),
    ('SKU-003', 100),
    ('SKU-004', 10)
ON CONFLICT (product_id) DO NOTHING;

-- ============ ORDERS ============
CREATE TABLE IF NOT EXISTS orders.orders (
    order_id       TEXT PRIMARY KEY,
    cart_id        TEXT NOT NULL,
    customer_email TEXT NOT NULL,
    total          NUMERIC(10,2) NOT NULL,
    currency       TEXT NOT NULL,
    status         TEXT NOT NULL,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_orders_created_at ON orders.orders (created_at DESC);
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

# And notice what is deliberately NOT an image: 
# legacy-reports — it stays a PowerShell script on the host, 
# because that's the whole point (it represents the legacy Windows/PowerShell workload the JD requires, TT-17).
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

  - job_name: postgres-exporter
    metrics_path: /metrics
    static_configs:
      - targets: ["postgres-exporter:9187"]
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
psycopg2-binary
```


<div style='page-break-after: always;'></div>

# File: scripts\smoke-test.ps1

```ps1
# ZuriShop automated smoke test — Bulletproof Edition
$script:failed = $false

function Check($name, $ok) {
    if ($ok) { Write-Host "[PASS] $name" -ForegroundColor Green }
    else     { Write-Host "[FAIL] $name" -ForegroundColor Red; $script:failed = $true }
}

Write-Host "=== ZuriShop Smoke Test ===" -ForegroundColor Cyan

# 1. API health
$ports = @{
    "product-api"=8001; "cart-service"=8002; "checkout-service"=8003
    "payment-service"=8004; "inventory-service"=8005
    "notification-service"=8006; "search-service"=8007
}
foreach ($svc in $ports.Keys) {
    try {
        $r = Invoke-RestMethod -Uri "http://localhost:$($ports[$svc])/healthz" -TimeoutSec 5
        Check "$svc /healthz" ($r.status -eq "healthy")
    } catch { 
        Write-Host "  -> Error: $($_.Exception.Message)" -ForegroundColor Yellow
        Check "$svc /healthz" $false 
    }
}

# 2. Storefront
try { $s = Invoke-WebRequest -Uri http://localhost:8080 -UseBasicParsing -TimeoutSec 5; Check "storefront-web" ($s.StatusCode -eq 200) } catch { Check "storefront-web" $false }

# 3. Elasticsearch
try { $e = Invoke-RestMethod -Uri http://localhost:9200 -TimeoutSec 5; Check "elasticsearch" ($e.tagline -eq "You Know, for Search") } catch { Check "elasticsearch" $false }

# 4. Prometheus
try { Invoke-RestMethod -Uri http://localhost:9090/-/healthy -TimeoutSec 5 | Out-Null; Check "prometheus" $true } catch { Check "prometheus" $false }

# 5. PostgreSQL
try {
    $pg = docker compose exec -T postgres psql -U zurishop -d zurishop -tAc "SELECT 1"
    Check "postgres" ($pg.Trim() -eq "1")
} catch { Check "postgres" $false }

# 6. Search index + query
try {
    $seed = Invoke-RestMethod -Uri http://localhost:8007/search/index -Method Post -TimeoutSec 15
    Check "search indexing" ($seed.indexed -eq 4)
    $sr = Invoke-RestMethod -Uri "http://localhost:8007/search?q=keyboard" -TimeoutSec 5
    Check "search query" ($sr.count -ge 1)
} catch { 
    Write-Host "  -> Search Error: $($_.Exception.Message)" -ForegroundColor Yellow
    Check "search" $false 
}

# 7. End-to-end checkout (FORCED UTF-8 ENCODING)
try {
    $cartId = "smoke-" + (Get-Random)
    
    # Force UTF-8 byte array to prevent PowerShell encoding bugs
    $cartBody = [System.Text.Encoding]::UTF8.GetBytes('{"product_id":"SKU-003","quantity":1}')
    Invoke-RestMethod -Uri "http://localhost:8002/cart/$cartId/items" -Method Post -ContentType "application/json" -Body $cartBody | Out-Null
    
    $checkoutBody = [System.Text.Encoding]::UTF8.GetBytes("{`"cart_id`":`"$cartId`",`"email`":`"smoke@zurimart.co.ke`"}")
    $co = Invoke-RestMethod -Uri http://localhost:8003/checkout -Method Post -ContentType "application/json" -Body $checkoutBody
    Check "checkout flow" ($co.status -eq "completed")
    
    $orders = Invoke-RestMethod -Uri http://localhost:8003/orders
    Check "order persisted in Postgres" ($orders.count -ge 1)
} catch { 
    Write-Host "  -> Checkout Error: $($_.Exception.Message)" -ForegroundColor Yellow
    Check "checkout flow" $false 
}

if ($script:failed) { Write-Host "SMOKE TEST FAILED" -ForegroundColor Red; exit 1 }
Write-Host "ALL CHECKS PASSED" -ForegroundColor Green
```


<div style='page-break-after: always;'></div>

# File: services\cart-service\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\cart-service\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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

CART_TTL_SECONDS = int(os.getenv("CART_TTL_SECONDS", "3600"))


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
    redis_client.expire(key, CART_TTL_SECONDS)

    items = redis_client.hgetall(key)

    logging.info(
        "Added item %s to cart %s (TTL %ss)",
        item.product_id,
        cart_id,
        CART_TTL_SECONDS
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

# File: services\checkout-service\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\checkout-service\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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
from psycopg2.pool import ThreadedConnectionPool
from contextlib import asynccontextmanager
import asyncio
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

PRODUCT_API_URL = os.getenv("PRODUCT_API_URL", "http://localhost:8001")
CART_SERVICE_URL = os.getenv("CART_SERVICE_URL", "http://localhost:8002")
INVENTORY_SERVICE_URL = os.getenv("INVENTORY_SERVICE_URL", "http://localhost:8005")
PAYMENT_SERVICE_URL = os.getenv("PAYMENT_SERVICE_URL", "http://localhost:8004")
NOTIFICATION_SERVICE_URL = os.getenv("NOTIFICATION_SERVICE_URL", "http://localhost:8006")

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL is not set. Inject it via environment or Secrets.")


db_pool = None

@asynccontextmanager
async def lifespan(app: FastAPI):
    # --- STARTUP ---
    global db_pool
    for attempt in range(30):
        try:
            db_pool = ThreadedConnectionPool(1, 5, dsn=DATABASE_URL)
            logging.info("Connected to PostgreSQL")
            break
        except Exception as error:
            logging.warning("PostgreSQL not ready (%s). Retry %s/30", error, attempt + 1)
            await asyncio.sleep(2)
    else:
        raise RuntimeError("Could not connect to PostgreSQL")
        
    yield  # <-- App runs here
    
    # --- SHUTDOWN ---
    if db_pool:
        db_pool.closeall()
        logging.info("PostgreSQL connection pool closed gracefully")

app = FastAPI(title="checkout-service", lifespan=lifespan)

Instrumentator().instrument(app).expose(app, endpoint="/metrics")


class CheckoutRequest(BaseModel):
    cart_id: str
    email: str


@app.get("/")
def root():
    return {"service": "checkout-service", "status": "running"}


@app.get("/healthz")
def healthz():
    return {"status": "healthy"}


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
                params={"quantity": quantity},
            )
            if reserve_response.status_code != 200:
                raise HTTPException(status_code=409, detail=f"Could not reserve stock for {product_id}")

        try:
            payment_response = await client.post(
                f"{PAYMENT_SERVICE_URL}/payments",
                json={"amount": total, "currency": "KES", "customer_email": request.email},
            )
            if payment_response.status_code != 200:
                raise HTTPException(status_code=402, detail="Payment failed")
        except httpx.RequestError as exc:
            # Catches ConnectError, TimeoutException, DNS failures, etc.
            logging.error("Payment service unreachable: %s", exc)
            raise HTTPException(status_code=503, detail="Payment service unavailable")

        # Persist the order (source of truth = PostgreSQL)
        conn = db_pool.getconn()
        try:
            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO orders.orders
                       (order_id, cart_id, customer_email, total, currency, status)
                       VALUES (%s, %s, %s, %s, %s, %s)""",
                    (order_id, request.cart_id, request.email, total, "KES", "completed"),
                )
            conn.commit()
        finally:
            db_pool.putconn(conn)

        await client.post(
            f"{NOTIFICATION_SERVICE_URL}/notifications",
            json={
                "to": request.email,
                "message": f"Your order {order_id} has been confirmed. Total: KES {total}",
                "type": "email",
            },
        )

        await client.delete(f"{CART_SERVICE_URL}/cart/{request.cart_id}")

        logging.info("Order %s completed successfully. Total: %s", order_id, total)

        return {
            "order_id": order_id,
            "status": "completed",
            "total": total,
            "currency": "KES",
        }


@app.get("/orders")
def list_orders():
    conn = db_pool.getconn()
    try:
        with conn.cursor() as cur:
            cur.execute(
                """SELECT order_id, customer_email, total, status, created_at
                   FROM orders.orders ORDER BY created_at DESC LIMIT 20"""
            )
            rows = cur.fetchall()
    finally:
        db_pool.putconn(conn)

    return {
        "count": len(rows),
        "orders": [
            {
                "order_id": r[0],
                "email": r[1],
                "total": float(r[2]),
                "status": r[3],
                "created_at": str(r[4]),
            }
            for r in rows
        ],
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
psycopg2-binary
```


<div style='page-break-after: always;'></div>

# File: services\inventory-service\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\inventory-service\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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
from psycopg2.pool import ThreadedConnectionPool
from contextlib import asynccontextmanager
import asyncio
import logging
import os
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"inventory-service","message":"%(message)s"}',
    stream=sys.stdout
)

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL is not set. Inject it via environment or Secrets.")


db_pool = None

@asynccontextmanager
async def lifespan(app: FastAPI):
    # --- STARTUP ---
    global db_pool
    for attempt in range(30):
        try:
            db_pool = ThreadedConnectionPool(1, 5, dsn=DATABASE_URL)
            logging.info("Connected to PostgreSQL")
            break
        except Exception as error:
            logging.warning("PostgreSQL not ready (%s). Retry %s/30", error, attempt + 1)
            await asyncio.sleep(2)
    else:
        raise RuntimeError("Could not connect to PostgreSQL")
        
    yield  # <-- App runs here
    
    # --- SHUTDOWN ---
    if db_pool:
        db_pool.closeall()
        logging.info("PostgreSQL connection pool closed gracefully")

app = FastAPI(title="inventory-service", lifespan=lifespan)

Instrumentator().instrument(app).expose(app, endpoint="/metrics")


@app.get("/")
def root():
    return {"service": "inventory-service", "status": "running"}


@app.get("/healthz")
def healthz():
    return {"status": "healthy"}


@app.get("/inventory")
def get_inventory():
    conn = db_pool.getconn()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT product_id, remaining FROM inventory.stock ORDER BY product_id")
            rows = cur.fetchall()
    finally:
        db_pool.putconn(conn)

    return [{"product_id": r[0], "remaining": r[1]} for r in rows]


@app.get("/inventory/{product_id}")
def get_product_inventory(product_id: str):
    conn = db_pool.getconn()
    try:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT product_id, remaining FROM inventory.stock WHERE product_id = %s",
                (product_id,),
            )
            row = cur.fetchone()
    finally:
        db_pool.putconn(conn)

    if row is None:
        raise HTTPException(status_code=404, detail="Product not found in inventory")

    return {"product_id": row[0], "remaining": row[1]}


@app.post("/inventory/{product_id}/reserve")
def reserve_inventory(product_id: str, quantity: int = 1):
    if quantity <= 0:
        raise HTTPException(status_code=400, detail="Quantity must be greater than zero")

    conn = db_pool.getconn()
    try:
        with conn.cursor() as cur:
            # Atomic reservation: the DB guarantees no oversell (CHECK remaining >= 0)
            cur.execute(
                """UPDATE inventory.stock
                   SET remaining = remaining - %s
                   WHERE product_id = %s AND remaining >= %s
                   RETURNING remaining""",
                (quantity, product_id, quantity),
            )
            row = cur.fetchone()
            conn.commit()

            if row is None:
                cur.execute(
                    "SELECT 1 FROM inventory.stock WHERE product_id = %s",
                    (product_id,),
                )
                exists = cur.fetchone() is not None
    finally:
        db_pool.putconn(conn)

    if row is None:
        if not exists:
            raise HTTPException(status_code=404, detail="Product not found in inventory")
        raise HTTPException(status_code=409, detail="Insufficient stock")

    logging.info("Reserved %s units of %s. Remaining: %s", quantity, product_id, row[0])

    return {"product_id": product_id, "reserved": quantity, "remaining": row[0]}
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
psycopg2-binary
```


<div style='page-break-after: always;'></div>

# File: services\notification-service\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\notification-service\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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

# File: services\payment-service\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\payment-service\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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

# File: services\product-api\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\product-api\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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
from psycopg2.pool import ThreadedConnectionPool
from contextlib import asynccontextmanager
import asyncio
import logging
import os
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"product-api","message":"%(message)s"}',
    stream=sys.stdout
)

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL is not set. Inject it via environment or Secrets.")

db_pool = None

@asynccontextmanager
async def lifespan(app: FastAPI):
    # --- STARTUP ---
    global db_pool
    for attempt in range(30):
        try:
            db_pool = ThreadedConnectionPool(1, 5, dsn=DATABASE_URL)
            logging.info("Connected to PostgreSQL")
            break
        except Exception as error:
            logging.warning("PostgreSQL not ready (%s). Retry %s/30", error, attempt + 1)
            await asyncio.sleep(2)
    else:
        raise RuntimeError("Could not connect to PostgreSQL")
        
    yield  # <-- App runs here
    
    # --- SHUTDOWN (Graceful Teardown) ---
    if db_pool:
        db_pool.closeall()
        logging.info("PostgreSQL connection pool closed gracefully")

app = FastAPI(title="product-api", lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

Instrumentator().instrument(app).expose(app, endpoint="/metrics")


@app.get("/")
def root():
    return {"service": "product-api", "status": "running"}


@app.get("/healthz")
def healthz():
    return {"status": "healthy"}


@app.get("/products")
def get_products():
    conn = db_pool.getconn()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT id, name, price, currency FROM catalog.products ORDER BY id")
            rows = cur.fetchall()
    finally:
        db_pool.putconn(conn)

    return [
        {"id": r[0], "name": r[1], "price": float(r[2]), "currency": r[3]}
        for r in rows
    ]


@app.get("/products/{product_id}")
def get_product(product_id: str):
    conn = db_pool.getconn()
    try:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT id, name, price, currency FROM catalog.products WHERE id = %s",
                (product_id,),
            )
            row = cur.fetchone()
    finally:
        db_pool.putconn(conn)

    if row is None:
        raise HTTPException(status_code=404, detail="Product not found")

    return {"id": row[0], "name": row[1], "price": float(row[2]), "currency": row[3]}
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
psycopg2-binary
```


<div style='page-break-after: always;'></div>

# File: services\search-service\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
```


<div style='page-break-after: always;'></div>

# File: services\search-service\Dockerfile

```text
# ---------- Stage 1: builder (has pip, wheels, build cache) ----------
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Stage 2: runtime (no pip, no build tools, tiny attack surface) ----------
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
RUN python -m pip uninstall pip -y
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
from elasticsearch import Elasticsearch, NotFoundError
from contextlib import asynccontextmanager
import httpx
import os
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format='{"level":"%(levelname)s","service":"search-service","message":"%(message)s"}',
    stream=sys.stdout
)

ELASTICSEARCH_URL = os.getenv("ELASTICSEARCH_URL", "http://localhost:9200")
PRODUCT_API_URL = os.getenv("PRODUCT_API_URL", "http://localhost:8001")
INDEX_NAME = "products"

es = Elasticsearch([ELASTICSEARCH_URL])

@asynccontextmanager
async def lifespan(app: FastAPI):
    # --- STARTUP ---
    try:
        if not es.indices.exists(index=INDEX_NAME):
            es.indices.create(index=INDEX_NAME)
            logging.info("Created Elasticsearch index: %s", INDEX_NAME)
    except Exception as error:
        logging.warning("Could not create Elasticsearch index: %s", error)
        
    yield  # <-- App runs here
    
    # --- SHUTDOWN ---
    es.close()
    logging.info("Elasticsearch client closed gracefully")

app = FastAPI(title="search-service", lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

Instrumentator().instrument(app).expose(app, endpoint="/metrics")


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
        
    # Gracefully handle missing index (decoupled state)
    if not es.indices.exists(index=INDEX_NAME):
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
    
    try:
        response = es.search(index=INDEX_NAME, query=query["query"])
        hits = [
            hit["_source"]
            for hit in response["hits"]["hits"]
        ]
        return {
            "count": len(hits),
            "hits": hits
        }
    except NotFoundError:
        # Fallback if index is deleted between the check and the search
        return {
            "count": 0,
            "hits": []
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

# File: storefront-web\.dockerignore

```dockerignore
# --- Python bytecode & cache (never needed in images) ---
__pycache__/
*.pyc
*.pyo
*.pyd
.pytest_cache/

# --- Virtual environments (huge, host-only) ---
.venv/
venv/

# --- Secrets (must NEVER be baked into an image) ---
.env
.env.*

# --- Version control metadata ---
.git/
.gitignore

# --- Build metadata (keeps context lean & cache stable) ---
Dockerfile
.dockerignore

# --- Docs ---
*.md
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
    <button onclick="reseedSearch()">Admin: Re-seed Search</button>

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

    async function reseedSearch() {
      try {
        const response = await fetch(`${SEARCH_API_URL}/search/index`, { method: "POST" });
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
"SKU-003","USB-C Cable","700","KES","50"
"SKU-004","Laptop Stand","3200","KES","10"

```

