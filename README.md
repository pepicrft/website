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

Push to `main`. GitHub Actions builds the site into an image in
[GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry).
The Pepicrft cluster detects the new image digest and rolls it out at
`https://pepicrft.me`.
