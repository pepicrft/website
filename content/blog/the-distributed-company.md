+++
title = "The distributed company"
date = 2026-06-04T08:00:00+00:00
slug = "the-distributed-company"
description = "A company stitched together from SaaS tools ends up with a fragmented understanding of itself. Agents make that tax impossible to ignore, and make it worth building the graph of the company yourself."

[taxonomies]
tags = ["Business", "Tuist", "AI", "Tooling"]
+++
I can't stop thinking lately about where the data of a company lives, and what that does to our ability to make decisions. It has been on my mind because we keep leaning more on agents at [Tuist](https://tuist.dev), both to make decisions and to understand the state of the system. And by system I mean the organization itself.

The friction shows up fast. The first problem is that a lot of your data lives in silos you do not control, behind APIs you do not own. The second is that the data has dependencies, and those dependencies are scattered across several places.

A simple example. You have a customer in your CRM. Somewhere else, maybe the same place, maybe not, you store the documents related to that customer. There is a relationship between the two, and very often that relationship is implicit. Nobody wrote it down. It lives in someone's head. For a human bouncing between tabs, that is mildly annoying. For an agent trying to reason about the account, it is a wall.

## This is microservices again

The more I sat with this, the more familiar it felt. It is the microservices story all over again.

Someone, at some point, decided to distribute business logic across services to optimize for the independence of teams, and in doing so introduced a brand new problem: the network between them. The [fallacies of distributed computing](https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing) are basically a catalog of all the ways that decision comes back to bite you.

We did the same thing to the company, except the services are SaaS tools and the network is the tangle of APIs, exports, and copy-paste between them. We distributed a problem. And the problem we distributed is a big one: how to understand your own organization and operate it.

There is a name for the underlying force. [Conway's Law](https://en.wikipedia.org/wiki/Conway%27s_law) says that organizations design systems that mirror their communication structure. A company stitched together from a dozen vendors ends up with an understanding of itself that is just as fragmented as the tools. The org chart leaks into the data model, and then the data model leaks back into the org chart. You hire people to sit at the seams.

## Why we did it anyway

It made sense at the time. Building and maintaining internal tools was expensive, so you rented opinions from vendors instead. Each tool came with its own model of how that slice of work should happen, and you bent the company around it. That was a reasonable trade when the alternative was unaffordable.

But the trade was never free. You gave away control. You accepted that the most interesting questions, the ones that live at the intersection of two or three tools, would be the hardest ones to answer. And once nothing is forcing you to keep paying that tax, it stops making sense to keep the silos standing.

## The company as a graph

Here is the mental model I keep coming back to. Your organization is a [graph](https://en.wikipedia.org/wiki/Knowledge_graph). Customers, conversations, documents, deploys, incidents, invoices, all of it, connected. The easier it is to gather that information into one place, and the better the connections between the nodes, the easier it is to understand the company at any level you care to zoom into.

This is what we started building with Atlas, which I have [written about before](https://pepicrft.me/blog/atlas/). The more data we bring in, the more satisfying it gets. Things that used to be rows in someone else's database become real relationships, with foreign keys, that an agent can traverse to answer a question about any corner of the organization. There is something quietly beautiful about watching that come together.

## Language as the interface

The other shift is in how we touch all of this. We are wiring the interfaces to MCPs and to Slack, so we do not have to think in workflows anymore. No "click here, open this menu, run that command." It collapses down to a conversation.

Tobi Lütke has talked about this at [Shopify](https://shopify.com), about making language the primary interface to how a company operates, and I think there is something genuinely brilliant in it. Forms and menus and dashboards are affordances we built because there was no better way to talk to software. There is now. I was listening to a talk by Peter Steinberger this morning about rethinking the way we work around agents, and it all clicked into the same picture.

## Why this is worth it

The skeptical take is that this is not worth the investment, that people should just learn the tools and get on with it. I understand the instinct. But organizational efficiency is not a nice-to-have. If you do not understand what is happening across the different domains of your company, it gets harder and harder to evolve it. You compensate by adding departments and people whose job is to hold the complexity in their heads, complexity that emerged purely from depending on a pile of disconnected tools.

For us the decision was easy, because we had already paid for the hard parts. Observability infrastructure. Infrastructure to deploy and scale compute. A design system that makes building a decent UI almost free. With the cost of coding agents collapsing on top of that, building the thing ourselves was the obvious move, and it is already paying off. Right now I am pointing the same approach at go-to-market, trying to read the dynamics of the market and how we position ourselves in it.

## What we will and will not open source

Someone asked the other day whether we would open source this. For the operations side, the answer is no, and the reason is a principle, not secrecy. Every company is different, and different in ways that depend on the market it operates in. I think every company should build its own operations tool, and the way you do that is by first answering how you actually want to operate. Atlas is the reflection of how we answered that question for Tuist. A generic version, some common denominator that works for everyone, would by definition know nothing about our business.

What we will open source is everything underneath. The pieces that make it possible are already open: the design system, the Elixir framework we use to build these agent workflows. And we want to open a space around how we shape, execute, and deploy product and systems, where people can participate and see how we actually operate. We would love for this to become an open space others can take and run inside their own organizations.

Because in the end the point is not the tool. The point is to stop running a company you accidentally distributed, and start running one you can actually see.
