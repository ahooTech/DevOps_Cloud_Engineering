Use this one only.

Below is the **complete regenerated master job description and learning plan**, with every bullet point numbered and every mini-project milestone woven directly into the bullet points at the exact stage you should build it. Nothing has been removed.

---

# FINAL MASTER JOB DESCRIPTION + LEARNING PLAN  
## Production AI/ML Engineer — Safaricom-Ready

---

## Target Role

You are training to become a **Production AI/ML Engineer**.

Not a notebook-only data scientist.

Not a prompt engineer only.

Not someone who only watches tutorials.

You are training to become an engineer who can:

```text
Take a machine learning model
→ Connect it to real data
→ Deploy it safely
→ Monitor it
→ Scale it
→ Secure it
→ Keep it reliable in production
```

This is the type of AI engineer that Safaricom, M-PESA, top banks, fintechs, and large enterprise AI teams need.

---

## Mission

Build, deploy, secure, monitor, and scale AI systems that solve real business problems in high-volume environments such as:

- M-PESA-style financial transactions.
- Telecom customer data.
- Fraud detection.
- Credit scoring.
- Customer churn prediction.
- Network optimization.
- Customer support automation.
- Enterprise document intelligence.

Your job is to make AI work reliably in production, not just look good in a demo.

---

## Core Identity

You must become this type of engineer:

```text
Software Engineer
+ Machine Learning Engineer
+ Big Data Engineer
+ MLOps Engineer
+ Applied GenAI Engineer
```

You do not need to be world-class in all five.

But you must be dangerous in all five.

---

# Learning Rules

These rules control the whole plan.

---

## Rule 1: Bullet point by bullet point

We learn one bullet point at a time.

Example:

```text
Python functions
→ Practice
→ Review
→ Master
→ Move to next bullet point
```

---

## Rule 2: No big project after every bullet point

Small bullet points get small exercises.

Example:

```text
Learn functions
→ Solve 3 function problems
```

We do not build a huge project yet.

---

## Rule 3: Combine bullet points into mini projects

Once enough bullet points are learned, we combine them.

Example:

```text
Functions
+ Lists
+ Dictionaries
+ Error handling
+ Testing
= Transaction Analyzer project
```

---

## Rule 4: One serious project per section

At the end of each section, you build one serious section project.

That project proves you can apply that section at a mid-level AI/ML engineering standard.

---

## Rule 5: Move only after exit check

You do not move because time has passed.

You move because you can prove the skill.

Exit check example:

```text
I can build a tested Python API that validates input and handles errors.
```

If you cannot do that yet, we stay and practice more.

---

## Rule 6: No random internet resources

You do not need to use the whole internet.

You will use:

- Me as your main guide.
- Official documentation when necessary.
- Your own code.
- Your own errors.
- Your own fixes.

No tutorial hopping.

No random courses.

No collecting resources.

---

# Your Study Capacity

Your schedule:

```text
5 hours/day
5 days/week
= 25 hours/week
```

This is strong.

If you stay consistent, you can make serious progress.

---

# Total Realistic Timeline

At 25 hours per week, your realistic timeline is:

```text
700–850 active learning hours
28–34 weeks
About 7–8 months
```

This is the fastest serious path.

Can it be shorter?

Yes, if you already have stronger experience.

Can it be longer?

Yes, if you rush poorly, skip projects, or fail exit checks.

Do not aim for speed only.

Aim for production-level ability.

---

# Learning Order

This is the correct order.

Do not change it.

```text
1. Software Engineering Foundations
2. SQL Mastery
3. Machine Learning Fundamentals
4. Production Machine Learning Engineering
5. MLOps and Deployment
6. Cloud Engineering
7. Big Data Engineering
8. Real-Time AI Systems
9. Applied Generative AI
10. ML System Design + Security/Governance
```

---

# Section 1  
## Software Engineering Foundations

### Goal

Become someone who can write clean, reliable Python code instead of messy notebook scripts.

This is the foundation for everything else.

---

### Time Estimate

```text
60–80 hours
2.5–3.5 weeks at 25 hours/week
```

Target:

```text
3 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Python basics.
2. Variables.
3. Data types.
4. Strings.
5. Numbers.
6. Booleans.
7. Conditionals.
8. Loops.
9. Functions.
10. Lists.
11. Dictionaries.

> 🔨 **MILESTONE 1 — After bullet 11 (Dictionaries): Build Transaction Summaries.**
> Build `summarize_transactions(transactions)` returning total, highest, average, and high-value count (`amount > 50000`). No files, no JSON, no tests yet. Core Python only.

12. Sets.

> 🔨 **MILESTONE 2 — After bullet 12 (Sets): Build Customer Grouping.**
> Build `total_by_customer(transactions)` grouping transaction amounts by customer ID, plus unique customer counts using sets.

13. Tuples.
14. Comprehensions.
15. File handling.

> 🔨 **MILESTONE 3 — After bullet 15 (File handling): Build Log Parsing.**
> Build `parse_log_file(file_path)` that reads a transactions log file and returns structured records (date, customer, amount).

16. JSON handling.

> 🔨 **MILESTONE 4 — After bullet 16 (JSON handling): Build JSON Processing.**
> Build `load_json_transactions(file_path)` that reads JSON transaction data and produces totals, high-value transactions, and suspicious customers.

17. Errors and exceptions.

> 🔨 **MILESTONE 5 — After bullet 17 (Errors and exceptions): Harden With Error Handling.**
> Upgrade all previous mini projects: handle empty lists, negative amounts, non-numeric values, missing files, invalid JSON, and missing keys. Raise `ValueError` for invalid input.

18. Logging.
19. Type hints.

> 🔨 **MILESTONE 6 — After bullet 19 (Type hints): Build Simple Risk Scoring.**
> Build `calculate_risk_score(amount, previous_defaults)` with type hints and logging. Rules: `amount > 50000` adds 30; `previous_defaults > 0` adds 50. Return `risk_score` and decision (`approve` / `review` / `reject`).

20. Modular code.
21. Project structure.
22. Virtual environments.
23. Git basics.
24. GitHub basics.
25. Unit testing basics.

> 🔨 **MILESTONE 7 — After bullet 25 (Unit testing basics): Add Basic Tests + Professional Structure.**
> Convert your risk scorer into a proper project: `src/`, `tests/`, `requirements.txt`, `.gitignore`, `README.md`, virtual environment, pushed to GitHub, with pytest tests for normal, high-amount, default, combined, and invalid cases.

26. Debugging.
27. Reading stack traces.
28. Basic API concepts.
29. Backend thinking.

> 🔨 **MILESTONE 8 — After bullet 29 (Backend thinking): Build Small Backend Service.**
> Expose your risk scorer through a FastAPI `POST /risk` endpoint with JSON input/output and validation.

---

### Practice Focus

You will solve practical Python problems such as:

- Transaction summaries.
- Customer grouping.
- Log parsing.
- JSON processing.
- Error handling.
- Simple risk scoring.
- Basic tests.
- Small backend service.

No heavy LeetCode yet.

We will use practical engineering problems first.

---

### Section Project

## Transaction Risk Checker

Build a Python project that:

- Accepts transaction data.
- Validates input.
- Calculates risk score.
- Returns decision.
- Has tests.
- Has logging.
- Has error handling.
- Is pushed to GitHub.
- Has a README.
- Optionally exposes a simple FastAPI endpoint.

Example input:

```json
{
  "amount": 60000,
  "previous_defaults": 1
}
```

Example output:

```json
{
  "risk_score": 80,
  "decision": "review"
}
```

This section project is the final upgraded version of Milestones 1–8 combined.

---

### Exit Check

You can move to Section 2 when you can say:

```text
I can write structured Python code with functions, classes, tests, error handling, logging, and Git version control.
```

---

# Section 2  
## SQL Mastery

### Goal

Become strong enough to query real enterprise data.

AI systems in banks, telecoms, and fintechs run on data stored in databases.

If your SQL is weak, your AI engineering journey will be painful.

---

### Time Estimate

```text
40–60 hours
1.5–2.5 weeks at 25 hours/week
```

Target:

```text
2 weeks
```

---

### Bullet Points to Master (With Milestones)

1. SELECT.
2. WHERE.
3. ORDER BY.
4. COUNT.
5. SUM.
6. AVG.
7. MIN.
8. MAX.
9. GROUP BY.
10. HAVING.
11. DISTINCT.
12. NULL handling.
13. CASE statements.

> 🔨 **MILESTONE 1 — After bullet 13 (CASE statements): Build Basic Transaction Summary Queries.**
> Write queries for daily totals, transaction counts, average amounts, and high-value transaction counts using aggregations, GROUP BY, HAVING, and CASE.

14. INNER JOIN.
15. LEFT JOIN.
16. JOINs (multi-table joins).

> 🔨 **MILESTONE 2 — After bullet 16 (JOINs): Build Customer + Transaction Analysis.**
> Join customers and transactions tables to produce per-customer totals, counts, and customer grouping summaries.

17. Subqueries.
18. CTEs.

> 🔨 **MILESTONE 3 — After bullet 18 (CTEs): Build Multi-Step CTE Reports.**
> Rewrite your analyses using CTEs and subqueries: e.g., customers above average spend, top customers per day.

19. Date/time functions.
20. Deduplication.
21. Time-series aggregation.

> 🔨 **MILESTONE 4 — After bullet 21 (Time-series aggregation): Build Rolling & Time-Based Aggregations.**
> Build daily/weekly summaries and rolling totals using date functions and deduplication of repeated events.

22. Window functions.
23. ROW_NUMBER.
24. RANK.
25. DENSE_RANK.
26. LEAD.
27. LAG.
28. SUM OVER.
29. AVG OVER.
30. PARTITION BY.

> 🔨 **MILESTONE 5 — After bullet 30 (PARTITION BY): Build Advanced Window Function Project.**
> Calculate each customer’s rolling 7-day transaction total, rank customers by spend, and compare each transaction to the previous one using LAG/LEAD.

31. Retention basics.
32. Funnel basics.

> 🔨 **MILESTONE 6 — After bullet 32 (Funnel basics): Build Retention & Funnel Analysis.**
> Write queries for customer retention (active this month vs last month) and funnel steps (registered → transacted → repeated).

33. Query optimization basics.
34. Indexing basics.
35. Partitioning basics.

---

### Practice Focus

You will solve SQL problems based on:

- Transactions.
- Customers.
- Loans.
- Repayments.
- Fraud flags.
- Customer events.
- Telecom usage logs.

Example question:

```text
Find customers who made more than 5 transactions in the last 7 days.
```

Another example:

```text
Calculate each customer’s rolling 7-day transaction total.
```

---

### Section Project

## Banking/Telecom Transaction Analytics

Build a SQL project that:

- Uses a realistic dataset.
- Creates customer transaction summaries.
- Calculates rolling aggregates.
- Identifies high-risk customers.
- Finds duplicate or suspicious transactions.
- Produces daily/weekly summaries.
- Includes optimized queries.
- Is pushed to GitHub with SQL files and README.

This section project combines Milestones 1–6.

---

### Exit Check

You can move to Section 3 when you can say:

```text
I can write joins, CTEs, window functions, and transaction-style analytics queries without struggling too much.
```

---

# Section 3  
## Machine Learning Fundamentals

### Goal

Understand how machine learning models actually work.

You must not jump into deployment before you understand models, metrics, features, and evaluation.

---

### Time Estimate

```text
80–120 hours
3–5 weeks at 25 hours/week
```

Target:

```text
4 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Supervised learning.
2. Unsupervised learning basics.
3. Classification.
4. Regression.

> 🔨 **MILESTONE 1 — After bullet 4 (Regression): Train Your First Models.**
> Train a simple classifier and a simple regressor on clean data. Predict and inspect outputs. No fancy evaluation yet.

5. Train/test split.
6. Validation split.
7. Cross-validation.
8. Overfitting.
9. Underfitting.
10. Bias/variance tradeoff.

> 🔨 **MILESTONE 2 — After bullet 10 (Bias/variance tradeoff): Diagnose Model Fit.**
> Deliberately overfit and underfit models, then explain and fix each case using splits and cross-validation.

11. Accuracy.
12. Precision.
13. Recall.
14. F1-score.
15. Confusion matrix.
16. ROC curve.
17. AUC.
18. Threshold tuning.

> 🔨 **MILESTONE 3 — After bullet 18 (Threshold tuning): Build Full Model Evaluation.**
> Evaluate a model with accuracy, precision, recall, F1, confusion matrix, ROC/AUC, and choose a business-appropriate threshold.

19. Imbalanced data.
20. SMOTE basics.
21. Class weights.

> 🔨 **MILESTONE 4 — After bullet 21 (Class weights): Handle Imbalanced Data.**
> Train on a fraud-like imbalanced dataset using class weights/SMOTE and compare recall before and after.

22. Feature engineering.
23. Missing values.
24. Outliers.
25. Encoding categorical variables.
26. Scaling.
27. Normalization.
28. Standardization.
29. Data leakage.
30. Feature importance.

> 🔨 **MILESTONE 5 — After bullet 30 (Feature importance): Build Feature Engineering Mini Project.**
> Clean a messy dataset (missing values, outliers, encoding, scaling), engineer features, avoid leakage, and rank feature importance.

31. Baseline models.
32. Logistic regression.
33. Decision trees.
34. Random forest.
35. Gradient boosting.
36. XGBoost.
37. LightGBM.

> 🔨 **MILESTONE 6 — After bullet 37 (LightGBM): Build Model Comparison Mini Project.**
> Compare baseline, logistic regression, random forest, XGBoost, and LightGBM on the same task with proper metrics.

38. Scikit-learn pipelines.
39. Model persistence.
40. Model evaluation reports.

---

### Practice Focus

You will build models for:

- Loan default prediction.
- Customer churn prediction.
- Fraud detection.
- Risk scoring.
- Simple demand forecasting.

You will learn to answer:

```text
Why did the model make this prediction?
Is the model actually useful?
What metric matters for the business?
What happens if the model is wrong?
```

---

### Section Project

## Loan Default or Customer Churn Model

Build a machine learning project that:

- Loads real or realistic data.
- Cleans the data.
- Engineers features.
- Trains multiple models.
- Compares models.
- Handles imbalanced data.
- Uses proper evaluation metrics.
- Avoids data leakage.
- Saves the best model.
- Has a clear README.
- Is pushed to GitHub.

Recommended project:

```text
Loan Default Prediction Model
```

or

```text
Customer Churn Prediction Model
```

This section project combines Milestones 1–6.

---

### Exit Check

You can move to Section 4 when you can say:

```text
I can train, evaluate, compare, save, and explain a machine learning model properly.
```

---

# Section 4  
## Production Machine Learning Engineering

### Goal

Move from notebook ML to production ML.

This is where you become more valuable.

A model in a notebook is an experiment.

A model in a tested, deployed API is engineering.

---

### Time Estimate

```text
60–90 hours
2.5–3.5 weeks at 25 hours/week
```

Target:

```text
3 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Production project structure.
2. Configuration management.
3. Environment variables.
4. Dependency management.
5. Model loading.
6. Model versioning.

> 🔨 **MILESTONE 1 — After bullet 6 (Model versioning): Build Model Loading & Versioning Script.**
> Save, version, and load your Section 3 model with config and environment variables. No API yet.

7. Input validation.
8. Pydantic models.
9. FastAPI.
10. REST APIs.
11. JSON requests.
12. JSON responses.

> 🔨 **MILESTONE 2 — After bullet 12 (JSON responses): Build First Prediction Endpoint.**
> Create a `POST /predict` endpoint that validates input with Pydantic and returns prediction + risk score as JSON.

13. Error handling in APIs.
14. Logging in APIs.
15. Testing APIs.

> 🔨 **MILESTONE 3 — After bullet 15 (Testing APIs): Build Tested Prediction API.**
> Add error handling, logging, and automated API tests to your prediction endpoint.

16. Docker basics.
17. Dockerfile.
18. Docker Compose.

> 🔨 **MILESTONE 4 — After bullet 18 (Docker Compose): Dockerize the API.**
> Containerize your prediction API and run it with Docker/Docker Compose.

19. Model serialization.
20. Pickle/Joblib.
21. ONNX basics, optional.
22. API latency basics.
23. Request/response testing.
24. Health check endpoints.
25. README documentation.

---

### Practice Focus

You will take your Section 3 model and turn it into a service.

Example:

```text
Loan default model
→ Saved model
→ FastAPI prediction endpoint
→ Docker container
→ Test requests
```

---

### Section Project

## Model Prediction API

Build a production-style ML API that:

- Loads a trained model.
- Accepts prediction requests.
- Validates input.
- Returns prediction and risk score.
- Handles errors gracefully.
- Logs requests.
- Has tests.
- Runs inside Docker.
- Has API documentation.
- Is pushed to GitHub.

Example endpoint:

```text
POST /predict
```

Example request:

```json
{
  "amount": 45000,
  "previous_defaults": 0,
  "customer_age": 29,
  "monthly_income": 35000
}
```

Example response:

```json
{
  "prediction": 0.23,
  "decision": "approve"
}
```

This section project combines Milestones 1–4.

---

### Exit Check

You can move to Section 5 when you can say:

```text
I can serve a trained machine learning model through a tested, documented, Dockerized API.
```

---

# Section 5  
## MLOps and Deployment

### Goal

Learn how models are managed, tracked, deployed, monitored, and retrained.

This is what separates toy ML from enterprise ML.

---

### Time Estimate

```text
60–90 hours
2.5–3.5 weeks at 25 hours/week
```

Target:

```text
3 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Experiment tracking.
2. MLflow basics.
3. Model registry.
4. Model versioning.

> 🔨 **MILESTONE 1 — After bullet 4 (Model versioning): Track & Register Your Model.**
> Add MLflow experiment tracking and model registry to your Section 3/4 training script.

5. Pipeline thinking.
6. Airflow basics.
7. DAGs.
8. Scheduled jobs.

> 🔨 **MILESTONE 2 — After bullet 8 (Scheduled jobs): Build Scheduled Training DAG.**
> Create an Airflow DAG that runs your training job on a schedule.

9. CI/CD basics.
10. GitHub Actions.
11. Automated testing.

> 🔨 **MILESTONE 3 — After bullet 11 (Automated testing): Build CI Pipeline.**
> Add GitHub Actions that run your tests automatically on every push.

12. Docker review.
13. Kubernetes basics.
14. Containers vs pods.
15. Deployment basics.
16. Service basics.

> 🔨 **MILESTONE 4 — After bullet 16 (Service basics): Deploy Model API to Kubernetes.**
> Deploy your containerized model API locally with Kubernetes (e.g., minikube/kind) using deployments and services.

17. Environment configuration.
18. Logging.
19. Monitoring.
20. Alerting.
21. Data drift.
22. Model drift.
23. Inference latency.
24. Performance metrics.

> 🔨 **MILESTONE 5 — After bullet 24 (Performance metrics): Build Monitoring & Drift Alerts.**
> Add monitoring, alerting, latency tracking, and basic drift detection to your deployed model.

25. Retraining pipelines.
26. Rollbacks.
27. Shadow deployment.
28. Canary deployment.
29. A/B testing basics.

---

### Practice Focus

You will answer:

```text
How do I know my model is still working?
How do I retrain it automatically?
How do I deploy a new version safely?
How do I roll back if it fails?
How do I track experiments?
```

---

### Section Project

## Automated ML Pipeline

Build an MLOps-style project that:

- Trains a model.
- Tracks experiments with MLflow.
- Registers the model.
- Uses Airflow or GitHub Actions for automation.
- Runs tests.
- Deploys the model API.
- Monitors basic performance.
- Includes drift detection.
- Has a README and architecture diagram.

Recommended pipeline:

```text
Data
→ Training
→ Evaluation
→ MLflow tracking
→ Model registry
→ API deployment
→ Monitoring
```

This section project combines Milestones 1–5.

---

### Exit Check

You can move to Section 6 when you can say:

```text
I can track, test, deploy, monitor, and retrain a model using basic MLOps practices.
```

---

# Section 6  
## Cloud Engineering

### Goal

Learn how to run AI systems in the cloud.

Safaricom-scale systems are not run only on laptops.

You must understand cloud deployment, storage, permissions, monitoring, and cost.

---

### Time Estimate

```text
50–80 hours
2–3.5 weeks at 25 hours/week
```

Target:

```text
2.5 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Cloud basics.
2. AWS account setup.
3. IAM basics.
4. Users.
5. Roles.
6. Permissions.
7. S3.

> 🔨 **MILESTONE 1 — After bullet 7 (S3): Store Model Artifacts in S3.**
> Upload your trained model and datasets to S3 with proper access control.

8. EC2.
9. RDS.

> 🔨 **MILESTONE 2 — After bullet 9 (RDS): Run a Simple Cloud App.**
> Launch an EC2 instance and run a small service that reads/writes data (e.g., from RDS or S3).

10. ECS basics.
11. EKS basics.
12. Lambda basics.
13. CloudWatch.
14. Secrets Manager.
15. Environment variables.
16. Docker in the cloud.
17. API deployment.

> 🔨 **MILESTONE 3 — After bullet 17 (API deployment): Deploy Your ML API to AWS.**
> Deploy your Dockerized prediction API to AWS using EC2 or ECS.

18. Logging in cloud.
19. Monitoring in cloud.
20. Cost awareness.
21. Free tier discipline.

> 🔨 **MILESTONE 4 — After bullet 21 (Free tier discipline): Add Cloud Logging, Monitoring & Cost Controls.**
> Add CloudWatch logs/monitoring, secrets management, and cost controls to your deployed API.

22. SageMaker basics.
23. Model hosting basics.
24. Security basics.
25. Public vs private resources.

---

### Practice Focus

You will deploy your ML API to AWS.

You will learn:

```text
How do I put my API online?
How do I store data securely?
How do I control access?
How do I monitor it?
How do I avoid unnecessary cloud costs?
```

---

### Section Project

## Cloud-Deployed ML API

Build a project that:

- Deploys your prediction API to AWS.
- Uses Docker.
- Stores model artifacts securely.
- Uses environment variables.
- Logs requests.
- Monitors basic health.
- Has cost controls.
- Includes a README.
- Includes an architecture diagram.

Recommended architecture:

```text
FastAPI app
→ Docker
→ AWS ECS or EC2
→ CloudWatch logs
→ S3 model storage
→ IAM permissions
```

This section project combines Milestones 1–4.

---

### Exit Check

You can move to Section 7 when you can say:

```text
I can deploy and secure a small AI service in the cloud.
```

---

# Section 7  
## Big Data Engineering

### Goal

Learn how to process data that is too large for normal Python Pandas processing.

This is extremely important for Safaricom-style companies.

Telecom and fintech data can be huge.

You must understand distributed processing.

---

### Time Estimate

```text
80–120 hours
3–5 weeks at 25 hours/week
```

Target:

```text
4 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Big data concepts.
2. Distributed computing basics.
3. PySpark.
4. Spark DataFrames.
5. Spark sessions.
6. Reading CSV.
7. Reading JSON.
8. Reading Parquet.

> 🔨 **MILESTONE 1 — After bullet 8 (Reading Parquet): Load & Inspect Large Files.**
> Load large CSV/JSON/Parquet files with PySpark and inspect schemas, counts, and samples.

9. Filtering.
10. Selecting.
11. Joins.
12. Aggregations.

> 🔨 **MILESTONE 2 — After bullet 12 (Aggregations): Build Customer Summaries at Scale.**
> Filter, join, and aggregate large transaction data into per-customer summaries.

13. Window functions in Spark.
14. Partitioning.
15. Data quality checks.
16. Missing values at scale.

> 🔨 **MILESTONE 3 — After bullet 16 (Missing values at scale): Clean Data at Scale.**
> Add data quality checks, missing-value handling, and deduplication to your Spark pipeline.

17. Feature engineering at scale.
18. ETL pipelines.
19. Batch processing.
20. Data lakes.
21. Data warehouses.
22. Parquet optimization.
23. Query optimization basics.
24. Feature stores basics.
25. Saving features for ML.

> 🔨 **MILESTONE 4 — After bullet 25 (Saving features for ML): Build Feature Output Pipeline.**
> Engineer customer/transaction features at scale and save the training dataset as optimized Parquet.

26. Cloud storage basics.
27. S3 and Spark integration.

---

### Practice Focus

You will process large transaction or telecom-style datasets.

Example:

```text
Raw transaction logs
→ Clean transactions
→ Customer features
→ Risk features
→ Training dataset
```

You will learn to answer:

```text
How do I process millions of rows without crashing?
How do I create features efficiently?
How do I prepare data for ML at scale?
```

---

### Section Project

## PySpark Feature Engineering Pipeline

Build a Big Data project that:

- Loads a large dataset.
- Cleans it with PySpark.
- Engineers customer features.
- Engineers transaction features.
- Creates a training dataset.
- Saves output as Parquet.
- Includes data quality checks.
- Is pushed to GitHub.
- Has a README and architecture diagram.

Example features:

```text
Total transaction amount last 7 days
Average transaction amount last 30 days
Number of failed transactions
Number of unique merchants
High-value transaction count
```

This section project combines Milestones 1–4.

---

### Exit Check

You can move to Section 8 when you can say:

```text
I can process large datasets and create ML features using PySpark.
```

---

# Section 8  
## Real-Time AI Systems

### Goal

Learn how AI systems respond immediately to live events.

This is important for:

- Fraud detection.
- M-PESA transaction scoring.
- Network alerts.
- Real-time customer support routing.

---

### Time Estimate

```text
60–90 hours
2.5–3.5 weeks at 25 hours/week
```

Target:

```text
3 weeks
```

---

### Bullet Points to Master (With Milestones)

1. Event-driven systems.
2. Streaming basics.
3. Kafka basics.
4. Producers.
5. Consumers.
6. Topics.
7. Partitions.
8. Offsets.
9. Message schemas.
10. JSON events.

> 🔨 **MILESTONE 1 — After bullet 10 (JSON events): Build Kafka Producer/Consumer.**
> Generate JSON transaction events, publish them to Kafka, and consume them.

11. Streaming features.
12. Real-time inference.
13. Low-latency APIs.
14. Caching.
15. Redis basics.
16. Feature store basics.

> 🔨 **MILESTONE 2 — After bullet 16 (Feature store basics): Build Streaming Feature Lookup.**
> Extract streaming features and serve fast feature lookups using Redis.

17. Timeout handling.
18. Retry logic.
19. Fallback logic.

> 🔨 **MILESTONE 3 — After bullet 19 (Fallback logic): Build Resilient Real-Time Scoring.**
> Add timeout, retry, and fallback logic so scoring never blocks transactions.

20. Monitoring streaming systems.
21. Alerting.
22. Latency measurement.
23. Throughput basics.
24. Backpressure basics.
25. Dockerized streaming services.

---

### Practice Focus

You will build systems that react to events.

Example:

```text
Transaction event
→ Kafka
→ Feature extraction
→ Fraud model API
→ Risk decision
```

---

### Section Project

## Real-Time Fraud Scoring System

Build a real-time project that:

- Generates transaction events.
- Sends events to Kafka.
- Processes events.
- Calls a fraud model API.
- Returns risk decision.
- Logs results.
- Has basic monitoring.
- Runs with Docker.
- Has README and architecture diagram.

Architecture:

```text
Transaction generator
→ Kafka
→ Stream processor
→ Feature lookup
→ Fraud model API
→ Risk decision
→ Logs/monitoring
```

This section project combines Milestones 1–3.

---

### Exit Check

You can move to Section 9 when you can say:

```text
I can build a basic real-time ML scoring system using streaming events and APIs.
```

---

# Section 9  
## Applied Generative AI

### Goal

Learn how to build safe enterprise GenAI systems.

This includes chatbots, document assistants, semantic search, and AI copilots.

But you must learn this as an engineer, not as someone who only knows prompts.

---

### Time Estimate

```text
60–90 hours
2.5–3.5 weeks at 25 hours/week
```

Target:

```text
3 weeks
```

---

### Bullet Points to Master (With Milestones)

1. LLM basics.
2. Prompt engineering.
3. System prompts.
4. Tokens.
5. Context windows.
6. Temperature.
7. Top-p.
8. Structured outputs.

> 🔨 **MILESTONE 1 — After bullet 8 (Structured outputs): Practice Prompt Engineering & Structured Outputs.**
> Write system prompts and force reliable structured JSON outputs from an LLM.

9. LLM APIs.
10. Open-source models.
11. Hugging Face basics.

> 🔨 **MILESTONE 2 — After bullet 11 (Hugging Face basics): Call LLM APIs & Open-Source Models.**
> Integrate an LLM API and load/run an open-source model locally or via Hugging Face.

12. Embeddings.
13. Semantic search.
14. Chunking.
15. Retrieval.

> 🔨 **MILESTONE 3 — After bullet 15 (Retrieval): Build Semantic Search Mini Project.**
> Chunk documents, create embeddings, and retrieve relevant chunks by meaning.

16. Vector databases.
17. FAISS.
18. ChromaDB.
19. Weaviate.
20. Pinecone.

> 🔨 **MILESTONE 4 — After bullet 20 (Pinecone): Store & Query a Vector Database.**
> Persist embeddings in one vector database (FAISS/ChromaDB/Weaviate/Pinecone) and query it.

21. Retrieval-Augmented Generation.
22. RAG evaluation.
23. Retrieval precision.
24. Answer relevance.
25. Citation accuracy.

> 🔨 **MILESTONE 5 — After bullet 25 (Citation accuracy): Build Evaluated RAG Pipeline.**
> Combine retrieval + LLM into RAG with evaluation of retrieval precision, answer relevance, and citation accuracy.

26. Guardrails.
27. Hallucination control.
28. Prompt injection.

> 🔨 **MILESTONE 6 — After bullet 28 (Prompt injection): Add Guardrails & Safety Layer.**
> Add guardrails, hallucination control, and prompt-injection protection to your RAG system.

29. Authentication.
30. Rate limiting.
31. Audit logs.
32. Cost control.
33. Caching.
34. LLM observability.

---

### Practice Focus

You will build systems such as:

```text
User asks question
→ System retrieves approved documents
→ LLM answers safely
→ Response includes citations
→ System logs audit trail
```

---

### Section Project

## Enterprise RAG Assistant

Build a secure document Q&A assistant that:

- Ingests documents.
- Chunks documents.
- Creates embeddings.
- Stores embeddings in a vector database.
- Retrieves relevant context.
- Sends context to an LLM.
- Returns safe answers.
- Includes citations.
- Includes guardrails.
- Includes rate limiting.
- Includes authentication.
- Includes audit logs.
- Has evaluation results.
- Has README and architecture diagram.

Architecture:

```text
Documents
→ Chunking
→ Embeddings
→ Vector database
→ Retrieval
→ Guardrails
→ LLM
→ Citations
→ Audit log
```

This section project combines Milestones 1–6.

---

### Exit Check

You can move to Section 10 when you can say:

```text
I can build a safe enterprise RAG system with retrieval, evaluation, guardrails, and auditability.
```

---

# Section 10  
## ML System Design + Security/Governance

### Goal

Learn how to design complete AI systems and defend your choices in interviews.

This is the section that helps you pass senior-style conversations, even as a mid-level candidate.

---

### Time Estimate

```text
70–100 hours
3–4 weeks at 25 hours/week
```

Target:

```text
3.5 weeks
```

---

## Part A: ML System Design

### Bullet Points to Master (With Milestones)

1. Business problem definition.
2. Data sources.
3. Target variable.
4. Label strategy.
5. Feature strategy.

> 🔨 **MILESTONE 1 — After bullet 5 (Feature strategy): Write a Problem Spec.**
> For one system, define the business problem, data sources, target variable, label strategy, and feature strategy in a written spec.

6. Batch vs streaming.
7. Model selection.
8. Evaluation metrics.
9. Offline evaluation.
10. Online evaluation.
11. A/B testing.
12. Shadow deployment.
13. Canary deployment.

> 🔨 **MILESTONE 2 — After bullet 13 (Canary deployment): Design a Deployment Strategy.**
> For a fraud system, design batch vs streaming choice, offline/online evaluation, A/B testing, shadow and canary rollout.

14. Model serving.
15. Latency requirements.
16. Throughput requirements.
17. Scaling strategy.
18. Caching.
19. Fallback logic.
20. Monitoring.
21. Drift detection.
22. Retraining strategy.
23. Data versioning.
24. Model registry.
25. Incident response.
26. Cost optimization.
27. Failure modes.
28. Tradeoffs.

> 🔨 **MILESTONE 3 — After bullet 28 (Tradeoffs): Write Full System Design Document #1.**
> Produce a complete design for a Real-Time M-PESA Fraud Detection System covering serving, latency, scaling, caching, fallback, monitoring, drift, retraining, incident response, cost, and tradeoffs.

---

### Systems You Must Practice Designing

- M-PESA fraud detection system.
- Loan default prediction system.
- Customer churn prediction system.
- Network outage prediction system.
- Customer support AI assistant.
- Document intelligence system.
- Recommendation engine.
- Real-time credit scoring system.

For each one, you must explain:

```text
Problem
Data
Features
Model
Metrics
Deployment
Monitoring
Security
Scaling
Fallback
Cost
```

---

## Part B: Security, Governance, and Compliance

### Bullet Points to Master (With Milestones)

1. Authentication.
2. Authorization.
3. Encryption.
4. Secrets management.
5. API security.
6. Rate limiting.
7. Audit logs.
8. Data minimization.
9. Access control.
10. PII handling.

> 🔨 **MILESTONE 4 — After bullet 10 (PII handling): Security Review of Your Own Projects.**
> Audit your previous projects for authentication, authorization, secrets, rate limiting, audit logs, and PII handling. Fix the gaps.

11. Model explainability.
12. Bias monitoring.
13. Fairness basics.
14. Data protection principles.
15. Kenya Data Protection Act awareness.
16. Financial data sensitivity.
17. Telecom data privacy.
18. Responsible AI.
19. Model risk management.
20. Human-in-the-loop systems.
21. Approval workflows.
22. Incident reporting.

---

### Section Project

## System Design Portfolio

Build a GitHub folder or documentation repository containing:

- 5 system design documents.
- Architecture diagrams.
- Data flow diagrams.
- Monitoring plans.
- Security plans.
- Scaling plans.
- Cost considerations.
- Failure fallback plans.
- Governance considerations.

Recommended designs:

```text
1. Real-Time M-PESA Fraud Detection System
2. Loan Default Prediction System
3. Customer Churn Prediction System
4. Enterprise RAG Support Assistant
5. Network Anomaly Detection System
```

This section project combines Milestones 1–4.

---

### Exit Check

You are done when you can say:

```text
I can design, secure, scale, monitor, and explain an AI system for a Safaricom-style business problem.
```

---

# Final Portfolio Strategy

You will build many section projects, but your final public portfolio should highlight the best three.

These three should be serious, production-style systems.

---

## Final Portfolio Project 1  
## Batch ML Prediction System

Best if built from:

- SQL.
- ML fundamentals.
- Production ML.
- MLOps.
- Big Data.

Example:

```text
Historical data
→ PySpark feature pipeline
→ Model training
→ MLflow tracking
→ Airflow automation
→ Model API
→ Drift monitoring
```

Recommended use case:

```text
Loan default prediction
```

or

```text
Customer churn prediction
```

---

## Final Portfolio Project 2  
## Real-Time Fraud Detection System

Best if built from:

- Production ML.
- Real-Time AI.
- Cloud.
- Monitoring.
- Security.

Example:

```text
Transaction generator
→ Kafka
→ Stream processor
→ Feature engineering
→ Fraud model API
→ Risk decision
→ Monitoring dashboard
```

This is highly relevant to Safaricom and M-PESA.

---

## Final Portfolio Project 3  
## Enterprise RAG Assistant

Best if built from:

- Applied GenAI.
- Software engineering.
- Security.
- APIs.
- Governance.

Example:

```text
Documents
→ Chunking
→ Embeddings
→ Vector database
→ Retrieval
→ Guardrails
→ LLM
→ Citations
→ Audit log
```

This proves you can build modern GenAI systems responsibly.

---

# Required Technical Stack

These are the tools you should focus on.

## Must-Have Core Tools

- Python.
- SQL.
- Git.
- Docker.
- FastAPI.
- Pandas.
- Scikit-learn.
- XGBoost or LightGBM.
- MLflow.
- Airflow.
- PySpark.
- Kafka.
- AWS basics.
- Kubernetes basics.
- Prometheus/Grafana basics.

---

## Important AI Tools

- PyTorch.
- TensorFlow.
- Hugging Face.
- OpenAI API or equivalent LLM API.
- ChromaDB, FAISS, Weaviate, or Pinecone.
- LangChain or LlamaIndex, but understand the internals.

---

## Nice-to-Have Tools

Do not chase these first.

- Snowflake.
- BigQuery.
- Redshift.
- Redis.
- Neo4j.
- Kubeflow.
- SageMaker.
- Databricks.
- Triton Inference Server.
- ONNX.

Master the core tools first.

---

# Required Interview Skills

You will prepare for four interview areas.

---

## 1. Python Coding

You must be able to solve medium-level coding problems.

We will not use random LeetCode blindly.

We will practice tailored problems that build the same patterns.

Focus on:

- Arrays.
- Hash maps.
- Sets.
- Sorting.
- Sliding window.
- Two pointers.
- Binary search.
- Heaps.
- Basic graphs.
- Complexity analysis.

---

## 2. SQL

You must be able to solve advanced SQL problems.

Focus on:

- Joins.
- Window functions.
- CTEs.
- Aggregations.
- Deduplication.
- Time-based features.
- Retention.
- Funnels.
- Fraud-style transaction queries.
- Customer repayment queries.

---

## 3. ML System Design

You must be able to design complete systems.

Practice prompts:

- Design a real-time M-PESA fraud detection system.
- Design a credit scoring system for a mobile loan product.
- Design a customer churn prediction system.
- Design a network outage prediction system.
- Design an AI customer support assistant.
- Design a document intelligence system.
- Design a recommendation engine.

For each one, explain:

```text
Data
Features
Model
Metrics
Deployment
Monitoring
Scaling
Security
Fallback
Cost
```

---

## 4. Behavioral Interview

You must be able to explain:

- A difficult technical problem you solved.
- A production issue you fixed.
- A time you disagreed with someone.
- A time you improved performance.
- A time you explained technical work to non-technical people.
- A time you made a tradeoff.

Use:

```text
Situation
Task
Action
Result
```

---

# Definition of Done

You are ready when you can do all of the following.

---

## Technical

- Build production Python code.
- Write advanced SQL.
- Train and evaluate ML models.
- Deploy models with FastAPI.
- Containerize with Docker.
- Orchestrate pipelines with Airflow.
- Track experiments with MLflow.
- Process large data with PySpark.
- Handle streaming data with Kafka.
- Monitor models for drift and latency.
- Build a basic RAG system.
- Explain how to scale the system.

---

## Portfolio

- Serious GitHub projects.
- Clean README files.
- Architecture diagrams.
- Tests.
- Docker setup.
- Clear metrics.
- Clear scaling explanations.

---

## Interview

- Pass Python coding tests.
- Pass SQL tests.
- Explain ML system design clearly.
- Explain business impact.
- Communicate confidently.
- Show engineering discipline.

When you can do those things, you are ready to apply seriously.

---

# What You Must Ignore

Do not waste time on these unless you already master the core:

- Training large language models from scratch.
- Fancy research papers.
- Too many frameworks.
- Too many cloud certifications.
- Prompt engineering only.
- Kaggle-only projects.
- Notebook-only models.
- Copy-paste AI projects with no architecture.
- Learning ten tools shallowly.

Depth beats breadth.

---

# Your Single Success Formula

This is the entire formula:

```text
Production Python
+ Strong SQL
+ ML fundamentals
+ Big Data basics
+ Real-time systems
+ Docker/Kubernetes basics
+ MLOps monitoring
+ Safe GenAI/RAG
+ System design
+ Public proof projects
+ Interview practice
```

That is the job.

---

# Final Rule

Do not chase two descriptions.

Do not chase three descriptions.

Follow this one.

Your target is not:

> “Become someone who knows AI.”

Your target is:

> “Become someone who can deploy AI systems that survive real users, real data, real traffic, real risk, and real business pressure.”

If you become that, you are not only competitive for Safaricom.

You become competitive for serious AI/ML engineering roles anywhere.

---

# Next Step

If you accept this plan, reply with:

```text
Start Section 1
```

Then I will give you:

```text
Section 1
Bullet point 1
Explanation
Practice problems
Exit check
```