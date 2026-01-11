# Pedro Piñera's Personal Website

This is a personal website built with [Gesttalt](https://github.com/pepicrft/gesttalt), a stable static site generator.

## Current Status

✅ **Initial setup complete:**
- Gesttalt website structure in place
- Configuration updated with personal details
- Theme from gesttalt/website copied
- Ready for content import from Ghost

🔜 **Next steps:**
- Import blog posts and content from pepicrft.me via Ghost API
- Customize theme and styling
- Add custom content sections

## Structure

```
.
├── gesttalt.toml       # Site configuration
├── content/            # Content files (to be populated)
│   ├── blog/           # Blog posts: YYYY/MM/DD/slug.md
│   └── notes/          # Short notes: {timestamp}.md
├── theme/              # Liquid templates
│   ├── layouts/        # Page templates
│   └── partials/       # Reusable components
└── static/             # Static assets (CSS, images, etc.)
```

## Building the Site

You'll need Gesttalt installed. Build with:

```bash
gesttalt build
```

For development with hot-reload:

```bash
gesttalt dev
```

## Content Format

### Blog Posts

Located in `content/blog/YYYY/MM/DD/slug.md`:

```markdown
+++
title = "Post Title"
description = "Post summary"
tags = ["tag1", "tag2"]
+++

Post content in Markdown...
```

### Notes

Located in `content/notes/{unix_timestamp}.md`:

```markdown
+++
slug = "custom-id"  # Optional
+++

Quick thought or note...
```

## Next: Ghost Import

Once you provide the Ghost API key, I'll:
1. Fetch all posts from pepicrft.me
2. Convert them to Gesttalt's format
3. Organize them in the correct directory structure
4. Preserve metadata (title, description, tags, dates)
5. Convert Ghost HTML/Markdown to Gesttalt's Markdown format

Ready when you are! 🦊
