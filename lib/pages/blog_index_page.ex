defmodule Pepicrft.BlogIndexPage do
  use Tableau.Page,
    layout: Pepicrft.RootLayout,
    permalink: "/blog/",
    page_title: "Writing - Pedro Piñera",
    description: "Long-form notes on building tools, running systems, and keeping software humane."

  require EEx

  EEx.function_from_string(
    :def,
    :template,
    """
    <main class="page container">
      <header class="page-header stack">
        <p class="eyebrow">Writing</p>
        <p class="lede">Long-form notes on building tools, running systems, and keeping software humane.</p>
        <a href="/feed.xml" class="inline-link">RSS</a>
      </header>
      <section class="stack posts-list">
        <%= for post <- @posts do %>
        <article class="post-row">
          <time datetime="<%= Calendar.strftime(post.date, "%Y-%m-%d") %>" class="muted"><%= Calendar.strftime(post.date, "%Y-%m-%d") %></time>
          <div class="post-row-body">
            <a href="<%= post.permalink %>" class="post-link"><%= post.title %></a>
            <%= if post[:description] do %><p class="muted"><%= post.description %></p><% end %>
          </div>
        </article>
        <% end %>
        <%= if Enum.empty?(@posts) do %><p>No posts yet.</p><% end %>
      </section>
    </main>
    """,
    [:assigns]
  )
end
