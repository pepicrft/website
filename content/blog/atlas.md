+++
title = "Atlas"
date = 2026-05-01T12:00:00+00:00
slug = "atlas"
description = "Why we are building Atlas at Tuist, an internal platform designed to help a very small team operate with the leverage of a much larger one."

[taxonomies]
tags = ["Business", "Tuist", "AI", "Tooling"]
+++
Something is becoming clear as we build [Tuist](https://tuist.dev), and it is that this might be the best moment in history to design a company to be deeply resource-efficient. By resource I don't mean money. I mean people. We are a very small team, and we are constantly thinking about how to use LLMs and agents to optimize the way we work.

Because we are small, we do a bit of everything. Go to market. Marketing. Product. Support. Sales. In traditional companies, each of these is a whole department, sometimes a whole organization. That is a luxury we cannot afford, and honestly, I am not sure we would want it even if we could.

## The multi-tool problem

Like most small companies, our first instinct was to lean on tools for each of those functions. We picked Operate for CRM. We kept some data in GitHub repositories because we believe markdown and configuration files are perfect formats for things that need to live close to code. We do support across community channels and GitHub issues. It is a bit all over the place.

What we keep learning is that we are constantly jumping between tools, and sooner or later we hit a wall. Either we need a feature the tool does not have, or we need to correlate data across tools, which is essentially impossible when the data lives in different silos. We can connect MCPs locally and try to do that correlation ourselves, but we miss the opportunity to automate things. To trigger workflows when something is detected across the various sources. The interesting work is at the intersections, and the intersections are exactly where these tools have the weakest answer.

## What if we built it ourselves

This is when we started asking a different question. What if, instead of stitching ourselves across a multi-tool setup, we built the tool we actually need?

We have coding agents that can write that tool with us. We have a design system that lets us combine building blocks into our own dashboards. We have all the pieces. The economics of building software for yourself have changed in a way I do not think we have fully internalized yet.

I started an internal project at Tuist called **Atlas**. At first I thought we could open source it, but after sitting with the idea for a while, I realized that what we are designing is very specific to the needs we have as a company. Every company has its own shape. That is why companies like Stripe end up building their own internal platforms, and why no two of those platforms look the same, even when they solve overlapping problems.

## What Atlas does first

We are starting with sales and account management.

Traditional CRM tools all look the same, with a bit of AI sprinkled on top. What we want is something that tracks the full picture of what is happening with a customer. Conversations on email. Conversations on Slack. The shared channels we have with companies. The way they are actually using the product.

If Atlas knows which features we just released, and remembers the last conversation we had with a customer, it can do something more useful than reminding us to send a generic "how is it going" message. It can tell us "this might be a good moment to ping this company, and you should bring up this thing because they asked about it three weeks ago." That is the kind of nudge that turns into a real conversation. That is the baseline, and we want to go beyond it.

## Beyond sales

Sales is just the entry point. The same idea applies across everything we do.

Now that we have moved everything to Kubernetes, we have access to Grafana and a constant stream of signals about how our production systems are behaving. What if Atlas was watching that too? Detecting something unusual, doing an initial investigation on its own, then pinging us with the relevant data and the reasoning behind it. Even opening a draft PR with a potential fix for what it found.

These are examples, not a roadmap. The point is that if the data lives in one place, and the tool can act on it, the kind of work that used to require a dedicated team starts to become accessible to a team of four.

## The bet

This is what excites me. It means we can stay extremely agile as a company, which I believe is critical to making an impact when you do not have the resources to spin up a dedicated organization for every domain. If we tried to compete with the big players by replicating their org chart, we would lose. We do not have the runway, and we do not have the patience.

I do not think we are going to scale by hiring an organization for every function. We are going to scale by building Atlas alongside the people we hire, so that whoever joins can bring their judgment to the areas where they can move the needle, while leaning on a platform that takes care of the rest. The platform itself becomes a teammate. One that we keep iterating on as we discover what we actually need.

The traditional shape of a company assumes you cannot build your own internal tools, so you assemble a stack of vendors instead. That assumption is no longer true. The cost of building bespoke has collapsed, and what you get on the other side is a company that fits its tools rather than the other way around.

That is the company we want to build.
