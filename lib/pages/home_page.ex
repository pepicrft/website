defmodule Pepicrft.HomePage do
  use Tableau.Page,
    layout: Pepicrft.RootLayout,
    permalink: "/",
    page_title: "Pedro Piñera",
    description: "Software engineer, open source enthusiast, and builder"

  require EEx

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <%= if Enum.any?(@posts) do %>
      <section class="stack posts-list">
        <p class="section-label">Recent writing</p>
        <%= for post <- @posts do %>
        <article class="post-row">
          <time datetime="<%= Calendar.strftime(post.date, "%Y-%m-%d") %>" class="muted"><%= Calendar.strftime(post.date, "%Y-%m-%d") %></time>
          <div class="post-row-body">
            <a href="<%= post.permalink %>" class="post-link"><%= post.title %></a>
            <%= if post[:description] do %><p class="muted"><%= post.description %></p><% end %>
          </div>
        </article>
        <% end %>
      </section>
      <% end %>
    </main>
    """,
    [:assigns]
  )
end
