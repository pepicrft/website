# Agent Instructions for this Repository

- Visual system is deliberately minimal and text-centric. Keep typography at a single base size (1rem) and convey hierarchy with weight, spacing, and tone instead of scaling type or adding decorative UI.
- Styling must use the Theme UI-like token variables in `static/css/style.css` (`--theme-ui-colors-*`, `--theme-ui-fonts-*`, `--theme-ui-space-*`, etc.). Reference or extend these variables instead of hard-coding new values.
- Layouts stay single-column and quiet: narrow container (~760px), generous whitespace, light borders. Avoid new images, icons, gradients, or heavy ornamentation; prefer plain text.
- Fonts are set to Manrope for body and IBM Plex Mono for code. Do not introduce additional font families or sizes; adjust weight only when you need contrast.
- Site is built with [Zola](https://www.getzola.org). Blog posts live in `content/blog/{slug}.md` with TOML frontmatter (`title`, `date`, `slug`, `description`, `[taxonomies] tags`) and Markdown bodies (no inline HTML). Notes in `content/notes/{timestamp}.md` with `template = "note.html"`; snippets in `content/snippets/{timestamp}.md` with `template = "snippet.html"`. Templates are Tera under `templates/`. Run `zola serve` for a dev server with live reload, `zola build` to produce `./build`.
