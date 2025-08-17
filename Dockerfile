# Dockerfile
FROM ubuntu:18.04

# Running as root (security issue)
USER root

# Hardcoded secrets
ENV API_KEY="sk-1234567890abcdef"
ENV DB_PASSWORD="admin123"

# Vulnerable package versions
RUN apt-get update && apt-get install -y \
    curl=7.58.0-2ubuntu3.8 \
    openssl=1.1.1-1ubuntu2.1~18.04.5

# Copying with broad permissions
COPY . /app
RUN chmod 777 /app

# Exposing unnecessary ports
EXPOSE 22 3306 5432

WORKDIR /app
CMD ["python", "app.py"]
