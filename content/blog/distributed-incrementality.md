+++
title = "Distributed incrementality"
date = 2026-07-03T09:00:00+00:00
slug = "distributed-incrementality"
description = "Why productivity infrastructure suddenly matters for everyone, not just the giants. Local incrementality no longer holds once coding harnesses spin up parallel worktrees, and build systems need a redesign around distributed incrementality."

[taxonomies]
tags = ["Tooling", "AI", "Tuist", "Infrastructure"]
+++
I've been trying to build a mental model around what is different today in build toolchains versus a few years ago, and why productivity infrastructure suddenly has a role to play for everyone, not just the giants. I think the answer sits in one word: incrementality.

When you develop locally, incrementality is everywhere, even if you never think about it. On the build side, the compiler or the bundler keeps a cache and only processes what changed since the last run. On the test side, the incrementality is you. You know which code you touched, so you run the tests around that area and skip the rest. The build system brings the incrementality for builds, and the developer brings it for tests.

And this has worked fine for a long time, at least for small and medium companies. Whenever they wanted a productivity boost, they could get away without rethinking anything. Luckily, honestly.

## CI is where incrementality dies

The moment your work leaves your machine, incrementality is gone. CI clones a cold directory, compiles everything from scratch, and runs the whole test suite because it has no idea what you know. The caches that made your local loop fast don't exist there, and the developer's intuition about what to test doesn't travel either.

I like to think of what's missing as distributed incrementality. The incrementality we take for granted locally, but shared across environments.

We've had systems that achieve this for a long time. Bazel is the obvious one. But it was really a thing only big companies adopted, because the cost of getting there is enormous. Everyone else approximated it in one of two ways: building bespoke internal tools, or throwing money and compute at the problem. More cores, faster cores, buy yourself some time.

## Coding harnesses broke the assumption

This is the part that changed. With coding harnesses, the need for distributed incrementality stopped being a big-company problem.

Think about worktrees. You spin up two or three of them so agents can work in parallel. From the perspective of most build systems, those worktrees are two or three different projects. Different directories, different caches, no shared state. So you end up compiling the whole thing from scratch, several times, on the same machine, for the same project.

The problem is no longer distributed across environments. The distribution is happening locally, on your own laptop. And this is where the flaws in the design of the build systems we use today start to show. They were built on assumptions that no longer hold: one project, one directory, one cache.

## After selection, sharding

There's a second layer to this. Selectiveness tells you what to build or test based on what changed, but even after selection you often want to go faster. This is where sharding comes in.

Sharding has traditionally been a testing thing. You have a suite with thousands of tests, you're limited by the number and speed of your cores, so you split the suite into shards and run them in parallel elsewhere. For building, we're starting to see the same shape of problem. If you're running expensive compilations locally, or four of them at once driven by coding harnesses, you're bounded by the cores your machine has. Past a point, things don't just stop getting faster. They get slower.

I don't know if sharding is the right name for it. When I hear sharding I think of packets. What I mean is closer to distributed compute: an approach to automation where the work can be spread out beyond the machine that initiated it. I believe these are going to be indispensable tools in the near future, and I also believe it will take us some time to get there.

## Redesigning from the ground up

To support this, build systems will probably need to be redesigned from the ground up. The assumptions to shed are the ones I mentioned: one project, one directory, one cache. What replaces them is content-addressable actions that can be looked up from a global cache and reused across worktrees and environments. On top of that, smarter execution of the build graph, so action results can be prefetched before they're needed. And for any of this to hold together, hashes need to be stable and actions hermetic.

This is something we talk about a lot with our users at Tuist. You need two things for a cache to be effective. On one side, the build system has to support it: every action cacheable, every hash deterministic. On the other side, you need the infrastructure that makes it possible. We're focusing on the infrastructure part, and plugging into the build systems people already use, like Bazel, Gradle, and Xcode.

We'd also like to keep contributing to the ecosystem so the build systems people depend on grow these capabilities natively, sooner or later. The world wasn't prepared for these distributed needs, locally or across environments, for builds or tests or any operation really. But the need is only going to become more present. We're building towards that future, because we believe it's going to be a reality sooner or later.
