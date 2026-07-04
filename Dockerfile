FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ project
COPY . .

# Tạo thư mục rag_storage (persistent volume sẽ mount vào đây)
RUN mkdir -p /app/rag_storage

# Port mặc định của LightRAG
EXPOSE 9621

# Start LightRAG server
CMD ["lightrag-server", "--host", "0.0.0.0", "--port", "9621"]
