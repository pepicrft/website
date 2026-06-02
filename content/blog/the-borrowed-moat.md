+++
title = "The borrowed moat"
date = 2026-06-02T12:00:00+00:00
slug = "the-borrowed-moat"
description = "Why renting your cost advantage from the same clouds you compete with leaves you exposed, the difference between a platform and a catalog, and why at Tuist compute is a complement to the cache, not a product."

[taxonomies]
tags = ["Tuist", "Business", "Infrastructure", "AI"]
+++

A friend pointed me at a post last week, [the broken economics of databases](https://www.bitsxpages.com/p/the-broken-economics-of-databases), and it gave me words for something I had been circling for months. It is about why database companies report gross margins that look spectacular on paper, 80 or 90 percent, and still almost never become the wildly profitable businesses those numbers promise.

I do not run a database company. I kept reading anyway, because the mechanism it describes is the same one quietly shaping the compute market I work in.

I will not flatten the whole argument here, but there is one part I cannot put down.

Somewhere between a monopoly that sets its own price and a commodity market that sets the price for you, every company sits on a point along a spectrum, whether they admit it or not. The margin itself is not the interesting question. Whether you get to keep it is. And two things decide that, both lifted from older economics. How hard your thing is to copy. And who owns the things you need in order to sell it.

Databases are weak on both. The code diffuses. The usual protections, closed source and licenses and operational know-how, have a short half-life, and a shrinking one now that an agent can reimplement in an afternoon what used to take a quarter. And the asset that actually runs the database, the hardware, belongs to the hyperscalers the database company rents from. So the cloud provider selling you the machine is in a better position to win a price war than you are.

You are paying rent to your own competitor.

That is the line I keep coming back to, and it is not really about databases.

## Everyone is renting their moat

Look at compute right now. CI, runners, sandboxes, agent environments. Almost everyone selling compute is renting it from the same three clouds they compete with. The cost advantage in their decks is borrowed, and a borrowed cost advantage gets competed away the moment a close substitute appears, which in this market is always.

There is one move that looks like the clever way out, and it is a good one. Go down to the metal. Own the machines, drop the rent. I have real respect for the teams doing it, and I think they are right that it is the only honest path to certain economics.

But the analysis usually stops a step too early.

Owning the hardware buys you a cost moat. It does not buy you a demand moat. It protects your margin on the customers you already have, and does nothing to win you the next one. You can have the best unit economics in the market and still lose to a louder company renting machines by the hour, because what wins developers was never the price of the box. Money that goes into racks instead of into being known is a bet that this market pays the cheapest provider. It does not. It pays the one people reach for.

## The tell is the product everyone is shipping

When you cannot differentiate on the substrate, you bolt on surface area. The database post names this directly: once features stop setting you apart, the work shifts from making the product better to keeping it from becoming a commodity. The product stops improving for the user and starts defending the vendor. Same tell, different market.

In compute the symptom is hard to miss. Everyone sitting on idle capacity has shipped the same thing. Develop remotely in our environment. Open a terminal in the browser. We will keep it running after you close your laptop. We will install the agent for you.

I have said this before and I will keep being a bore about it. Developers do not want to live inside your thing. The best known company in this space spent years trying to make a remote environment feel local, then rebranded and left the category for agents. Everyone relearns this and ships the product anyway, because the lesson is inconvenient when you have machines sitting idle.

## Two ways to get bigger

The darkest and most useful part of the database post is the bit about how companies fight commoditization by piling on complexity, and how the product gets worse as a result. But there are two ways to pile on, and the difference is everything.

One fans out around a single customer and ties itself together. Auth, storage, functions, all running through the same schema, so leaving means untangling a knot. It can look noisy from outside, but the knot is real. That is a platform.

The other fans out across customers who never overlap. You sell CI to one buyer, sandboxes to another, raw compute to a third, and none of it connects. You pay for all the sprawl, the lost focus and the muddy positioning, and you get none of the lock-in. That is a catalog.

The market already showed us how this ends. The sharpest, most focused serverless database company of the last few years did not win on its own. It got [bought by the integrator](https://www.databricks.com/company/newsroom/press-releases/databricks-agrees-acquire-neon-help-developers-deliver-ai-systems), the company everyone holds up as having actually built lock-in, for about a billion dollars. The value did not land on the elegant primitive. It landed on the platform that owned the customer, and the platform bought the primitive. If you build primitives for a living, that should bother you a little.

## What we are doing instead

At Tuist we are bringing compute into the product. I want to be precise about why, because that is where most of these stories go wrong.

Compute, for us, is a complement. Not a product. The cache is the thing. A cache is useless if the bytes live far from where you build, so we put the compute next to the cache. The compute makes the cache fast, and the cache makes the compute worth using for the workloads we care about. That is the concentric kind of expansion. It deepens the one thing we are hard to copy on instead of stretching us across customers who were never the same person.

And the hard part is not the cache itself. Everyone has a cache. It is the depth you need to be correct inside a hostile, undocumented ecosystem, and the data, because every build and every test run we see makes the next decision better, and there is no way to shortcut that with a funding round or a clever weekend.

The same depth is also why we can do the work instead of handing it back to you. We go deep into each ecosystem and each tool, far enough to tune the setup ourselves, so you do not have to learn the internals to get a fast build. Most tools in this space, even the good ones, give you a pile of knobs and wish you luck. We would rather you never see the knobs.

Open source is how we reach people, and it is also the part worth owning. The interface is the asset. We open the layer that tools talk to, and we keep the running of it. Own the standard, host the hard part. None of it asks you to move into a browser tab and call it the future. You stay where you are. Compute is something you reach into, not a place you move into.

So I still avoid the word moat. Most of them are borrowed, or made up, or both. What I trust is harder to put on a slide. A core that is genuinely hard to copy and that we keep making harder. A complement we own only because it protects that core. And people who are here for where this is going, not only for what exists today.

Sometimes you capture less value than you could have. That has always been a trade I am happy to make.
