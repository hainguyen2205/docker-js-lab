# MongoDB Configuration

Cấu hình và dữ liệu cho MongoDB service của dự án Sendly.

## 🚀 Overview

- **Image**: `mongo:8.2`
- **Container Name**: `sendly-mongodb`
- **Default Port**: `27017`

## ⚙️ Configuration

### 1. Root Credentials

Credentials root được quản lý qua biến môi trường trong file `.env` ở thư mục gốc:

- `MONGO_ROOT_USERNAME`: Username root.
- `MONGO_ROOT_PASSWORD`: Password root.

Mặc định:

```bash
MONGO_ROOT_USERNAME=root
MONGO_ROOT_PASSWORD=root
```

### 2. Networking và Ports

MongoDB service có thể truy cập:

- **Trong Docker network**: qua hostname `mongodb` (hoặc `sendly-mongodb`) ở port `27017`.
- **Từ máy host**: qua port cấu hình bởi `MONGO_PORT` trong `.env` (mặc định `27017`).

### 3. Persistent Data

Toàn bộ dữ liệu được lưu bền tại `mongodb/data/`, mount vào `/data/db` trong container, đảm bảo dữ liệu tồn tại qua các lần restart/rebuild.

## 🛠 Usage Examples

### Kết nối từ ứng dụng Node.js (trong cùng Docker network)

```javascript
const mongoUrl = "mongodb://root:root@mongodb:27017/?authSource=admin";
```

### Kết nối từ host (MongoDB Compass / Studio 3T)

- **Host**: `localhost`
- **Port**: `27017` (hoặc `MONGO_PORT`)
- **Authentication**: dùng credentials trong `.env`.
