# Dockerfile
FROM ubuntu:16.04

# Running as root (security issue)
USER root

# Hardcoded secrets in ENV
ENV DATABASE_PASSWORD="admin123"
ENV API_SECRET_KEY="sk-1234567890abcdefghijklmnop"
ENV JWT_SECRET="my-super-secret-jwt-key"

# Install packages without version pinning
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo

# Copy with overly broad permissions
COPY . /app
RUN chmod 777 /app
RUN chmod 777 /app/*

# Expose risky ports
EXPOSE 22
EXPOSE 3306
EXPOSE 5432

# Add user with weak password
RUN useradd -m -p $(openssl passwd -1 password123) testuser

# Download and execute script (risky)
RUN curl -sSL https://get.docker.com/ | sh

WORKDIR /app
CMD ["python", "app.py"]
