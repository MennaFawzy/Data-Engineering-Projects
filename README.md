
---

## ⚡ Architecture Overview

### 1. Batch Layer

* **Source**: CSV datasets from kaggle loaded into PostgreSQL
* **Ingestion**: NiFi reads data from PostgreSQL and writes it to S3
* **Storage & Modeling**: Snowflake points to the S3 data for batch layer, and **dbt** manages transformations, modeling, and lineage tracking
* **Visualization**: Power BI dashboards through snowflake connection.

### 2. Streaming Layer

* **Source**: PostgreSQL CDC captured using Debezium by mimicing the transactional data into the postgres
* **Pipeline**:

  1. Debezium publishes CDC events to **Kafka raw topic (olist.order_payments)**
  2. Raw Kafka events optionally persisted to **S3** for auditing
  3. **Flink** processes raw Kafka topics, performs transformations, and outputs to **Kafka transformed topics (olist_payments_aggregated_windowed) and (olist_payments_installments_windowed)**
  4. Transformed data stored in **Cassandra** for real-time queries
  5. **Grafana** dashboards provide real-time monitoring and metrics visualization

---

## 🏗️ Project Architecture

![Project](<Images/Project Pipeline.svg>)

---



## 📊 Data Modeling & Lineage

* **dbt** manages:

  * Bronze (raw) → Silver (Staging) → Gold (Dims, Facts and Marts)
  * Lineage tracking
  * Fact and dimension models

![dbt lineage](<Images/Old Model Lineage.png>)


![Model Diagram](<Images/Old Dimension Model.jpeg>)


![Last Model Diagram](<Images/Last Dimension Model .svg>)

---

## 🔄 Data Flows

### NiFi Flow (Batch ingestion pipeline)

![Nifi Flow](<Images/NiFi Flow.jpeg>)


### S3 Storage Structure

* **Batch**: 
![S3 Batch](<Images/S3 Batch.jpeg>)

* **Stream**: 
![S3 Stream](<Images/s3 stream.png>)

---



## 📈 Dashboards

### Power BI

![BI Dashboard 1](<Images/BI 1.jpeg>)


![BI Dashboard 2](<Images/BI 2.jpeg>)

### Grafana

![Grafana Dashboard](Images/Grafana.png)

---


## ⚙ Technologies Used

| Layer                   | Tool/Technology                                       |
| ----------------------- | ----------------------------------------------------- |
| Data Ingestion          | NiFi, Debezium                                        |
| Messaging & Streaming   | Kafka, Flink                                          |
| Batch Storage           | PostgreSQL, S3, Snowflake                             |
| Data Modeling & Lineage | dbt                                                   |
| Real-time Storage       | Cassandra                                             |
| Visualization           | Power BI (BI dashboards), Grafana (real-time metrics) |
| Containerization        | Docker                                                |

---
