# MongoDB Configuration

This directory contains configuration and data for the MongoDB database service.

## 🚀 Overview

- **Image**: `mongo:7.0`
- **Container Name**: `jslab-mongodb`
- **Default Port**: `27017`

## ⚙️ Configuration

### 1. Root Credentials

The database root credentials are managed through environment variables in your root `.env` file:

- `MONGO_ROOT_USERNAME`: Root username for initial database setup.
- `MONGO_ROOT_PASSWORD`: Root password for initial database setup.

By default, these are set to:
```bash
MONGO_ROOT_USERNAME=root
MONGO_ROOT_PASSWORD=root
```

### 2. Networking and Ports

The MongoDB service is accessible:
- **Inside the Docker network**: Using the hostname `mongodb` (or `jslab-mongodb`) on port `27017`.
- **From the host machine**: On the port specified by `MONGO_PORT` in your `.env` (default is `27017`).

### 3. Persistent Data

All MongoDB data is persistently stored in the `mongodb/data/` directory. This directory is mounted to `/data/db` inside the container, ensuring that your data survives container restarts or rebuilds.

## 🛠 Usage Examples

### Connecting to MongoDB from another service

If you are connecting from the Node.js service, use a connection string like this:

```javascript
const mongoUrl = "mongodb://root:root@mongodb:27017/?authSource=admin";
```

### Using a tool like MongoDB Compass or Studio 3T

Connect to:
- **Host**: `localhost`
- **Port**: `27017` (or your configured `MONGO_PORT`)
- **Authentication**: Using the credentials defined in your `.env`.
