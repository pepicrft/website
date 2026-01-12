+++
title = "A convention for frictionless reproduction projects with Mise"
description = "I just realized Mise has the ingredients to make reproducing issues a breeze, and this is how you can leverage it."
tags = ["OSS", "DX", "devtools"]
published_at = "2025-01-11T12:00:00+00:00"
+++

When reporting issues to FOSS projects, developers are often asked to provide a minimal reproduction project. They usually come as **a pair of a tar file and a set of steps to reproduce the issue.**, some of which might be about installing and activating specific versions of dev tools (e.g. I was using Rust version `1.82.0`). Maintainers then have to pull the tar file, extract it, and go through the steps ensuring that they have the same environment as the reporter. Not only this adds a bit of friction to the reproduction process, but makes it prone to version inconsistencies, which can lead to additional back-and-forth between the reporter and the maintainer. Imagine we could simplify the process down to a single command:

```
mise run reproduce
```

Yesterday, while tinkering with some [Mise](https://mise.jdx.dev/) features, I realized Mise has the ingredients to make this possible:

* The capability to install and activate specific versions of dev tools. - An API to define and run [tasks](https://mise.jdx.dev/tasks/).

Let's see how we can leverage Mise to create a convention for frictionless reproduction projects.

## Creating a reproduction project

1. Create a new directory: `mkdir project`. 2. Create a `.mise.toml` file with the following content:

```
[tools]
# Add your tools here

[hooks]
enter = "mise install"
```

3. Create a `.mise/tasks/reproduce.sh` file with the reproduction steps:

```
#!/usr/bin/env bash
# mise description = "Reproduce the project"

# Mise tasks: https://mise.jdx.dev/tasks/file-tasks.html
# Note the root directory is denoted by the env. variable $MISE_PROJECT_ROOT
# Your reproduction steps go here
```

And that's all you need to create a reproduction project with Mise. The maintainer can pull the tar file, extract it, and run `mise run reproduce` to reproduce the issue.

## A ready-to-use gist

I've created a [gist](https://gist.github.com/pepicrft/12a2fc6433338489888d660d66d8d0b1) with a script that automates the steps above. You can easily run it with the following command:

```
curl https://gist.githubusercontent.com/pepicrft/12a2fc6433338489888d660d66d8d0b1/raw/907f33c43287c19162c79b2426015c516d4c3cd7/reproduce.sh | sh
```
