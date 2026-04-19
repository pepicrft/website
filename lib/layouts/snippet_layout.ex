defmodule Pepicrft.SnippetLayout do
  use Tableau.Layout, layout: Pepicrft.RootLayout
  require EEx

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <article class="snippet-detail stack">
        <a href="/snippets/" class="muted back-link">← Back to snippets</a>
        <h1><%= @page.title %></h1>
        <time datetime="<%= @page.published %>" class="muted"><%= @page.published %></time>
        <p class="muted snippet-filename"><%= @page.filename %></p>
        <div class="snippet-content">
          <%= render(@inner_content) %>
        </div>
      </article>
    </main>
    """,
    [:assigns]
  )
end
