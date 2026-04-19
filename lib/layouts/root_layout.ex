defmodule Pepicrft.RootLayout do
  use Tableau.Layout
  require EEx

  EEx.function_from_string(
    :def,
    :template,
    """
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title><%= @page[:page_title] || "Pedro Piñera" %></title>
      <meta name="description" content="<%= @page[:description] || "Software engineer, open source enthusiast, and builder" %>">
      <link rel="canonical" href="<%= URI.merge(@site.config.url, @page[:permalink] || "/") %>">
      <link rel="icon" href="/favicon.svg" type="image/svg+xml">
      <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
      <meta property="og:title" content="<%= @page[:page_title] || "Pedro Piñera" %>">
      <meta property="og:description" content="<%= @page[:description] || "Software engineer, open source enthusiast, and builder" %>">
      <meta property="og:url" content="<%= URI.merge(@site.config.url, @page[:permalink] || "/") %>">
      <meta property="og:image" content="<%= @site.config.url %>/og-image.png">
      <meta property="og:type" content="<%= @page[:og_type] || "website" %>">
      <%= if match?(%DateTime{}, @page[:date]) do %><meta property="article:published_time" content="<%= DateTime.to_iso8601(@page.date) %>"><% end %>
      <meta name="twitter:card" content="summary">
      <meta name="twitter:title" content="<%= @page[:page_title] || "Pedro Piñera" %>">
      <meta name="twitter:description" content="<%= @page[:description] || "Software engineer, open source enthusiast, and builder" %>">
      <meta name="twitter:image" content="<%= @site.config.url %>/og-image.png">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;600&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="/css/style.css">
      <link rel="alternate" type="application/rss+xml" title="Pedro Piñera RSS (Writing)" href="/feed.xml">
      <link rel="alternate" type="application/rss+xml" title="Pedro Piñera RSS (Notes)" href="/notes.xml">
      <link rel="alternate" type="application/rss+xml" title="Pedro Piñera RSS (All content)" href="/all.xml">
      <link rel="stylesheet" href="/vendor/highlight/styles/github.min.css">
      <script src="/vendor/highlight/highlight.min.js"></script>
      <script src="/vendor/highlight/languages/elixir.min.js"></script>
      <script>
      window.addEventListener('DOMContentLoaded', () => {
        if (window.hljs) {
          document.querySelectorAll('pre[class^="language-"] > code').forEach((code) => {
            const pre = code.parentElement;
            pre.classList.forEach((cls) => { if (cls.startsWith('language-')) code.classList.add(cls); });
          });
          hljs.highlightAll();
        }
        document.querySelectorAll('.prose h2, .prose h3, .prose h4').forEach((heading) => {
          const text = heading.textContent;
          const id = heading.id || text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
          heading.id = id;
          heading.innerHTML = '';
          const link = document.createElement('a');
          link.href = '#' + id; link.className = 'heading-link'; link.textContent = text;
          heading.appendChild(link);
          const anchor = document.createElement('a');
          anchor.href = '#' + id; anchor.className = 'anchor-link'; anchor.textContent = ' #';
          anchor.setAttribute('aria-label', 'Link to this section'); heading.appendChild(anchor);
        });
      });
      </script>
    </head>
    <body>
    <%= if Mix.env() == :dev, do: Tableau.live_reload(%{}) %>
    <header class="site-header">
      <div class="container">
        <div class="site-identity">
          <a href="/" class="site-title">Pedro Piñera</a>
          <span class="site-tagline">Builder and open-sourcerer. Tuist CEO and co-founder.</span>
        </div>
        <nav class="site-nav">
          <a href="/blog/">Writing</a>
          <a href="/notes/">Notes</a>
          <a href="/snippets/">Snippets</a>
        </nav>
      </div>
    </header>
    <%= render(@inner_content) %>
    <footer class="site-footer">
      <div class="container">
        <p>Built with <a href="https://github.com/elixir-tools/tableau">Tableau</a>. The more open the better.</p>
        <p>
          <a href="/feed.xml">RSS (Writing)</a>
          <span aria-hidden="true"> · </span>
          <a href="/notes.xml">RSS (Notes)</a>
          <span aria-hidden="true"> · </span>
          <a href="/all.xml">RSS (All)</a>
        </p>
      </div>
    </footer>
    </body>
    </html>
    """,
    [:assigns]
  )
end
