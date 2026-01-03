# 🗂️ 1️⃣ Create the project folder

Open PowerShell:

```bash
mkdir f1
cd f1
```

Create subfolders:

```bash
mkdir dags, logs, plugins, postgres
```

Your structure:

```
f1/
├── dags/
├── logs/
├── plugins/
├── postgres/
└── docker-compose.yml
```

---

# 🐳 2️⃣ Create `docker-compose.yml`

Inside `f1/`, create `docker-compose.yml` and paste:

```yaml
version: "3.8"

services:
  postgres:
    image: postgres:15
    container_name: f1_postgres
    environment:
      POSTGRES_USER: airflow
      POSTGRES_PASSWORD: airflow
      POSTGRES_DB: postgres
    volumes:
      - ./postgres:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    restart: always

  airflow:
    image: apache/airflow:2.8.1
    container_name: f1_airflow
    depends_on:
      - postgres
    environment:
      AIRFLOW__CORE__EXECUTOR: LocalExecutor
      AIRFLOW__DATABASE__SQL_ALCHEMY_CONN: postgresql+psycopg2://airflow:airflow@postgres/postgres
      AIRFLOW__CORE__LOAD_EXAMPLES: "false"
    volumes:
      - ./dags:/opt/airflow/dags
      - ./logs:/opt/airflow/logs
      - ./plugins:/opt/airflow/plugins
    ports:
      - "8080:8080"
    command: >
      bash -c "
      airflow db init &&
      airflow users create
        --username admin
        --password admin
        --firstname admin
        --lastname admin
        --role Admin
        --email admin@example.com &&
      airflow webserver & airflow scheduler
      "
```

---

# ▶️ 3️⃣ Start the system

From inside the `f1` folder:

```bash
docker compose up -d
```

Check:

```bash
docker ps
```

You should see:

```
f1_postgres
f1_airflow
```

---

# 🔌 4️⃣ Connect DBeaver

Create PostgreSQL connection:

| Field    | Value     |
| -------- | --------- |
| Host     | localhost |
| Port     | 5432      |
| Database | postgres  |
| User     | airflow   |
| Password | airflow   |

Test → OK.

---

# 🏗️ 5️⃣ Create your two F1 service databases

In DBeaver SQL Editor:

```sql
CREATE DATABASE f1_race_operations;
CREATE DATABASE f1_participant_reference;
```

Refresh → you will see both.

---

Now your **F1 platform** is officially running inside Docker 🏎️
DBeaver is connected, and you’re ready to import Kaggle data.

