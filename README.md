# Sendly — Docker Setup

Môi trường Docker cho dự án **Sendly**. Hiện tại chỉ bao gồm **MongoDB 8**.

## 🧩 Services

| Service | Image       | Container        | Port  |
| ------- | ----------- | ---------------- | ----- |
| MongoDB | `mongo:8.0` | `sendly-mongodb` | 27017 |

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
