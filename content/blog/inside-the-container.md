+++
title = "Inside the container"
date = 2026-06-12T12:00:00+00:00
slug = "inside-the-container"
description = "Selectiveness is the real theme underneath monorepos and the agentic world: a graph of domains and tasks that tells your compute what to actually do."

[taxonomies]
tags = ["Monorepos", "Agents", "Tuist"]
+++
There’s a word that sits underneath everything interesting happening with monorepos right now: selectiveness.

Monorepos used to be a thing you reached for at scale. The Meta and Google story. Something you adopted once the pain of many repositories got bad enough. That framing is changing. Companies are realizing the monorepo is just the way to go, and the reason is no longer only about scale. It’s about agents. When you give a coding harness access to the whole thing, across every domain of the software, the context it can reason over is the context that lives in one place. Shopify is in the middle of a massive effort to move everything into a monorepo. We did the same at [Tuist](https://tuist.dev). I think more and more projects are going to follow, because the value of having one graph to point an agent at is hard to overstate.

The problem is that the monorepo breaks one of Git’s oldest assumptions.

## Cloning everything stops working

The whole idea of Git is that you clone the repository and you have it. All of it. That model falls apart the moment the repository holds every domain of a business. You can’t clone everything anymore, and you don’t want to. You want to be selective about what you materialize.

This is the first place the theme shows up. There’s going to be a stretch of years where we figure out how to make version control selective, whether that’s an extension on top of Git, the primitives Git already gives us, or something built for this from scratch. If I understood the Spotify direction right, they’re heading toward repositories that are warm and ready, something close to a stateful machine that has the codebase loaded and waiting to execute against it, rather than a cold clone every time. That’s a different shape of version control than the one we’ve lived with for twenty years, and it’s why you see so many people trying to push Git past its limits to prepare it for the agentic world.

But selectiveness is bigger than version control. That’s the part I find more interesting.

## Selectiveness is the real theme

Look at coding harnesses today. You change a source file, or you change a single test, and what should happen? Most agents don’t run the whole suite, because it’s slow, and even when they do run it, it’s slow. And that slowness defeats the entire point. The reason you reach for agents is fast inference and fast iteration. If every change drags the full toolchain behind it, you’ve thrown away the thing that made the agent worth using.

So the question becomes: when something changes, what is the minimum set of things you need to do? If I touch this file, which tests actually need to run? Which targets are impacted? What can I safely skip?

You can’t answer that without a model of how everything relates.

## A language for the graph

What I think we need is some kind of language to declare a graph of all the domains of an application and how they relate, and the same for the automation tasks that hang off them. If I change this thing, what is impacted. And if I change this thing, can you run the things that are impacted by the change. Those two questions are the whole game.

None of this is new to Google and Meta. They already built languages for exactly this. [Bazel](https://bazel.build/) and Buck are, at bottom, ways to declare that graph: these are the inputs, these are the outputs, this is what depends on what. Shopify is coming at it from a different door, starting from environment reproducibility with Nix, and from what I understand they’d like to extend that foundation so it also describes the automation, not just the environment. I honestly don’t know what the shape of that is going to be. I have mixed feelings, and there are a lot of creative, smart people there, so I assume there’s something I’m not seeing yet. You can probably push Bazel and the others toward reproducibility from their side too. Either way, these tools are going to become indispensable.

The catch is that they were designed for a world where humans wrote and maintained those files by hand. That’s worth saying out loud. The ergonomics, the verbosity, the learning curve, all of it assumes a person sitting there tending the build graph. And the thing about indispensable tools that are also hard to adopt is that most teams never adopt them.

So there are two problems sitting next to each other. One is making these graphs approachable enough that more companies can actually pick them up. The other is making them legible to agents, so an agent can interface with the graph without first having to learn an entire build system. I don’t think this is only a build system concern, either. Sure, there will be graphs that belong to a build system, like the one that builds a modular iOS or Android app. But there will also be graphs for tasks that have nothing to do with compilation, a linting task here, a deploy step there, an arbitrary job the system needs to run. You see where this is heading. It’s a graph of domains and a graph of work, and the value is in being able to ask it questions.

## Inside the container

Here is the mental model I find most useful.

On one side you have the container. You can make it faster. Faster machines, your own data center, or rented out to some cloud. There’s a real market there, and it’s worth keeping an eye on. But it’s also a market that fills up fast, with players as large as Cloudflare, and competing on raw compute against them is close to impossible. Everyone is selling the same thing, which is understandable, and also a reason not to plant your flag there.

The more interesting side is what’s inside the container. Once the box is running, what is it doing, and how much of that work is wasted? This is exactly where the graph comes in. If you know what’s impacted by a change, you stop rebuilding and re-testing the world on every iteration. You make the inside of the container smart instead of just making the container fast.

That’s the part I’ve been tinkering with. I started from Buck and Bazel as reference points, less to adopt them and more to understand where they fall short when an agent is the one driving, and where we could lean on what agents are good at to get further than those tools get today. It’s early, and it’s the kind of exploration that’s hard to schedule, but it’s genuinely exciting to poke at.

## Closing the loop

Once you have something like this in place, it bridges beautifully with the compute and the caching we already provide. We’ve built infrastructure to run things in controlled environments and to keep caching co-located and distributed beyond any single one of them. The graph is the missing piece that tells that infrastructure what to actually do.

The role I think Tuist can play sits right in the modules the frontier labs are focused on, the close-the-loop part of the work, and we’d like to solve close-the-loop fast. From there the surface opens up. Once you have a language to describe domains and tasks and what depends on what, you start to wonder what the role of CI pipelines even is anymore. You already have the language to describe that work. The pipeline was just a static, hand-written approximation of the graph you now have for real.

I don’t have a finished thing to point at yet. But the pieces are lining up: the monorepo as the substrate, selectiveness as the constraint, the graph as the answer, and the compute and cache underneath it ready to execute. It’s very early, and it’s a lot of fun.
