+++
title = "Scoping dev environments to clones"
description = "When your team works with multiple clones of the same repository, global resources like ports and databases start to conflict. Here is how we solved it at Tuist using mise and a simple random suffix."
tags = ["Tuist", "Development", "Tooling", "mise"]
published_at = "2026-03-25T08:00:00+00:00"
+++

Something we noticed at [Tuist](https://tuist.dev) is that most of the team works with several copies and clones of the repository. This is natural when you are juggling different features, reviewing pull requests, or keeping a clean main branch alongside work-in-progress branches. But it became problematic when it came to running the server locally.

The issue is global resources. Ports, for instance. We run more than one server locally, the main [Phoenix](https://www.phoenixframework.org/) application, a local S3 server, and a few other services. Each of them needs its own port. And then there are database names in [PostgreSQL](https://www.postgresql.org/) and [ClickHouse](https://clickhouse.com/). All of these are named, and if two clones try to use the same ports and database names, things break in confusing ways. You end up with one clone's server stepping on another's data, or port conflicts that force you to hunt down which process is holding what.

## The idea

We wanted a way to scope each clone to its own set of ports and database names. No manual configuration, no remembering to change environment variables when switching between clones. It should just work.

The solution we came up with uses [mise](https://mise.jdx.dev/). In our `mise.toml`, we source a shell script that lazily creates a small piece of state in the repository:

```toml
[env]
    _.source = "{{config_root}}/mise/utilities/dev_instance_env.sh"
```

The script checks for a file called `.tuist-dev-instance` at the repository root. If it does not exist, it generates a random number between 100 and 999 and writes it there. If it already exists, it reads the number back. The file is in `.gitignore`, so each clone gets its own.

```bash
suffix="$(ensure_suffix)"

export TUIST_DEV_INSTANCE="${suffix}"
export TUIST_SERVER_PORT="$((8080 + suffix))"
export TUIST_SERVER_URL="http://localhost:${TUIST_SERVER_PORT}"
export TUIST_SERVER_POSTGRES_DB="tuist_development_${suffix}"
export TUIST_CACHE_PORT="$((8087 + suffix))"
export TUIST_MINIO_API_PORT="$((9095 + suffix))"
```

That is it. Every port becomes a base port plus the suffix. Every database name gets the suffix appended. The probability of two clones picking the same random number is low enough that in practice it never happens.

## Why it works

The beauty of this approach is that it requires zero thought from the developer. You clone the repository, you run `mise install`, you start the server, and everything just works. The first time mise activates, it sources the script, the script generates the suffix, and from that point on every environment variable is scoped to that clone.

In my case, I have six clones of Tuist on my machine. I can have six Phoenix applications running simultaneously, each with its own ports and its own databases, completely unaware of each other. There is no coordination needed. No shared configuration file to update. No "make sure you change the port before starting."

The environment variables flow naturally into the application configuration. In `runtime.exs`, the Phoenix server reads the port from the environment:

```elixir
port =
  if env == :dev do
    String.to_integer(System.get_env("TUIST_SERVER_PORT") || "8080")
  else
    8080
  end
```

And the same pattern applies to test databases, storage directories, and any other resource that needs to be isolated.

## The small details

A few things that make this work smoothly in practice. The suffix is validated to be a number between 1 and 999, so the port ranges stay within reasonable bounds. You can also override it by setting `TUIST_DEV_INSTANCE` as an environment variable, which is useful if you want deterministic values in CI or for debugging. And the script is careful about shell compatibility, working in both Bash and Zsh.

If you are dealing with something similar, consider giving this pattern a try. It is simple, and it works.
