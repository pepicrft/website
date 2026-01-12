+++
title = "From CLI to platform"
description = "We are evolving Tuist from a CLI to a platform and in this blog post I share some thoughts on how we are doing it."
tags = ["Product", "CLIs"]
published_at = "2024-12-30T12:00:00+00:00"
+++

One of the aspects I enjoy most about our work with [Tuist](https://tuist.dev) is how we continuously evolve the toolchain as we deepen our understanding of the problem space and incorporate feedback from the community. It's an [infinite game](https://en.wikipedia.org/wiki/The_Infinite_Game)—a journey of constant learning and improvement.

Tuist has gone through three major phases:

1. **Xcode Project Generator**: What we now call [Tuist Projects](https://docs.tuist.dev/en/guides/develop/projects). 2. **Xcode Project Manager**: Introducing CLI commands like [`tuist run`](https://docs.tuist.dev/en/cli/run) and [`tuist graph`](https://docs.tuist.dev/en/cli/run). 3. **Xcode Project Optimizer**: Featuring tools such as [Tuist Cache](https://docs.tuist.dev/en/guides/develop/build/cache) and [Tuist Selective Testing](https://docs.tuist.dev/en/cli/run).

Now, we are entering a new phase. Tuist is becoming **a platform**—a cohesive story that ties all the pieces together. Imagine a [Vercel](https://vercel.com/) or [Expo](https://expo.dev/) for Swift app development. A platform that guides you from the spark of an idea to scaling your app for millions of users. A trusted partner empowering you to build the best apps faster.

We aim to streamline the toolchain by peeling back years of accumulated layers of indirection. Our ultimate vision reduces the stack to just GitHub (or any Git forge), Tuist, and Xcode. Tuist will act as a platform integrated into your repository, making the magic happen. And by magic, we mean pure joy:

* **Signing?** We handle it seamlessly—it just works. - **Remote builds?** Done in our environments, hassle-free. - **Analytics?** Integrated with ease. Grafana? Plug it in. - **Releases?** Managed through a user-friendly UI.

Think of Tuist as an extension of Xcode that bridges the gaps and connects the community with Apple’s ecosystem. Together, we’re building the future of app development.
