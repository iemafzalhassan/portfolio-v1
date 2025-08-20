# Personal Portfolio Website

A modern, responsive portfolio website built with Hugo and the Blowfish theme. This project demonstrates clean architecture, automated deployment, and best practices for personal branding online.

## Overview

This portfolio showcases my work as a DevOps Engineer and Cloud Enthusiast, featuring projects, blog posts, and professional information. The site is built with Hugo for fast performance and deployed automatically via GitHub Pages with a custom domain.

## Features

- **Fast & Responsive**: Built with Hugo for optimal performance
- **Modern Design**: Clean, professional layout using Blowfish theme
- **Custom Domain**: Deployed at portfolio.iemafzalhassan.in
- **Automated Deployment**: One-command deployment via Git submodules
- **SEO Optimized**: Built-in search engine optimization
- **Mobile Friendly**: Responsive design for all devices

## Prerequisites

Before you begin, ensure you have the following installed:

- **Hugo Extended** (v0.148.2 or higher) - [Installation Guide](https://gohugo.io/installation/)
- **Git** - [Download Git](https://git-scm.com/downloads)
- **A GitHub account** for hosting

## Getting Started

### Step 1: Clone the Repository

```bash
git clone https://github.com/iemafzalhassan/portfolio-v1.git
cd portfolio-v1
```

### Step 2: Initialize Submodules

This project uses Git submodules for the theme and deployment. Initialize them:

```bash
git submodule update --init --recursive
```

### Step 3: Start Local Development

Run the development server to preview your site:

```bash
hugo server -D
```

Your site will be available at `http://localhost:1313`

## Project Structure

```
portfolio-v1/
├── content/              # Your content (Markdown files)
│   ├── _index.md        # Homepage content
│   ├── about/           # About page
│   ├── projects/        # Project showcases
│   └── blogs/           # Blog posts
├── public/              # Git submodule (deployment target)
├── themes/              # Hugo themes
│   └── blowfish/        # Blowfish theme
├── hugo.toml            # Hugo configuration
├── deploy.sh            # Deployment script
└── README.md            # This file
```

## Deployment

### Automated Deployment (Recommended)

This portfolio uses **GitHub Actions** for automated deployment. Every push to the `main` branch triggers:

1. **Lint & Check**: Markdown validation and link checking
2. **Build**: Hugo site generation
3. **Deploy**: Automatic deployment to GitHub Pages
4. **Notify**: Slack notifications for deployment status

**To deploy:**
```bash
git add .
git commit -m "Your commit message"
git push origin main
```

The deployment will automatically start and you'll receive Slack notifications.

### Manual Deployment

Use the provided deployment script for manual deployment:

```bash
./deploy.sh
```

This script will:
1. Build your Hugo site
2. Navigate to the public directory
3. Commit and push changes to GitHub Pages
4. Deploy your site automatically

### Manual Deployment

If you prefer manual control:

```bash
# Build the site
hugo --minify

# Deploy to GitHub Pages
cd public
git add .
git commit -m "Deploy: $(date)"
git push origin main
```

## Custom Domain Setup

This portfolio uses a custom domain (`portfolio.iemafzalhassan.in`). To set up your own:

### 1. DNS Configuration

Configure your domain's DNS records:
- **Type**: CNAME
- **Name**: `portfolio` (or your preferred subdomain)
- **Value**: `yourusername.github.io`

### 2. GitHub Pages Settings

1. Go to your GitHub repository settings
2. Navigate to "Pages" section
3. Add your custom domain
4. Enable "Enforce HTTPS" once available

### 3. CNAME File

The `public/CNAME` file contains your custom domain. Ensure it's included in your repository:

```
portfolio.iemafzalhassan.in
```

## Content Management

### Adding New Pages

1. Create a new `.md` file in the appropriate directory under `content/`
2. Add front matter with title and description
3. Write your content in Markdown

### Example Page Structure

```markdown
---
title: "My New Page"
description: "A brief description of this page"
date: 2024-01-01
---

# Page Title

Your content goes here...
```

### Key Content Files

- **Homepage**: `content/_index.md`
- **About Page**: `content/about/_index.md`
- **Projects**: `content/projects/_index.md`
- **Blog Posts**: `content/blogs/_index.md`

## Customization

### Site Configuration

Edit `hugo.toml` to customize:
- Site title and description
- Menu structure
- Theme appearance
- Social media links
- Base URL for deployment

### Theme Customization

The Blowfish theme offers extensive customization options:
- Color schemes
- Layout options
- Typography settings
- Social media integration

## Monitoring Deployment

### GitHub Actions
- **View Workflows**: Go to [Actions tab](https://github.com/iemafzalhassan/portfolio-v1/actions) in your repository
- **Check Logs**: Click on any workflow run to see detailed logs
- **Manual Trigger**: Use "workflow_dispatch" to manually trigger deployment

### Slack Notifications
You'll receive notifications for:
- 🚀 **Deployment Start**: When the process begins
- ✅ **Success**: When deployment completes successfully
- ❌ **Failure**: If any step fails with error details

### Deployment Status
- **Site URL**: https://portfolio.iemafzalhassan.in/
- **GitHub Pages**: https://iemafzalhassan.github.io/portfolio-pages/
- **Actions Logs**: https://github.com/iemafzalhassan/portfolio-v1/actions

## Troubleshooting

### Common Issues and Solutions

**Submodule not initialized**
```bash
git submodule update --init --recursive
```

**Theme not found**
```bash
git submodule update --init themes/blowfish
```

**Build errors**
- Verify Hugo version: `hugo version`
- Check configuration in `hugo.toml`
- Ensure all required files are present

**Deployment issues**
- Verify CNAME file exists in public directory
- Check GitHub Pages settings
- Ensure repository has proper permissions

**Custom domain not working**
- Verify DNS configuration
- Check CNAME file content
- Wait up to 1 hour for DNS propagation

## Performance Optimization

This portfolio is optimized for:
- **Fast loading times** through Hugo's static generation
- **SEO optimization** with proper meta tags and structure
- **Mobile responsiveness** for all devices
- **Accessibility** following web standards

## Security Considerations

- HTTPS is enforced for secure connections
- No sensitive data is stored in the repository
- Regular updates to dependencies
- Secure deployment practices

## Contributing

This is a personal portfolio project, but suggestions and improvements are welcome. Feel free to:
- Report issues
- Suggest enhancements
- Share feedback on design or functionality

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Blowfish Theme Documentation](https://blowfish.page/)
- [Git Submodules Guide](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

## License

This project is open source and available under the MIT License. See the LICENSE file for details.

## Contact

For questions or feedback about this portfolio setup, feel free to reach out through the contact information provided on the website.

---

*Built with Hugo and deployed on GitHub Pages*
