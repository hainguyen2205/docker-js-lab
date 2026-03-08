# Node.js Service Configuration

This directory contains the Docker configuration for the Node.js development environment.

## 🚀 Overview

The Node.js service is built using a custom `Dockerfile` based on `node:24.14.0-alpine`. It's designed to provide a lightweight, modern development workspace that can easily connect with other services like MongoDB and Redis.

## 🛠 Features

- **Base Image**: `node:24.14.0-alpine` (latest stable release at the time of creation).
- **Installed Tools**: `bash`, `git`, and `curl` for basic management.
- **Support for Multi-Version Node.js**: Includes commented-out configuration to support multiple Node.js versions via [NVM](https://github.com/nvm-sh/nvm). You can uncomment these lines in the `Dockerfile` to enable version switching.
- **Shared Workspace**: Mounts a local directory as `/workspace` inside the container, allowing you to edit files on your host machine while they run in the container.

## ⚙️ Configuration

### 1. Environment Variables

The Node.js service uses the following variables (defined in your root `.env`):

- `WORKSPACE_PATH`: The absolute path on your host machine to your project workspace. This is mounted to `/workspace` in the container.
- `NODE_PORT`: The host port exposed for your application (default is `3000`).
- `VITE_PORT`: The host port for the Vite development server (default is `5173`).

### 2. Accessing the Shell

To enter the Node container's shell, use the following command from the project root:

```bash
make shell
```

This will open a `bash` shell inside the `/workspace` directory.

### 3. Installing Dependencies

Inside the shell, you can use `npm`, `yarn`, or `pnpm` to manage your project's dependencies:

```bash
cd /workspace/your-project
npm install
npm run dev
```

## ⚠️ Notes

- The container's startup command is set to `tail -f /dev/null`, which keeps it running in the background indefinitely. You'll need to manually start your applications inside the shell.
- Port mapping ensures that services running inside the container (like those on ports `3000` or `5173`) are accessible from your host machine.
