#!/bin/bash

# Gabriel Website Deployment Script
# Usage: sudo ./deploy.sh

set -e

echo "🚀 Starting Gabriel Website deployment..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "❌ Please run with sudo"
    exit 1
fi

# 1. Remove old talos-website
echo "🗑️  Removing old talos-website..."
rm -rf /var/www/talos-website

# 2. Create website directory
echo "📁 Creating website directory..."
mkdir -p /var/www/gabriel-website

# 3. Copy website files
echo "📄 Copying website files..."
cp -r ./* /var/www/gabriel-website/

# 4. Set permissions
echo "🔒 Setting file permissions..."
chown -R www-data:www-data /var/www/gabriel-website
chmod -R 755 /var/www/gabriel-website

# 5. Configure nginx
echo "⚙️  Configuring nginx..."
cp nginx-config.conf /etc/nginx/sites-available/gabriel-website

# 6. Enable website
echo "🔗 Enabling website configuration..."
ln -sf /etc/nginx/sites-available/gabriel-website /etc/nginx/sites-enabled/

# 7. Disable old talos-website
echo "🚫 Disabling old talos-website..."
rm -f /etc/nginx/sites-enabled/talos-website

# 8. Test nginx configuration
echo "🧪 Testing nginx configuration..."
nginx -t

# 9. Restart nginx
echo "🔄 Restarting nginx service..."
systemctl restart nginx

# 10. Check service status
echo "📊 Checking nginx status..."
systemctl status nginx --no-pager | head -20

echo ""
echo "✅ Deployment complete!"
echo "🌐 Website URL: http://gabriel.arorms.cn"
echo "📁 Website directory: /var/www/gabriel-website"
echo "📝 Configuration file: /etc/nginx/sites-available/gabriel-website"
