+++
title = "Caching, productized"
date = 2026-05-05T12:00:00+00:00
slug = "caching-productized"
description = "Build caching is becoming an everyone problem. Here is how we think about productizing it at Tuist for indie developers and small teams, not just enterprises."

[taxonomies]
tags = ["Business", "Tuist", "AI", "Tooling", "Caching"]
+++
Build caching has never been something sexy for medium companies or indie developers. Adopting it usually meant replacing your build system with [Bazel](https://bazel.build) or something close to it, and that came with a migration cost most teams could not afford to take on. The companies that did it were the ones with the budget and the engineering bandwidth. Large enterprises, almost without exception.

The infrastructure companies that emerged around caching read the room. They built for those enterprises. Contact sales. Book a demo. Long onboardings where the goal was not really to automate anything, but to get you on a call. The product, in the end, was the call.

We think that era is ending.

## What changes when you have agents on the same machine

Picture working on a project with multiple coding agents, each on its own [git worktree](https://git-scm.com/docs/git-worktree), each running its own builds. It does not matter how fast your laptop is. There is a limited number of cores, and several agents are about to fight for them, compiling the same things in parallel. Your machine becomes unusable, and a non-trivial amount of compute gets burned redoing work that was already done somewhere else, by someone else, ten minutes ago.

The need to optimize for caching, which used to live in the realm of large monorepos, is now showing up on every developer's laptop. If you are a small team and you want your agentic setup to be fast, you need the same kind of infrastructure that until recently was only justifiable at scale. You want your CI to share work with your local machine. You want the agent in container A to share work with the agent in container B.

This is the shift. Caching is becoming an everyone problem.

## The Supabase shape

The thing we have to do at [Tuist](https://tuist.dev) is productize this. And not just for the large enterprises. For indie developers and small teams too.

A good frame for what that looks like is [Supabase](https://supabase.com) and [Vercel](https://vercel.com). It is not that we did not have hosted databases before they showed up. It is that they made it easy. They wrapped the operational layer in an API, added the conveniences developers actually need, and then once the new wave of platforms like [Lovable](https://lovable.dev) and [Replit](https://replit.com) needed somewhere to keep state, Supabase was the obvious answer. You sign up, you create a project, you wire up auth, and you are done.

That is the bar we want for caching at Tuist. Sign up, create a project, authenticate locally, and have your build system pulling cached artifacts within minutes. Convenient for the user, convenient for the agent.

Convenient for the agent is the part most companies still miss. If a user can do something, an agent should be able to do the same thing through a clean interface. That means investing in APIs. It means investing in [MCPs](https://modelcontextprotocol.io). It means making sure that every action a developer takes to set up caching, whether that is connecting it to Bazel, Xcode, or any other build system, can also be taken by an agent walking them through it. It also means showing up where the agents do, on every LLM marketplace possible, so that when somebody tells the agent "this is slow," the conversation can drift naturally toward setting up Tuist. Zero to using a cache in a few prompts.

There is one more design constraint underneath all of this that is easy to miss. Caching cannot be fast only in one environment. It has to be fast wherever the build is happening. Your laptop, your CI, your agent's container, your colleague's machine on a flaky hotel WiFi. That is what we are building, on both the infrastructure side and the application side. A system that productizes caching beyond a single build system, with the cache as a primitive that can serve whatever action is happening, wherever it is happening.

## What agents do to Bazel

Bazel is still the most sophisticated toolchain out there for setting up caching in an existing project. The reason it never quite worked in places like the Apple ecosystem is that the IDE was not designed for a different build system. Xcode wanted to be both the editor and the build system, and Bazel asked you to give that up.

That tension is dissolving. People depend less and less on integrated IDEs. If your day-to-day driver is [Claude Code](https://claude.com/claude-code) or [Codex](https://openai.com/codex), the build system underneath becomes an implementation detail. As long as it is fast, reliable, and the agent can iterate on it, the rest does not really matter.

The other side is that agents are very good at writing [Starlark](https://bazel.build/rules/language). The cost of writing Bazel files for your iOS app, your Android app, your Rust server, your desktop app, all of that is being pushed down. We will probably see more Bazel adoption, more plugins, hopefully more contributions to make Bazel itself better. We are new to it, and we are building a real appetite for learning, putting resources behind it, and supporting the community along the way.

## Where we land

When the two ends of this meet, agents lowering the cost of authoring the build system on one side, and Tuist productizing the infrastructure on the other, the result is that caching stops being an enterprise-only conversation. The infrastructure that makes everything fast, not at the compute level but at the level of what is actually happening inside the compute, is something we want to make available to anyone. Indie developers. Two-person startups. Mid-size teams. Whoever needs it.

We also think we are going to see agents start paying for things on behalf of their users. Stripe is investing into the protocol piece of that, and that future is coming whether the rest of the industry is ready for it or not. We want to be ready for it.

The contact-sales model is not where this is going to live. We do not love the word democratize as a concept, but you get it. If caching is going to be a theme for the next few years, anyone should be able to make their agentic setup faster without going through a six-month enterprise procurement cycle.

We are putting the pieces in to make that real.
