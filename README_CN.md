# 最小Docker网页项目

## 前置条件

1. 全局Traefik设置（如果尚未运行）：
   ```bash
   # 仅需执行一次，用于所有项目
   mkdir ~/traefik-proxy && cd ~/traefik-proxy
   docker network create traefik_public
   touch acme.json && chmod 600 acme.json
   # 启动全局Traefik
   docker-compose -f traefik-compose.yml up -d
   ```

## 快速开始

1. 克隆仓库
2. 配置 `.env` 文件：
   ```bash
   DOCKER_PROJECT_NAME=$(basename $(pwd))
   DOMAIN=your-new-domain.com
   EMAIL=your-email@example.com
   ```
3. 启动Web应用：
   ```bash
   docker-compose up -d
   ```

## 重要说明

### SSL证书
- 本项目使用共享的Traefik实例管理SSL证书
- 添加新项目时无需重启Traefik
- 每个项目都会自动获取SSL证书（如果配置正确）
- 所有证书都存储在全局的`acme.json`文件中

### 必需配置
您的docker-compose.yml必须包含以下标签才能自动获取SSL：
```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.${DOCKER_PROJECT_NAME}.rule=Host(`${DOMAIN}`)"
  - "traefik.http.routers.${DOCKER_PROJECT_NAME}.tls=true"
  - "traefik.http.services.${DOCKER_PROJECT_NAME}.loadbalancer.server.port=80"
```

## SSL证书验证

部署后，您可以通过以下方式验证SSL证书：

1. 使用curl检查证书：
   ```bash
   curl -vI https://${DOMAIN}
   ```

2. 在浏览器中查看证书详情：
   - 点击浏览器地址栏的锁形图标
   - 查看证书详情
   - 确认证书是由Let's Encrypt颁发

3. 检查证书状态：
   - 访问 https://crt.sh/ 搜索您的域名
   - 或使用Google证书检查工具：
     https://transparencyreport.google.com/https/certificates

注意：SSL证书生成可能需要几分钟时间。