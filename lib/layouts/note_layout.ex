defmodule Pepicrft.NoteLayout do
  use Tableau.Layout, layout: Pepicrft.RootLayout
  require EEx

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <article class="stack note">
        <header class="stack note-header">
          <time datetime="<%= @page.published %>" class="muted"><%= @page.published %></time>
        </header>
        <div class="note-content prose">
          <%= render(@inner_content) %>
        </div>
      </article>
      <nav class="page-nav">
        <a href="/notes/">&larr; Back to notes</a>
      </nav>
    </main>
    """,
    [:assigns]
  )
end
