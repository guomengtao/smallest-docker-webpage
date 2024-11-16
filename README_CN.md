# Caddy Docker 代理设置

基于 Docker 的反向代理设置，使用 Caddy 实现自动 HTTPS。

## 特性

- 使用 Let's Encrypt 自动配置 HTTPS
- Docker 集成
- Cloudflare DNS 支持
- 多域名处理

## 前置要求

- Docker 和 Docker Compose
- 域名（需要将 DNS 指向您的服务器）
- Cloudflare API 令牌（如果使用 Cloudflare DNS）

## 设置步骤

1. 创建网络：