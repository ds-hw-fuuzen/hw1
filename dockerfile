FROM python:3.10.5 AS builder

COPY requirements.txt .

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libffi-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && python -m pip install --no-cache-dir --upgrade pip==24.0.0 \
    && pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.10.5-slim

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

WORKDIR /app

RUN apt-get update && \
    apt-get install -y fish git && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's|/bin/bash|/usr/bin/fish|g' /etc/passwd

EXPOSE 8000

CMD ["tail", "-f", "/dev/null"]
