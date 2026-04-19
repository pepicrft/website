defmodule Pepicrft.PostLayout do
  use Tableau.Layout, layout: Pepicrft.RootLayout
  require EEx

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <article class="stack post">
        <header class="stack post-header">
          <p class="muted"><%= Calendar.strftime(@page.date, "%Y-%m-%d") %></p>
          <h1 class="post-title"><%= @page.title %></h1>
        </header>
        <div class="post-content prose">
          <%= render(@inner_content) %>
        </div>
      </article>
      <nav class="page-nav">
        <a href="/blog/">&larr; Back to writing</a>
      </nav>
    </main>
    """,
    [:assigns]
  )
end
