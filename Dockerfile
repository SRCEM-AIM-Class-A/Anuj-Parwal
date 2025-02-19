FROM python:3-alpine3.15

WORKDIR /app

# Copy only requirements first to leverage Docker caching
COPY requirements.txt .

# Install dependencies and required system packages
RUN apk add --no-cache gcc musl-dev python3-dev && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

EXPOSE 3000

CMD ["python", "app.py"]
