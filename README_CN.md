# Caddy Docker 代理设置

基于 Docker 的反向代理设置，使用 Caddy 实现自动 HTTPS。

## 特性

- 使用 Let's Encrypt 自动配置 HTTPS
- Docker 集成
- 基于目录名的项目名称
- 自动域名配置（project-name.1panel.rinuo.com）

## 前置要求

- Docker 和 Docker Compose
- 域名（需要将 DNS 指向您的服务器）

## 快速开始

1. 克隆并进入仓库：