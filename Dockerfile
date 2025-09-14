# Base image with pinned Python
FROM python:3.11-slim

# Prevent Python from writing .pyc and buffering stdout
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Workdir inside the container
WORKDIR /app

# Copy only what's needed first (faster rebuilds)
COPY README.md pyproject.toml ./
COPY src ./src
COPY main.py ./

# If you keep requirements.txt, uncomment:
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# For this HW we have no runtime deps; but if you want dev tools:
# RUN pip install --no-cache-dir pytest

# Persist data file between runs (optional, convenient)
VOLUME ["/app/src/goit_pycore_hw_08/data"]

# Default command runs the CLI
CMD ["python", "main.py"]
