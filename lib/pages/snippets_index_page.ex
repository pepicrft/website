defmodule Pepicrft.SnippetsIndexPage do
  use Tableau.Page,
    layout: Pepicrft.RootLayout,
    permalink: "/snippets/",
    page_title: "Snippets - Pedro Piñera",
    description: "Short, runnable snippets."

  require EEx

  def snippets(assigns) do
    (assigns[:pages] || [])
    |> Enum.filter(fn page ->
      p = page[:permalink] || ""
      String.starts_with?(p, "/snippets/") and p != "/snippets/"
    end)
    |> Enum.sort_by(fn page -> page[:published] || page[:timestamp] end, :desc)
  end

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <section class="stack">
        <p class="section-label">Snippets</p>
        <%= for snippet <- snippets(assigns) do %>
        <article class="snippet-row">
          <time datetime="<%= snippet[:published] %>" class="muted"><%= snippet[:published] %></time>
          <div class="snippet-body">
            <a href="<%= snippet.permalink %>" class="snippet-link"><%= snippet.title %></a>
            <p class="muted snippet-filename"><%= snippet[:filename] %></p>
          </div>
        </article>
        <% end %>
        <%= if Enum.empty?(snippets(assigns)) do %><p class="muted">No snippets yet.</p><% end %>
      </section>
    </main>
    """,
    [:assigns]
  )
end
