# Pedro Piñera's Personal Website

Built with [Tableau](https://github.com/elixir-tools/tableau), an Elixir static site generator.

## Structure

```
.
├── config/config.exs    # Tableau configuration
├── lib/
│   ├── layouts/         # EEx layouts (root, post, note, snippet)
│   └── pages/           # Hand-written index pages (home, blog, notes, snippets)
├── _posts/              # Blog posts as YYYY-MM-DD-slug.md with YAML frontmatter
├── _notes/              # Short notes keyed by Unix timestamp
├── _snippets/           # Code snippets
├── static/              # Static assets (CSS, images, fonts)
└── build/               # Generated site (git-ignored)
```

## Requirements

Tooling is pinned via [mise](https://mise.jdx.dev):

- Erlang 27.x
- Elixir 1.19.x
- wrangler (for Cloudflare Pages deploy)

Run `mise install` in the project root to install them.

## Commands

```bash
mix deps.get          # Fetch Elixir dependencies (first time only)
mix tableau.server    # Dev server with live reload at http://localhost:4999
mix tableau.build     # Build to ./build
```

## Authoring

### Blog posts

Create `_posts/YYYY-MM-DD-slug.md` with YAML frontmatter:

```markdown
---
title: "Post Title"
slug: "post-slug"
date: "2026-04-19T12:00:00+00:00"
layout: "Pepicrft.PostLayout"
description: "Short summary"
tags:
  - "tag1"
---

Body in Markdown.
```

The slug becomes the URL: `/blog/post-slug/`.

### Notes

Create `_notes/{unix-timestamp}.md`:

```markdown
---
title: "Note 1700000000"
slug: "custom-slug-or-timestamp"
published: "2026-04-19T12:00:00Z"
timestamp: 1700000000
permalink: "/notes/custom-slug-or-timestamp/"
layout: "Pepicrft.NoteLayout"
---

Short observation.
```

### Snippets

Create `_snippets/{unix-timestamp}.md` with a fenced code block body.

## Deploy

Pushes to `main` run `.github/workflows/deploy.yml`: `mix tableau.build` → `wrangler pages deploy ./build`.
