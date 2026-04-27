+++
title = "Bazel everywhere?"
date = 2026-04-27T10:00:00+00:00
slug = "bazel-everywhere"
description = "Coding agents are lowering the cost of adopting powerful but complex tools like Kubernetes and Bazel, but I don't think that means we're heading toward a Bazel-everywhere world. The reasons are not technical, they are ecosystem-shaped."


[taxonomies]
tags = ["Tuist", "Bazel", "Build Systems", "Infrastructure"]
+++
Coding agents have changed the cost of adopting powerful tools. [Kubernetes](https://kubernetes.io/) and [Bazel](https://bazel.build/) were always capable, but the surface area of concepts and the maintenance load made them feel out of reach for small projects and small teams. Now you can sit down with an agent, get introduced to the concepts, narrow them down to the ones you actually need, and have a working setup in an afternoon. We're exploring this at [Tuist](https://tuist.dev) in the context of Kubernetes, and I've been thinking a lot about Bazel as the next build system we plan to support.

Part of me kept asking the obvious question. If Bazel is now easier to adopt, why not Bazel everywhere? The more I sat with it, the more I realized the problem is not technical. It's about how things actually work in our industry.

## Integrated toolchains are the real ceiling

Look at [Cargo](https://doc.rust-lang.org/cargo/), [Vite](https://vite.dev/), or [Mix](https://hexdocs.pm/mix/Mix.html) in Elixir. These are integrated toolchains where compilation tasks and non-compilation tasks are woven into something that goes far beyond compiling. Vite ships an HTTP server doing hot reload of resources in the browser. Mix orchestrates dependency resolution, releases, and a whole runtime story. Cargo handles registries, features, and workspaces in a way that has become inseparable from how Rust developers think about their projects.

If you wanted to do all of that in Bazel, you would literally have to replicate the internals of Cargo, or Mix, or Vite. That's an insane amount of effort, and on top of that you'd be forking the ecosystem. You wouldn't benefit from the work that the maintainers of those tools keep pouring in, and you'd have to keep up with them forever. There is real value in Bazel, but there is no version of "Bazel everywhere" that doesn't end up rebuilding the world.

Coding agents don't change that. They lower the human cost of adoption, but they don't lower the cost of forking an entire ecosystem.

## The plugin layer is a tell

When you look at how Bazel plugins are implemented for some of these toolchains, you notice that under the hood they often end up shelling out and calling Cargo or the equivalent. That feels wrong to me. It's the build system admitting that the integrated toolchain is the real source of truth, while pretending to wrap it.

I caught myself imagining a different shape. What if there was a foundation underneath all build systems, something like a content-addressable store with a shared event model, that every ecosystem could build on? A common floor that lowers the stack and lets each toolchain keep its identity on top. A bit like LLVM, where some toolchains build on it and others don't.

It's a nice thought, and also an impossible one to execute. You'd need every ecosystem to migrate to the same foundation, which is not how our industry moves. LLVM is the closest example we have, and even there the adoption is uneven. For something as load-bearing as build infrastructure, the gravitational pull of "what already works" is too strong.

## Build systems learning from each other

What I think is realistic, and probably more useful, is for these tools to learn from each other and incorporate similar ideas. Telemetry is a good example. It's still uncommon in build systems, even though it's the most direct way to understand where time is being spent and where caching would pay off. The content-addressable store idea is another one. So is aligning around a shared contract with a remote cache server, so that the cache layer becomes interchangeable.

We'll definitely see more companies adopt Bazel where it makes sense, but I don't think it's going to be everywhere. My bet for the next few years is that the other build systems catch up in terms of ideas, while staying inside their own ecosystems.

## Where Tuist fits

For us, this is the bet we want to make. We want to be ready to provide the infrastructure for low-latency caching and analytics, so that all the complexity of running those things yourself is taken care of by us. Productized in a way that feels closer to [Supabase](https://supabase.com/) or [PlanetScale](https://planetscale.com/) than to a build engineering team.

You focus on your tools, your projects, and the runtime of your software. We integrate with every toolchain that exists and deploy productivity infrastructure for you. That's a more honest answer to the original question than trying to convince everyone to adopt the same build system. The world is not converging on one toolchain, and it doesn't need to. What it needs is a shared layer of infrastructure underneath the ones we already have.
