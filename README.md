# Sendly — Docker Setup

Môi trường Docker cho dự án **Sendly**. Hiện tại chỉ chạy **MongoDB 8.2**; nginx và redis đã được chuẩn bị sẵn nhưng đang comment trong `docker-compose.yml` (bật lại khi cần).

## 🧩 Services

| Service | Image            | Container        | Port    | Trạng thái           |
| ------- | ---------------- | ---------------- | ------- | -------------------- |
| MongoDB | `mongo:8.2`      | `sendly-mongodb` | 27017   | ✅ Đang bật          |
| Nginx   | `nginx:1.28`     | `sendly-nginx`   | 80, 443 | 💤 Comment (dùng sau) |
| Redis   | `redis:7.4`      | `sendly-redis`   | 6379    | 💤 Comment (dùng sau) |

> Để bật nginx/redis: bỏ comment service tương ứng trong `docker-compose.yml` và các biến `NGINX_*` / `REDIS_*` trong `.env`.

## 🚀 Bắt đầu

1. Tạo file `.env` từ mẫu:

   ```bash
   cp .env.example .env
   ```

2. Khởi động MongoDB:

   ```bash
   make up
   # hoặc: docker compose up -d
   ```

3. Kiểm tra trạng thái:

   ```bash
   make ps
   ```

## 🔌 Kết nối

- **Host**: `localhost`
- **Port**: `27017` (hoặc `MONGO_PORT` trong `.env`)
- **Connection string**:

  ```
  mongodb://root:root@localhost:27017/?authSource=admin
  ```

## 🛠 Các lệnh Make

| Lệnh           | Mô tả                                 |
| -------------- | ------------------------------------- |
| `make up`      | Khởi động service (chạy nền)          |
| `make down`    | Dừng và xóa container                 |
| `make stop`    | Dừng service                          |
| `make restart` | Khởi động lại service                 |
| `make logs`    | Xem logs                              |
| `make ps`      | Xem trạng thái container              |
| `make shell`   | Mở `mongosh` bên trong container      |

## 💾 Dữ liệu

Dữ liệu MongoDB được lưu bền tại `mongodb/data/` (mount vào `/data/db`), tồn tại qua các lần restart/rebuild. Thư mục này đã được `.gitignore`.
