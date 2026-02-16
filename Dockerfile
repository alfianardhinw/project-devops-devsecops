FROM python:3.11-alpine

# Create user
RUN addgroup -S app && adduser -S app -G app

# Install required packages (Alpine style)
RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

USER app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

