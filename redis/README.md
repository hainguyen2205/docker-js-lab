# Redis Configuration

This directory contains configuration and data for the Redis in-memory data store.

## 🚀 Overview

- **Image**: `redis:7.2-alpine` (standard lightweight Alpine build).
- **Container Name**: `jslab-redis`
- **Default Port**: `6379`

## ⚙️ Configuration

### 1. Persistence

The Redis service is configured with AOF (Append Only File) persistence for better data reliability. This is enabled via the command:
```bash
redis-server --appendonly yes
```

### 2. Networking and Ports

The Redis service is accessible:
- **Inside the Docker network**: Using the hostname `redis` (or `jslab-redis`) on port `6379`.
- **From the host machine**: On the port specified by `REDIS_PORT` in your `.env` (default is `6379`).

### 3. Persistent Data

All Redis data (including `appendonly.aof` and other snapshots) is persistently stored in the `redis/data/` directory on your host machine. This directory is mounted to `/data` inside the container.

## 🛠 Usage Examples

### Connecting to Redis from another service

If you are connecting from the Node.js service, use a setup like this:

```javascript
const redis = require("redis");
const client = redis.createClient({
  url: "redis://redis:6379"
});
```

### Testing Redis Connection

You can use the `redis-cli` from inside the redis container to test the service:

```bash
docker exec -it jslab-redis redis-cli ping
# Expected output: PONG
```
