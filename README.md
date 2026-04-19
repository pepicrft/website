# pepicrft.me 🦊

Pedro Piñera's personal website, built with [Zola](https://www.getzola.org).

## 📂 Layout

```
config.toml     # site config
content/blog/   # blog posts → /blog/{slug}/
templates/      # Tera templates
static/         # CSS, favicons, fonts, vendor scripts
```

## 🛠  Commands

Tooling is pinned in `mise.toml`. Run `mise install` once, then:

```bash
zola serve    # dev server with live reload
zola build    # build to ./build
```

## ✍️ Writing a post

Drop a new markdown file into `content/blog/`:

```markdown
+++
title = "Hello"
date = 2026-04-19
slug = "hello"
description = "Short summary"

[taxonomies]
tags = ["tag-one"]
+++

Body in Markdown.
```

The slug becomes the URL: `/blog/hello/`.

## 🚀 Deploy

Push to `main`. GitHub Actions builds with Zola and deploys to Cloudflare Pages.
