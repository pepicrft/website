defmodule Craftweg.Pages do
  @moduledoc """
  This module embeds all the markdown pages in the priv/pages directory
  at compile them and provides functions for accessing them.
  """
  alias Craftweg.Pages.Page
  alias Craftweg.Markdown.Parser

  use NimblePublisher,
    build: Page,
    from: Application.app_dir(:craftweg, "priv/pages/**/*.md"),
    as: :pages,
    parser: Parser,
    highlighters: []

  @doc """
  Returns all the markdown pages in the priv/pages directory of the
  project
  """
  def all_pages, do: @pages
end