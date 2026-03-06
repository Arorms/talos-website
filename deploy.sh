#!/bin/bash

# Talos 网站部署脚本
# 用法: sudo ./deploy.sh

set -e

echo "🚀 开始部署 Talos 网站..."

# 检查是否以root运行
if [ "$EUID" -ne 0 ]; then 
    echo "❌ 请使用 sudo 运行此脚本"
    exit 1
fi

# 1. 创建网站目录
echo "📁 创建网站目录..."
mkdir -p /var/www/talos-website

# 2. 复制网站文件
echo "📄 复制网站文件..."
cp -r ./* /var/www/talos-website/

# 3. 设置权限
echo "🔒 设置文件权限..."
chown -R www-data:www-data /var/www/talos-website
chmod -R 755 /var/www/talos-website

# 4. 配置nginx
echo "⚙️ 配置nginx..."
cp nginx-config.conf /etc/nginx/sites-available/talos-website

# 5. 启用网站
echo "🔗 启用网站配置..."
ln -sf /etc/nginx/sites-available/talos-website /etc/nginx/sites-enabled/

# 6. 测试nginx配置
echo "🧪 测试nginx配置..."
nginx -t

# 7. 重启nginx
echo "🔄 重启nginx服务..."
systemctl restart nginx

# 8. 检查服务状态
echo "📊 检查nginx状态..."
systemctl status nginx --no-pager | head -20

echo ""
echo "✅ 部署完成！"
echo "🌐 网站地址: http://talos.arorms.cn"
echo "📁 网站目录: /var/www/talos-website"
echo "📝 配置文件: /etc/nginx/sites-available/talos-website"