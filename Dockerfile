# Base Airflow image (matches Airflow 2.x CLI: supports `airflow users create`)
FROM apache/airflow:2.7.3-python3.10

USER airflow

ARG AIRFLOW_VERSION=2.7.3
ARG PYTHON_VERSION=3.10
ARG AIRFLOW_CONSTRAINTS_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

# Install dependencies under Airflow constraints
RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
 && pip install --no-cache-dir --constraint "${AIRFLOW_CONSTRAINTS_URL}" \
      numpy \
      pandas \
      scipy \
      statsmodels \
      yfinance \
      openpyxl \
      xlsxwriter \
      Flask-Session \
      "flask_oauthlib>=0.9"
