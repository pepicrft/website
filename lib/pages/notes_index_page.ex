defmodule Pepicrft.NotesIndexPage do
  use Tableau.Page,
    layout: Pepicrft.RootLayout,
    permalink: "/notes/",
    page_title: "Notes - Pedro Piñera",
    description: "Unpolished fragments and observations."

  require EEx

  def notes(assigns) do
    (assigns[:pages] || [])
    |> Enum.filter(fn page ->
      p = page[:permalink] || ""
      String.starts_with?(p, "/notes/") and p != "/notes/"
    end)
    |> Enum.sort_by(fn page -> page[:published] || page[:timestamp] end, :desc)
  end

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <header class="page-header stack">
        <p class="eyebrow">Notes</p>
        <p class="lede">Unpolished fragments and observations. Same size, lighter weight.</p>
        <a href="/notes.xml" class="inline-link">RSS</a>
      </header>
      <section class="stack notes-list">
        <%= for note <- notes(assigns) do %>
        <article class="note-row">
          <a href="<%= note.permalink %>" class="note-link">
            <time datetime="<%= note[:published] %>" class="muted"><%= note[:published] %></time>
            <div class="note-body">
              <%= Tableau.markdown(note[:body] || "") %>
            </div>
          </a>
        </article>
        <% end %>
        <%= if Enum.empty?(notes(assigns)) do %><p>No notes yet.</p><% end %>
      </section>
    </main>
    """,
    [:assigns]
  )
end
