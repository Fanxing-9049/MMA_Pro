FROM python:3.9-slim
ENV TZ=Asia/Shanghai
ENV MMA_PRO_PORT=8500
ENV MMA_PRO_HOST=0.0.0.0
RUN apt-get update && apt-get install -y curl bash ca-certificates tzdata && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app/
RUN chmod +x /app/start.sh /app/mma_pro_linux_* 2>/dev/null || true
RUN mkdir -p /app/data/{success,failed,records}
EXPOSE 8500
CMD ["/app/start.sh"]
