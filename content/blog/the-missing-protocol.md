+++
title = "The missing protocol"
date = 2026-06-04T12:00:00+00:00
slug = "the-missing-protocol"
description = "Caching and remote execution are welded to whoever runs your CI. We need a narrow waist—a common contract for build caching and remote execution that any provider can implement."

[taxonomies]
tags = ["Tuist", "Developer tooling", "Ideas"]
+++
There is a pull in our industry toward monorepos. It is not fashion. When you keep all the context in one place, that context becomes accessible, and accessible context is the whole game now. Meta and Google arrived here years ago, and at their scale it was always going to happen. What changed is the timing. Agents pulled it forward. The moment some of your collaborators are coding agents, having everything close and legible stops being a nice-to-have and starts deciding whether they can do anything useful at all.

And the second you lean into it, the technology underneath starts to show its limits.

## Moving what you will never touch

Cloning, pulling, and pushing things you are never going to interact with is a waste of network, of bandwidth, of time. For a person it is mildly annoying. For an agent running in a tight loop it is a tax it pays over and over.

To stop paying it, you need to understand how the pieces depend on each other. You need a dependency graph.

That graph is not only about deciding what to clone. The same graph tells you when something needs to be compiled, when something needs to be tested, and when something needs to be deployed. It is the structure that lets you be selective instead of running everything every time. I do not know the right model yet for making the pieces aware of each other through that graph, but the shape of the opportunity is clear, and it is the same shape whether you are deciding what to fetch or what to rebuild.

## The expensive ideal

The ideal version of this is well understood. You become Google, or you become Meta, and you invest heavily in a build system where every dependency across the monorepo is declared explicitly. It is a beautiful end state. It is also brutally ambitious and costly for a small company.

The tools exist. Bazel and Nix are not as far out of reach as they once were. People talk about Nix as this pure functional package manager that lives just past the horizon, and a few years ago that was a fair description. Today it is closer than it was, and coding agents have lowered the human cost of getting introduced to the concepts. But closer is not free. These systems still ask for a real investment of thinking, familiarization, tinkering, and play before they pay you back. That investment is not something I want to wave away or take for granted.

## Innovation welded to whoever runs your CI

Here is the part I keep circling. Almost every meaningful step forward in the optimization space, caching and remote execution in particular, is coupled to CI, or coupled to whoever provides the environment that CI runs in.

I understand why. You have to sell the service. But we are buying that business model at the price of a badly broken developer experience. A clean client interface that your competitors can also plug into does not sound fun if you are the provider, and I get that. The trouble is that the alternative produces lock-in for the buyer and fragmentation for everyone else. We end up with islands of optimization that do not talk to each other, each one coupled to the place it was born.

## A narrow waist for caching and remote execution

What I would like is for caching and remote execution to be accessible to anyone, in the same boring, dependable way TCP/IP lets any protocol move packets around. A narrow waist. A common contract that everything above can target and everything below can implement, so the layers stop having to know about each other.

Imagine that protocol did not exist for packets. Imagine every application negotiating its own delivery against whatever vendor it happened to be on. That is more or less where we are with build caching and remote execution today. The protocol is missing. I think it is badly needed, and I think it is buildable.

## Incremental on purpose

I am not asking anyone to go from zero to Google in one move. I keep coming back to incremental steps, in two senses. You should not need a complete, complex system before you get any value. And the first real step is small: being selective about what runs, with the ability to say where it should run.

There is a huge gap between where most teams are today and where they would like to be, which is something closer to a compute engine that validates their work on demand. That gap does not have to be crossed in a single jump. It closes gradually, one selective decision at a time.

## Where this fits

I am drawing on the design principles I have been advocating for since I came across them: reproducibility, content addressing, a functional purity about inputs and outputs. The point is a thin layer on top of those ideas rather than another monolith.

It works with any provider, Tuist included. It does not care what language you write your code in. If it works the way I want it to, you will be able to make your work selective, break the ceiling on local compute, and run things remotely in a transparent way. Transparent in a specific sense: the agents do not need to know anything about the underlying capabilities that make it possible. The machinery stays out of the way, and the feedback just gets faster and cleaner.

I am starting from the most incremental steps people can take today. The plans behind this go much further than that first step suggests, and I would rather earn the bigger version than announce it.
