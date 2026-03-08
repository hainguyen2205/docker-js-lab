# Docker JS Lab

A powerful and flexible Docker-based development environment designed for JavaScript and Node.js projects. This setup provides a complete stack including a web server (Nginx), a Node.js runtime, a NoSQL database (MongoDB), and an in-memory data store (Redis).

## 🚀 Features

- **Nginx**: Ready-to-go reverse proxy and web server.
- **Node.js**: Modern Node.js runtime (v24.14.0) with support for multi-versioning (via NVM).
- **MongoDB**: Robust NoSQL database (v7.0).
- **Redis**: High-performance key-value store (v7.2).
- **Makefile**: Easy-to-use commands for environment management.

## 🛠 Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Make](https://www.gnu.org/software/make/) (Optional, but recommended)

## 📦 Project Structure

```text
.
├── mongodb/          # MongoDB configuration and data
├── nginx/            # Nginx configuration (sites, certs, etc.)
├── node/             # Node.js Dockerfile and configuration
├── redis/            # Redis configuration and data
├── .env              # Environment variables
├── docker-compose.yml # Docker Compose orchestration
└── Makefile          # Command shortcuts
```

## 🚦 Getting Started

### 1. Configure Environment

Copy the `.env.example` file (ensure it's updated with necessary variables) to `.env` and adjust the variables to your needs:

```bash
WORKSPACE_PATH=/path/to/your/workspace
NGINX_HTTP_PORT=80
NGINX_HTTPS_PORT=443
NODE_PORT=3000
VITE_PORT=5173
MONGO_PORT=27017
REDIS_PORT=6379
```

### 2. Launch Environment

Use the `Makefile` to quickly start the project:

```bash
make up
```

This will build and start all services in the background.

## ⌨️ Command Shortcuts (Makefile)

| Command | Description |
| :--- | :--- |
| `make up` | Start all services in the background. |
| `make down` | Stop and remove all containers. |
| `make stop` | Stop services without removing them. |
| `make restart` | Restart all services. |
| `make build` | Build services. |
| `make rebuild` | Build and start services. |
| `make logs` | Tail logs of all containers. |
| `make ps` | Show status of running containers. |
| `make shell` | Open a bash shell inside the Node container. |
| `make nginx-reload` | Reload Nginx configuration without restarting. |

## 📁 Service-Specific Documentation

For more detailed information on configuring each service, please refer to their respective documentation:

- [Nginx Configuration Guide](./nginx/README.md)
- [Node Service Guide](./node/README.md)
- [MongoDB Configuration Guide](./mongodb/README.md)
- [Redis Configuration Guide](./redis/README.md)

## 📄 License

This project is open-source. Feel free to modify and use it for your own development labs.
