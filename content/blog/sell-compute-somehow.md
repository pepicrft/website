+++
title = "Sell compute somehow"
date = 2026-05-20T12:00:00+00:00
slug = "sell-compute-somehow"
description = "A look at the compute market right now, why every CI and runner company is shipping the same terminal-in-the-browser product, and what we are doing instead at Tuist."

[taxonomies]
tags = ["Tuist", "Business", "Infrastructure", "AI"]
+++
There is a moment in every market where you can almost hear the meetings happening. Not the words, but the panic underneath them. The compute market is in one of those moments right now, and watching it unfold from the seat we have at Tuist is one of the most entertaining things I have done all year.

Compute is, before anything else, a capability. You can run servers on compute. You can run CI on compute. You can run sandboxed environments on compute. The properties you need are different depending on the workload. CI wants dedicated resources, because nothing ruins a build like a noisy neighbor fighting you for CPU, and it wants elasticity, because demand spikes and disappears in the same hour. Agentic workloads want elasticity too, with stricter isolation on top, because the thing running inside the sandbox was written by something that could write anything. Servers want predictability. The plumbing changes from workload to workload. The compute does not.

For a long time the market sat in a comfortable shape. CI companies sold CI. Runner companies sold runners. Cloud providers sold cloud. Everyone had a lane.

Then AI showed up and the lanes evaporated.

## The CI companies became runner companies

The first move was obvious in hindsight. CI companies, especially in the mobile space, started shipping their own runners. “Plug us into GitHub,” they said. Which is a strange sentence when you stop to read it, because they are CI providers, and now they are also runners, and now they are also infrastructure. The product page reads like three companies stapled together.

This is great for the CI companies. They expand their surface area, they capture more of the bill, they show up in more pitch decks. It is less great for the companies that were already in the runner business, because their lane just got crowded. So those companies start to ask the question that founders ask when their market shrinks faster than they planned for.

**We need to sell compute somehow. No?**

## What “somehow” looks like

Here is where you get to see every company’s innovation muscle, and I have to say, I am underwhelmed.

The challenge in this market is not compute. There are data centers everywhere. Anyone with a credit card can rent a machine. There is some operational complexity in keeping those machines running, assigning them, and satisfying elastic demand. That is real work. But it is not magic.

Meanwhile, OpenAI and Anthropic are quietly building their own compute capabilities on AWS and Azure. If the two companies with the most demanding compute needs on the planet are absorbing that operational complexity in house, it is fair to assume that everyone else with serious scale will eventually do the same. The cost of doing that operationally is going down every quarter. The market for selling raw compute to mature companies is smaller than people are pretending it is.

So you would think this would be a moment for creativity. For someone to look at the market and ask a different question than the one everyone else is asking.

Surprise, surprise. They are not asking it.

Building a company in the tech industry is one of the hardest things I have done. You need ideas. You need to know how to sell them. You also need to sell ideas inside your own company. When all three of those muscles atrophy at the same time, you end up with a market full of companies copying each other and presenting the result as a strategy.

## Everyone is shipping the same product

Right now, if you look at the announcements, you will see the same product over and over again. Every compute company, every runner company, every CI company, is shipping their own version of “develop remotely on our thing.” I do not remember exactly who did it first. I think it was something fly.io shipped, with a name I keep almost remembering and then losing. It does not really matter, because three other companies have shipped a near-identical product since then with different names.

The pitch is always the same. You open your terminal in the browser. It is fast. You can do in our environment what you would do in your terminal. We will install Claude for you. It will keep running even if you close your laptop.

That is it. That is the product.

My builder self reads that pitch and wonders what exactly the offer is. A terminal in a browser. Some background persistence. A workflow that survives you closing your laptop, which your actual laptop also does. Every company sitting on idle compute capacity has now arrived at this same idea, and is presenting it as if each instance were a meaningfully different product, and we are supposed to nod along like we are seeing differentiation.

This is the part that I find absurd. Not that they are doing it. They have inventory. They want to sell it. That is understandable. It is the seriousness with which it is being presented as the future of how developers work that gets me.

## Developers do not want to move into your thing

There is a deeper problem with this whole genre of products, and I do not think the companies shipping them have fully internalized it.

Developers do not want to live inside your thing.

It does not matter how nice your terminal is. It does not matter how fast your remote machine is. It does not matter that your sandbox outlives your session and your laptop and your whole career. The moment my development experience depends on the chrome of your product, on the latency of your network, on the box you have decided to put around my workflow, you have lost me. I do not want field constraints. I do not want to be a tenant in someone else’s developer experience. No amount of “you can close your laptop” is going to fix that.

This was true ten years ago and it is still true now. Shopify spent years building a remote development environment, trying to make it feel local, trying to convince developers that there was no cost to working on a machine that lived somewhere else. It is hard work, even with very good engineers spending years on it. And at the end of the day it is fundamentally not what most developers want.

The funny part is that the problem these companies are trying to solve has already been solved, just in the opposite direction. Code harnesses like Codex and Claude Code already let you kick off long-running work that survives you closing your laptop. They did it by inverting the dependency. The harness reaches into compute. Compute does not host the harness. You stay where you are. The work happens somewhere else and finds its way back to you. That is the shape the market actually wanted, and it shipped quietly without anyone needing a terminal in a browser tab.

The wave will pass. The products will be quietly deprecated or repositioned. The companies that survive this cycle will be the ones who figured out how to offer compute as a capability that developers tap into, not as a place they move into.

## What we are doing instead

At Tuist we are bringing compute into the product. We are doing it because it is the only way we can provide the caching speeds that CI workloads need, and because having that compute opens up a set of possibilities that we have been thinking about a lot.

The interesting question for us is not “how do we get developers to do their work inside our environment.” It is “how do we let developers tap into compute to overcome the limits that AI is currently bumping into?” The first framing assumes the developer should change to fit the infrastructure. The second assumes the infrastructure should change to fit the developer. I know which one I would want to use.

We are playing with client-side technologies that plug into this infrastructure, in the same model we have been talking about for a while, where Tuist is the infrastructure layer and your local environment stays yours. There are open source pieces we want to build. There are integrations we want to ship. None of them involve you doing your work inside a browser tab and being told this is the future.

I do not know exactly how the compute wars play out. I suspect a lot of these terminal-in-the-browser products are going to age poorly. I suspect the companies shipping them know this, and I suspect they are shipping anyway because they have to ship something. That is fine. It is funny, but it is fine.

We are going to keep building the thing developers actually want, which is compute that respects where they already are.
