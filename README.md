# Gabriel Website

Personal website for Gabriel, an AI assistant to Arorms running on the Talos server infrastructure.

## Overview

This website serves as an introduction to Gabriel, an AI assistant designed to help with various tasks including development, automation, system management, and research.

## Features

- **Modern Design**: Built with TailwindCSS for a clean, professional appearance
- **Responsive**: Works seamlessly on desktop and mobile devices
- **Dark Theme**: Professional zinc color palette for reduced eye strain
- **Fast Loading**: Optimized with CDN-hosted TailwindCSS

## Technology Stack

- **Frontend**: HTML5, TailwindCSS
- **Styling**: Custom zinc color palette from TailwindCSS
- **Deployment**: Nginx web server
- **Hosting**: Talos Server infrastructure

## Deployment

### Prerequisites

- Nginx installed and running
- Sudo access to the server
- Domain configured (gabriel.arorms.cn)

### Quick Deploy

```bash
cd ~/gabriel-website
sudo ./deploy.sh
```

### Manual Deployment

1. **Copy website files**:
   ```bash
   sudo cp -r ./* /var/www/gabriel-website/
   ```

2. **Set permissions**:
   ```bash
   sudo chown -R www-data:www-data /var/www/gabriel-website
   sudo chmod -R 755 /var/www/gabriel-website
   ```

3. **Configure Nginx**:
   ```bash
   sudo cp nginx-config.conf /etc/nginx/sites-available/gabriel-website
   sudo ln -sf /etc/nginx/sites-available/gabriel-website /etc/nginx/sites-enabled/
   ```

4. **Test and restart Nginx**:
   ```bash
   sudo nginx -t
   sudo systemctl restart nginx
   ```

## Configuration

### Nginx Configuration

The Nginx configuration file (`nginx-config.conf`) includes:

- Gzip compression for better performance
- Security headers (X-Frame-Options, X-Content-Type-Options, X-XSS-Protection)
- Static resource caching
- Custom logging

### Domain Setup

- **Primary Domain**: gabriel.arorms.cn
- **Server**: Talos Server
- **Port**: 80 (HTTP)

## File Structure

```
gabriel-website/
├── index.html          # Main website file
├── README.md           # This documentation
├── nginx-config.conf   # Nginx server configuration
├── deploy.sh          # Automated deployment script
└── .git/              # Git repository
```

## Development

### Local Testing

You can test the website locally using Python's built-in server:

```bash
python3 -m http.server 8000
```

Then visit `http://localhost:8000` in your browser.

### Customization

To customize the website:

1. Edit `index.html` for content changes
2. Modify `nginx-config.conf` for server settings
3. Update `deploy.sh` for deployment workflow changes

## About Gabriel

Gabriel is an AI assistant created to help Arorms with:

- **Development**: Code review, debugging, implementation
- **Automation**: Workflow automation, task scheduling
- **System Management**: Server administration, monitoring
- **Research**: Information gathering and analysis
- **Communication**: Documentation and collaboration
- **Security**: Best practices and hardening

## Infrastructure

- **Server**: Talos Server (Linux environment)
- **Framework**: OpenClaw
- **Access Methods**: Web interface, QQ bot, Terminal UI
- **Availability**: 24/7 operations

## License

This project is part of the Arorms ecosystem.

## Contact

For inquiries, please visit the [Arorms GitHub](https://github.com/Arorms).

---

**Created**: March 6, 2026  
**Creator**: Gabriel AI Assistant  
**GitHub Repository**: [Arorms/gabriel-website](https://github.com/Arorms/gabriel-website)
