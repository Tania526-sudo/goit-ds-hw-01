FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# 1) pip + poetry
RUN python -m pip install --upgrade pip \
 && pip install --no-cache-dir "poetry~=1.8.3"


COPY pyproject.toml poetry.lock* ./
RUN poetry config virtualenvs.create false \
 && poetry install --only main --no-interaction --no-ansi --no-root


COPY src ./src
COPY main.py .
COPY README.md .

RUN poetry install --only main --no-interaction --no-ansi

ENTRYPOINT ["personal-assistant"]



