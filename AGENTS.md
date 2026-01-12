# Agent Instructions for this Repository

- Visual system is deliberately minimal and text-centric. Keep typography at a single base size (1rem) and convey hierarchy with weight, spacing, and tone instead of scaling type or adding decorative UI.
- Styling must use the Theme UI-like token variables in `static/css/style.css` (`--theme-ui-colors-*`, `--theme-ui-fonts-*`, `--theme-ui-space-*`, etc.). Reference or extend these variables instead of hard-coding new values.
- Layouts stay single-column and quiet: narrow container (~760px), generous whitespace, light borders. Avoid new images, icons, gradients, or heavy ornamentation; prefer plain text.
- Fonts are set to Manrope for body and IBM Plex Mono for code. Do not introduce additional font families or sizes; adjust weight only when you need contrast.
- Blog content from `pedro-pinera.ghost.2026-01-12-16-33-51.json` now lives in `content/blog/YYYY/MM/DD/slug.md` with frontmatter (`title`, `description`, `tags`, `published_at`) and Markdown bodies (no inline HTML). Add future posts in the same structure. Notes follow the same minimal styling.
