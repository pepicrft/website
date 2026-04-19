# Agent Instructions for this Repository

- Visual system is deliberately minimal and text-centric. Keep typography at a single base size (1rem) and convey hierarchy with weight, spacing, and tone instead of scaling type or adding decorative UI.
- Styling must use the Theme UI-like token variables in `static/css/style.css` (`--theme-ui-colors-*`, `--theme-ui-fonts-*`, `--theme-ui-space-*`, etc.). Reference or extend these variables instead of hard-coding new values.
- Layouts stay single-column and quiet: narrow container (~760px), generous whitespace, light borders. Avoid new images, icons, gradients, or heavy ornamentation; prefer plain text.
- Fonts are set to Manrope for body and IBM Plex Mono for code. Do not introduce additional font families or sizes; adjust weight only when you need contrast.
- Site is built with [Tableau](https://github.com/elixir-tools/tableau). Blog posts live in `_posts/YYYY-MM-DD-slug.md` with YAML frontmatter (`title`, `slug`, `date`, `layout: "Pepicrft.PostLayout"`, `description`, `tags`) and Markdown bodies (no inline HTML). Notes in `_notes/`, snippets in `_snippets/`. Layouts are EEx modules under `lib/layouts/`, pages under `lib/pages/`. Run `mix tableau.server` for a dev server with live reload, `mix tableau.build` to produce `./build`.
