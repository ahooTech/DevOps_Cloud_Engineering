#  Platform Foundation: Golden Paths & IDP Scaffolding

## 🎯 Vision
Enable developer self-service through standardized, secure, and observable "Golden Paths" powered by an Internal Developer Platform (IDP).
**Goal:** Reduce "Hello World" to "Production" time from 2 weeks to <45 minutes.

---

## 🐣 Golden Path 1: New Microservice
*For application developers building HTTP/gRPC services.*

### 1. Provisioning (Self-Service)
- **Trigger:** Developer clicks "Create Service" in Backstage/Port.io
- **Action:** Scaffolds GitHub Repo from `myorg/service-template` (includes `.github/workflows`, `Dockerfile`, `k8s/manifests`)
- **Result:** Repo created + Webhook triggers CI pipeline.

### 2. CI/CD Pipeline (Terragrunt + ArgoCD)
- **CI (GitHub Actions):** 
  - `make test` (Unit tests)
  - `trivy image` (Container scan)
  - `opa eval` (Policy check: e.g., "Must have resource limits")
- **CD (ArgoCD):** 
  - Syncs `k8s/manifests` to the specific environment (Dev/Staging/Prod) based on branch protection rules.
  - **Parity:** Uses Helm charts aligned with `parity-matrix.csv`.

### 3. Observability (OpenTelemetry)
- **Auto-Injected:** Sidecar or eBPF agent (if supported) attaches to the workload.
- **Dashboard:** Grafana dashboard is auto-provisioned via `dashboard.json` in the repo.
- **Logs:** `stdout/stderr` routed to Loki/Elastic with service labels.

### 4. Security (Shift-Left)
- **Network:** Default `NetworkPolicy` denies all ingress/egress (Zero Trust).
- **Secrets:** External Secrets Operator fetches creds from Vault/AWS Secrets Manager (No k8s secrets).
- **RBAC:** App Service Account only has access to its specific namespace.

---

## 📊 Golden Path 2: Data Pipeline
*For data engineers running batch/stream processing.*

### 1. Infrastructure (Crossplane Composition)
- **Developer Input:** Creates `XBatchJob` manifest specifying `storage_size`, `memory`, `schedule`.
- **Platform Action:** Crossplane provisions:
  - S3/Blob Storage (with lifecycle policies)
  - Ephemeral K8s Job runner (or Spark Cluster on EKS)
- **Cost:** Auto-deletes resources after TTL (Time To Live).

### 2. Execution & Monitoring
- **Scheduler:** Airflow/Dagster integration or K8s CronJob.
- **Metrics:** Custom Prometheus metrics (`rows_processed_total`, `job_duration_seconds`).
- **Alerting:** PagerDuty alert on `job_failed_total > 0`.

---

## 🛡️ Self-Service Portal Scaffolding (IDP)
*The "Storefront" for the platform.*

### 1. Service Catalog
- **Schema:** Defined in `backstage/catalog-info.yaml`.
- **Types:** `Component`, `System`, `API`, `Resource`.
- **Ownership:** Linked to GitHub Teams (e.g., `team: payments-squad`).

### 2. Role-Based Access Control (RBAC)
| Role          | Permissions                                                      |
|------         |-------------                                                     |
| **Developer** | Create Service, View Logs, Restart Pods, Read DB                 |
| **SRE**       | Manage ArgoCD, Edit ConfigMaps, View Security Alerts, Audit Logs |
| **Admin**     | Manage Clusters, Define Policies, Manage IDP                     |

### 3. Engineering Standards
- **Docs:** All services must have a `README.md` and `adr/` (Architecture Decision Records).
- **SLA:** Tier 1 services must have SLOs defined in `slo.yaml`.
- **Compliance:** All infrastructure must pass `checkov` scans before merge.