# ELT Pipeline using Snowflake, DBT & Airflow

This project demonstrates how to build a modern ELT (Extract, Load, Transform) data pipeline using **Snowflake** for data warehousing, **DBT (Data Build Tool)** for transformation, and **Apache Airflow** for orchestration.

---

## 🚀 Tools Used

* **Snowflake** – Data warehousing platform.
* **DBT** – SQL-based transformation tool that performs the "T" in ELT.
* **Airflow** – Workflow orchestration tool.

---

## 📊 Dataset

We use the **[TPC-H benchmark dataset](https://docs.snowflake.com/en/user-guide/sample-data-tpch)** for this project.

---

## 🧑‍💻 Development Setup (Windows)

### 1. Python & Virtual Environment

```bash
python -m venv de_venv
de_venv\Scripts\activate.bat
```

### 2. Install DBT & Snowflake Adapter

```bash
pip install dbt-core
pip install dbt-snowflake
```

---

## ❄️ Snowflake Setup

* Create a **warehouse**, **database**, **schema**, **role**, and assign the role to a **superuser**.
* Set these values during `dbt init`.

---

## ⚙️ Initialize DBT Project

```bash
dbt init
```

* Choose `snowflake` as the adapter.
* Set your role, warehouse, database, schema, etc.
* Set threads (e.g., 10).

### Project Structure

* `models/`: Contains transformation SQL files.

  * `staging/`: Staging models.
  * `marts/`: Aggregated tables or fact tables.
* `seeds/`: Static CSV data.
* `dbt_packages/`: 3rd-party DBT libraries.
* `packages.yml`: Include packages like `dbt_utils`.

### Install Dependencies

```bash
dbt deps
```

---

## 📈 Transformations

### Staging Models

```bash
dbt run -s stg_tpch_line_items
```

### Fact Models

* Example: `init_order_items.sql`

```bash
dbt run -s init_order_items
```

* Add macros like `pricing.sql` for reusable logic.
* Final run:

```bash
dbt run
```

---

## ✅ Testing

Two types of DBT tests:

1. **Singular Tests** – Custom SQL to identify failing rows.
2. **Generic Tests** – Use built-in or custom YAML-based tests.

Example: `fact_orders_date_valid` – Checks for invalid order dates.

---

## 🔁 Orchestration with Airflow (via Astro CLI)

### 1. Install & Configure Astro CLI (Windows)

* Download Astro CLI executable.
* Rename to `astro.exe` and add to system PATH.

```bash
mkdir dbt-dag
cd dbt-dag
astro dev init
```

### 2. Update Dockerfile

```Dockerfile
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake && deactivate
```

### 3. Add Dependencies

Update `requirements.txt` accordingly.

### 4. Start Airflow with Docker

```bash
astro dev start
```


### 5. Integrate DBT with Airflow

* Create `dags/dbt/` directory.
* Copy your `data-pipeline` into `dags/dbt/`.

### 6. Configure Snowflake Connection

* Connection ID: `snowflake_conn`
* Hostname format:

  ```
  https://<account_locator>.<region>.<cloud>.snowflakecomputing.com
  ```

---

## 🐛 Debugging

```bash
dbt debug
```

---

## 📌 Conclusion

We have successfully built and orchestrated an end-to-end ELT pipeline using Snowflake, DBT, and Airflow. The project covers transformations, testing, and scheduling workflows using Astro CLI.

Thanks for reading this document! 😊
