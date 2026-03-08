# Nginx Configuration

This directory contains the configuration files for the Nginx web server.

## 📁 Directory Structure

- `certs/`: Put your SSL certificates here (e.g., `example.crt` and `example.key`).
- `conf.d/*.conf`: General Nginx configuration snippets loaded into the `http` block. This includes `default.conf`, which handles the default server block.
- `sites/`: Place your specific site configuration files here (e.g., `my-app.conf`).
- `snippets/`: Useful configuration snippets (e.g., `proxy.conf`) that you can include in your site configuration files using `include snippets/proxy.conf;`.
- `nginx.conf`: The main Nginx configuration file.

## 🛠 Configuration Guide

### 1. Adding a New Site

To add a new site, create a file named `<your-site-name>.conf` in the `sites/` directory:

```nginx
server {
    listen 80;
    server_name my-app.local;

    location / {
        proxy_pass http://js-lab-node:3000;
        include snippets/proxy.conf;
    }
}
```

Then, you can reload Nginx to apply the changes:

```bash
make nginx-reload
```

### 2. SSL Support

Place your certificate and key files into the `certs/` directory and configure your server block to use them:

```nginx
server {
    listen 443 ssl;
    server_name my-app.local;

    ssl_certificate /etc/nginx/certs/example.crt;
    ssl_certificate_key /etc/nginx/certs/example.key;

    location / {
        proxy_pass http://js-lab-node:3000;
        include snippets/proxy.conf;
    }
}
```

### 3. Using Proxy Snippets

 The `snippets/proxy.conf` file provides a standard set of proxy headers and settings, including support for WebSockets (useful for Vite development server with HMR). Include it in your location blocks like this:

```nginx
location / {
    proxy_pass http://js-lab-node:3000;
    include snippets/proxy.conf;
}
```
