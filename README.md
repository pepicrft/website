# Pedro Piñera's Personal Website

Built with [Zola](https://www.getzola.org), a fast Rust-based static site generator.

## Structure

```
.
├── config.toml          # Zola site configuration
├── content/
│   ├── _index.md        # Home section
│   ├── blog/            # Blog posts at /blog/{slug}/
│   ├── notes/           # Notes at /notes/{slug}/
│   └── snippets/        # Code snippets at /snippets/{id}/
├── templates/           # Tera templates
└── static/              # Static assets (CSS, images, fonts, vendor scripts)
```

## Requirements

Tooling is pinned via [mise](https://mise.jdx.dev):

- Zola 0.22.x
- wrangler (for Cloudflare Pages deploy)

Run `mise install` in the project root.

## Commands

```bash
zola serve    # Dev server with live reload at http://127.0.0.1:1111
zola build    # Build to ./build
zola check    # Validate links, etc.
```

## Authoring

### Blog posts

Create `content/blog/{slug}.md` with TOML frontmatter:

```markdown
+++
title = "Post Title"
date = 2026-04-19T12:00:00+00:00
slug = "post-slug"
description = "Short summary"

[taxonomies]
tags = ["tag1", "tag2"]
+++

Body in Markdown.
```

The slug becomes the URL: `/blog/post-slug/`.

### Notes

Create `content/notes/{unix-timestamp}.md`:

```markdown
+++
title = "Note 1700000000"
date = 2026-04-19T12:00:00Z
slug = "custom-slug-or-timestamp"
template = "note.html"
+++

Short observation.
```

### Snippets

Create `content/snippets/{unix-timestamp}.md` with a fenced code block body and `template = "snippet.html"`.

## Deploy

Pushes to `main` run `.github/workflows/deploy.yml`: `zola build` → `wrangler pages deploy ./build`.
