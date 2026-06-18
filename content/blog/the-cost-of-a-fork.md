+++
title = "The cost of a fork"
date = 2026-06-18T08:00:00+00:00
slug = "the-cost-of-a-fork"
description = "Every build system is a trade-off. The one that interests me is whether you stay native or fork the ecosystem, because a fork has a cost that doesn't go unnoticed."

[taxonomies]
tags = ["Tuist", "Build Systems", "Infrastructure", "AI"]
+++
*Every build system is a trade-off. The one that interests me is whether you stay native or fork the ecosystem, because a fork has a cost that doesn't go unnoticed.*

Yesterday I posted a thread on X about the cost of native versus non-native build systems, and I wanted to expand it here. The thread came out of a discussion I came across, one of those "X is better than Tuist" conversations that show up every now and then. It's fine, it's normal, and it's good that companies have options to choose from. But it made me think that we don't always see the trade-offs behind every build system decision we make. We tend to imagine there's a perfect build system out there that solves all of our problems, and there isn't. So I want to go deep into what you're actually trading when you pick one path over another.

## Native and non-native

On one side there are what I'll call native build systems, for lack of a better term. By native I mean the one that ships with the toolchain. If you're on Apple platforms, the underlying piece is [Swift Build](https://github.com/swiftlang/swift-build). On Android you're likely using [Gradle](https://gradle.org/). In Rust it's [Cargo](https://doc.rust-lang.org/cargo/). In Elixir it's [Mix](https://hexdocs.pm/mix/Mix.html). These usually come bundled with the other pieces you need to develop, like formatting, linting, and dependency resolution, and they're maintained by whoever sits behind the language, a foundation or, in Apple's case, Apple itself. Their engineers add features and make sure all the pieces fit together seamlessly. And every ecosystem has a different set of incentives depending on how it emerged. Apple's motivation, at the end of the day, is a business. They sell hardware and services.

On the other side there's what I call non-native build systems. Things like [Bazel](https://bazel.build/) from Google, [Buck](https://buck2.build/) from Meta, or more recently [Nx](https://nx.dev/) in JavaScript. At their core, build systems are all the same idea: a directed graph of tasks describing what needs to happen for something to be built or tested. The non-native ones usually bring caching and selectivity, so you only build what changed and you can move that work elsewhere.

The core is a graph and a language to describe it. The ideas are similar everywhere. What's heterogeneous is how each ecosystem translates those ideas into specifics: different compilers, different tools, sometimes a language that imposes its own restrictions on how the graph can be shaped. Same core, different surface.

## A fork has a cost

The way I like to think about non-native systems is that they fork the ecosystem, and a fork has a cost that doesn't go unnoticed. This reminds me of a [podcast](https://fulltimenix.com/episodes/nix-at-shopify-ede45e30-471e-4e01-9038-70f236cf6eb8) I was listening to the other day where Shopify talked about trying to embrace [Nix](https://nixos.org/) across the whole org. They got it working in places, and then realized they had broken so many workflows, like the way people develop and publish Ruby gems locally. That's the tension you sign up for when you embrace something like Nix, and the same is true for Bazel. The fork is expensive. The cost is lower today thanks to agents you can point at an existing build setup, but it's still high, and it multiplies by the number of toolchains you support.

This is why these systems are designed to be bridged and extended. They call it rules. The motivation is that Google or Meta don't want to maintain the integration with every toolchain out there, so it becomes a community thing. It's wonderful that they open source it and make it extensible. But it also means you depend on whoever is interested in maintaining a given rule, which in some cases is one person or one company. And it's not just whether they support the rule, it's whether they support the specific feature you want. Take the Apple [rules for Bazel](https://github.com/bazelbuild/rules_apple): if they're maintained by people who don't care about [Swift macros](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/) and you happen to need Swift macros, you're suddenly the one who has to step in, contribute, and keep it alive.

I say this with some humility, because we fork things too. The way we suggest integrating packages in Tuist is by resolving them with the [Swift Package Manager](https://www.swift.org/package-manager/) and then mapping those definitions into native pieces like targets and build settings, kind of like converting one graph into another. Whenever Apple adds something new to the interface of a target or a product, we either align with it quickly or some people run into issues. Same story with macros: the moment Apple introduces the concept and packages start adopting it, anyone living downstream in the ecosystem has to add support too. It's a cost, and it's real.

## Why this matters now

What I really want to get at is how much development is changing. A lot of the work right now is multiple agents writing code, and then using a compiler or build system as the feedback loop to validate that the work is correct. You end up with several build systems running concurrently to check changes, which puts a lot of stress on designs that were never meant for it, pushing them to their limits.

I can't think of a better example than DerivedData in Xcode and how it interacts with multiple worktrees. Each worktree gets its own DerivedData folder. Even though the worktrees are semantically the same project, they share no artifacts, so every one of them resolves its own tree of packages and builds something nearly identical. Sure, it copies from a cache, but it still resolves and copies for each tree. It's kind of insane when you stop and look at it.

## Wait, or fork

When you find yourself there, you face a choice. Do you wait for the native build system to catch up, staying put while you hope the foundation or company behind it, Apple in this case, gets incentivized enough to tackle problems that are serious and costly? Or do you fork and deal with it yourself, with the full flexibility to work around the limitation or solve it in a way you find beautiful, at the price of a piece you now have to maintain?

I'll be honest that I lean toward the fork. I tried reporting Xcode caching issues, things like fingerprinting and hashing bugs, and they were basically ignored. I did the same with some ideas around observability, and there was no real interest either. When you fork, it's costly, but you can enable features and solutions the native system doesn't care about. Because the question is rarely "can this be done technically." It's "does the foundation or the company behind the toolchain care." On Apple platforms, the build system is embedded in Xcode and ships on Xcode's release cycle, so it moves at the speed of Apple caring about this new reality. With rules, it moves at the speed of whoever maintains them caring. Both are bets on someone else's incentives.

## Where we stand

The stance we're taking with [Tuist](https://tuist.dev) is that, in the end, we're a platform. We provide the infrastructure so these build systems can cache artifacts and run work remotely, and we would rather embrace the diversity of build systems than pick a winner. I think it's beautiful that we have both native and non-native options, and our job is to give all of them the best infrastructure we can.

Where we can, we'll also try to push the ecosystem forward. We tried that with Apple and it didn't move anywhere. We would like to make our contribution to Elixir. We want to support Bazel, talk about it, and contribute to the rules that already exist. And I do think the native toolchains will get better. Some things you can't rush or shortcut, but it's a matter of time.

There's one more thing we're exploring, and it's a different kind of fork. We're calling it [Once](https://github.com/tuist/once). I think there's an opportunity to design a build system specifically for coding harnesses, with an API shaped around what harnesses actually do and the language they speak. Not a fork that fights the ecosystem, but one that meets development where it's actually heading. That's the part I'm most excited about, and it's the kind of thing that only makes sense to build in the open.
