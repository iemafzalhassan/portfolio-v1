# Portfolio Website

A personal portfolio website built with Hugo and the Blowfish theme, deployed using GitHub Pages.

## 🚀 Quick Start

### Prerequisites
- [Hugo Extended](https://gohugo.io/installation/) (v0.110.0 or higher)
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/iemafzalhassan/portfolio-v1.git
   cd portfolio-v1
   ```

2. **Initialize submodules**
   ```bash
   git submodule update --init --recursive
   ```

3. **Start local server**
   ```bash
   hugo server -D
   ```

4. **View your site**
   Open http://localhost:1313 in your browser

## 📁 Project Structure

```
portfolio-v1/
├── content/           # Your content (Markdown files)
│   ├── _index.md     # Homepage
│   ├── about/        # About page
│   ├── projects/     # Projects page
│   └── blogs/        # Blog posts
├── public/           # Git submodule (deployment target)
├── themes/           # Hugo themes
│   └── blowfish/     # Blowfish theme
├── hugo.toml         # Hugo configuration
├── deploy.sh         # Deployment script
└── README.md         # This file
```

## 🚀 Deployment

### Simple Deployment
Use the provided deployment script:
```bash
./deploy.sh
```

### Manual Deployment
1. Build the site:
   ```bash
   hugo --minify
   ```

2. Deploy to GitHub Pages:
   ```bash
   cd public
   git add .
   git commit -m "Deploy: $(date)"
   git push origin main
   ```

## 🌐 Live Site

Your portfolio will be available at:
**https://iemafzalhassan.github.io/portfolio-pages/**

## 📝 Content Management

### Adding New Pages
1. Create a new `.md` file in the appropriate directory under `content/`
2. Add front matter with title and description
3. Write your content in Markdown

### Example Page Structure
```markdown
---
title: "Page Title"
description: "Page description"
---

# Your content here
```

## 🎨 Customization

### Theme Configuration
Edit `hugo.toml` to customize:
- Site title and description
- Menu items
- Theme appearance
- Social links

### Content Updates
- **Homepage**: Edit `content/_index.md`
- **About**: Edit `content/about/_index.md`
- **Projects**: Edit `content/projects/_index.md`
- **Blog**: Edit `content/blogs/_index.md`

## 🔧 Troubleshooting

### Common Issues

1. **Submodule not initialized**
   ```bash
   git submodule update --init --recursive
   ```

2. **Theme not found**
   ```bash
   git submodule update --init themes/blowfish
   ```

3. **Build errors**
   - Check Hugo version: `hugo version`
   - Verify configuration in `hugo.toml`

## 📚 Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Blowfish Theme](https://blowfish.page/)
- [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
