FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -fr /var/lib/apt/list/*

COPY . .

RUN pip install .

COPY src/sentinel2_superresolution/run.py /app

ENTRYPOINT ["python", "/app/run.py"]
