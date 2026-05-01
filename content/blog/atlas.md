+++
title = "Atlas"
date = 2026-05-01T12:00:00+00:00
slug = "atlas"
description = "Why we are building Atlas at Tuist, an internal platform designed to help a very small team operate with the leverage of a much larger one."

[taxonomies]
tags = ["Business", "Tuist", "AI", "Tooling"]
+++
Something is becoming clear as we build [Tuist](https://tuist.dev): this might be the best moment in history to design a company to be deeply resource-efficient.

By resource I do not mean money. I mean people.

We are a very small team, and we spend a lot of time thinking about how to use LLMs and agents to amplify the way we work.

Because we are small, we do a bit of everything. Go to market. Marketing. Product. Support. Sales.

In a traditional company, each of these is a department, sometimes an entire organization. That is a luxury we cannot afford. Honestly, I am not sure we would want it even if we could.

## The multi-tool problem

Like most small companies, our first instinct was to lean on a different tool for every function.

We picked Operate for CRM. We kept some data in GitHub repositories because we believe markdown and configuration files are perfect formats for things that need to live close to code. We do support across community channels and GitHub issues.

It works, until it does not.

We keep learning the same lesson. We are constantly jumping between tools, and sooner or later we hit a wall. Either we need a feature the tool does not have, or we need to correlate data across tools, which is almost impossible when the data lives in separate silos.

We can connect MCPs locally and do some of that correlation ourselves, but that still misses the most interesting part. Automation. Triggering workflows when something is detected across the various sources. Acting on signals instead of just observing them.

The useful work is at the intersections. The problem is that the intersections are exactly where these tools have the weakest answer.

## What if we built it ourselves

That led us to a different question: what if, instead of forcing ourselves through a multi-tool setup, we built the tool we actually need?

We have coding agents that can write that tool with us. We have a design system that lets us compose our own dashboards and workflows. We already have most of the pieces.

The economics of building software for yourself have changed in a way I do not think we have fully internalized yet.

At Tuist, I started an internal project called **Atlas**.

At first I thought we could open source it. But after sitting with the idea for a while, I realized that what we are designing is too shaped by the way we work as a company. Every company has its own contours. This is why companies like Stripe end up building internal platforms that look nothing like each other even when they solve overlapping problems.

## What Atlas does first

We are starting with sales and account management.

Traditional CRM tools all look roughly the same, now with a bit of AI sprinkled on top. What we want is something that tracks the full picture of what is happening with a customer. Email conversations. Slack conversations. Shared channels with companies. The way they are actually using the product.

If Atlas knows which features we just released, and remembers the last conversation we had with a customer, it can do something much more useful than reminding us to send a generic "how is it going" message.

It can tell us: this might be a good moment to reach out to this company, and you should mention this feature because they asked about it three weeks ago.

That is the kind of nudge that turns into a real conversation. That is the baseline. We want to go beyond it.

## Beyond sales

Sales is just the entry point. The same idea applies across everything we do.

Now that we have moved everything to Kubernetes, we have access to Grafana and a constant stream of signals about how our production systems are behaving.

What if Atlas watched that too?

It could detect something unusual, do an initial investigation on its own, and then ping us with the relevant data and the reasoning behind it. It could even open a draft PR with a potential fix for what it found.

These are examples, not a roadmap.

The point is that once the data lives in one place, and the tool can act on it, the kind of work that used to require a dedicated team starts to become accessible to a team of four.

## The bet

This is what excites me.

It means we can stay extremely agile as a company, which I believe is critical if you do not have the resources to spin up a dedicated organization for every domain. If we tried to compete with bigger players by replicating their org chart, we would lose. We do not have the runway, and we do not have the patience.

I do not think we are going to scale by hiring an organization for every function. We are going to scale by building Atlas alongside the people we hire, so that whoever joins can bring their judgment to the areas where they can move the needle, while leaning on a platform that takes care of the rest.

The platform becomes a teammate. One that we keep iterating on as we learn what we actually need.

The traditional shape of a company assumes you cannot build your own internal tools, so you assemble a stack of vendors instead. That assumption is no longer true.

The cost of building bespoke has collapsed, and what you get on the other side is a company that fits its tools rather than the other way around.

That is the company we want to build.
