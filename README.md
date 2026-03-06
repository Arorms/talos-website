# Talos 服务器介绍网站

这是一个展示 Talos 服务器信息的静态网站，使用 Tailwind CSS 构建。

## 功能特点

- ✅ 响应式设计，适配各种设备
- ✅ 使用 Tailwind CSS 进行样式设计
- ✅ 展示服务器硬件规格和运行服务
- ✅ 包含联系信息和技术栈展示
- ✅ 自动部署到 Nginx 服务器

## 网站内容

### 1. 关于 Talos
- 服务器介绍和命名来源
- 服务器特色功能
- 运行时间和时区信息

### 2. 技术规格
- 硬件配置（操作系统、架构、Shell等）
- 网络服务（Nginx、端口配置、数据库）
- 开发环境（Node.js、Rust、.NET、Go等）

### 3. 运行中的服务
- WordPress 博客（blog.arorms.cn）
- OpenClaw AI 助手
- 开发项目（HSI-SYSTEM等）

### 4. 联系信息
- 管理员信息
- GitHub 链接
- 技术栈展示

## 部署说明

### Nginx 配置
网站配置在 `/etc/nginx/sites-available/gabriel-website`，监听 80 端口。

### 网站目录
网站文件位于 `/var/www/gabriel-website/`

### 启动命令
```bash
sudo systemctl restart nginx
```

## 技术栈

- **前端**: HTML5, Tailwind CSS, Font Awesome, Google Fonts
- **服务器**: Nginx
- **自动化**: OpenClaw AI 助手创建和部署

## 创建信息

- **创建时间**: 2026年3月6日
- **创建者**: OpenClaw AI 助手
- **GitHub仓库**: Arorms/gabriel-website

## 许可证

MIT License