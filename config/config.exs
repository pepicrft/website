import Config

config :tableau, :config,
  url: "https://pepicrft.me",
  include_dir: "static",
  out_dir: "build",
  converters: [md: Tableau.MDExConverter, ex: Tableau.MDExConverter],
  markdown: [
    mdex: [
      extension: [
        strikethrough: true,
        autolink: true,
        header_ids: "",
        footnotes: true,
        table: true
      ],
      render: [unsafe: true]
    ]
  ]

config :tableau, :reloader,
  patterns: [
    ~r"lib/.*.ex",
    ~r"(_posts|_notes|_snippets)/.*\.(md|ex)",
    ~r"static/.*\.(css|js|png|svg|jpg|jpeg)"
  ]

config :tableau, Tableau.PostExtension,
  enabled: true,
  dir: "_posts",
  future: false,
  permalink: "/blog/:slug/",
  layout: "Pepicrft.PostLayout"

config :tableau, Tableau.PageExtension,
  enabled: true,
  dir: ["_notes", "_snippets"]

config :tableau, Tableau.DataExtension, enabled: true

config :tableau, Tableau.SitemapExtension, enabled: true

config :tableau, Tableau.RSSExtension,
  enabled: true,
  feeds: [
    feed: [
      enabled: true,
      language: "en",
      title: "Pedro Piñera",
      description: "Long-form writing by Pedro Piñera"
    ]
  ]
