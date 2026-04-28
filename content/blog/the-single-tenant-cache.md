+++
title = "The single-tenant cache"
date = 2026-04-28T10:00:00+00:00
slug = "the-single-tenant-cache"
description = "Why we moved our caching layer from multi-tenant to single-tenant, what that mental model unlocks for latency and operations, and how we're shaping the cache as a leaderless network of nodes that lives close to wherever you happen to be building."

[taxonomies]
tags = ["Tuist", "Infrastructure", "Cache", "Building"]
+++
A few weeks ago I [wrote about caching as the new infrastructure](https://pepicrft.me/blog/the-cache-is-the-infrastructure/). The argument was that as build systems get smarter and coding agents start running everywhere, the bottleneck stops being CPU and starts being how close your cache is to whatever is doing the work. Compute can be anywhere. The cache has to be near.

Since then we have been building. And the way we have been building has shifted in ways I want to share, because the shape of the system is telling us something interesting about where this is going.

## The problem, restated

Developers want caching. Agents want caching even more. Inference is fast, and getting faster, but compilation is not. You can have an agent writing code at a speed that would have been unthinkable two years ago, and then watch it sit there waiting for the build to finish. Compute is expensive. Re-doing work that has already been done is the kind of waste that stings even more when an agent is the one paying the time tax.

The way out is the network. You lean on low-latency caching to give you near-uncapped access to pre-compiled results, and you skip the work entirely. We have known this since the beginning at Tuist. It is what our project generation cache has done for years for Xcode. It is what we are bringing to Gradle now, and Bazel later this year.

But once you go down that road, one thing becomes very clear: low latency is everything. If the cache is slow, the math stops working. The cost of fetching from the cache approaches the cost of just compiling, and at that point why bother.

## Latency is not just one number

The harder part is that low latency cannot live in only one environment.

If your caching servers run in our infrastructure and your CI happens to run near them, things feel fast. If your build runs somewhere else, like a developer's laptop in Buenos Aires or an agentic environment that spun up in some random region, things do not feel fast at all. That always felt wrong to us, especially now that the picture is more fluid than ever. Agents have their own runtimes. CI providers have theirs. Local machines are still part of the story. None of these are guaranteed to be in the same region, or even on the same continent.

We knew we had to build for that. So we did, and we built it as a multi-tenant system from the start, because that is what we were familiar with. And that is where we made some serious mistakes.

## What multi-tenant taught us

We left almost every resource unbounded. Network access, connection pools, database connections, file descriptors, file system. The system would crack at the seams very quickly. One tenant doing something demanding would degrade everyone else. Classic noisy neighbors.

It became obvious, after running into this enough times, that we were not going to scale a multi-tenant caching system unless we were Cloudflare. We are not Cloudflare. The kind of investment required to do that well is the kind that defines a company, and that is not the company we want to define ourselves as.

So we asked the obvious question: what if we went single-tenant?

## What single-tenant looks like

Single-tenant means each tenant gets their own caching instances, in the regions they care about. The mental model is the same one [Supabase](https://supabase.com) uses for Postgres, or [PlanetScale](https://planetscale.com) used for MySQL. You pick where your database lives. You pick where your replicas live. Same idea, applied to caching nodes. Want one in Frankfurt and one in Sydney? Done. Want one near the GitHub Actions region your CI runs in, and another near the Codex environment your agents spin up in? That works too.

The cost we knew we would pay is operational. We have to manage the deployment and the updates of those caching nodes per tenant. Not the whole stack, just the caching part. That is real work. But the alternative was a system that would never scale without us turning into an infrastructure company, and we already have a clear sense of what kind of company we want to be.

To make this work, two things had to be true.

The first is that the infrastructure had to be simple to operate. I know it sounds odd to say this and then mention that we ended up with [Kubernetes](https://kubernetes.io), which is many things but not famously simple. The trick is that we have coding agents now. The pieces of infrastructure that used to require a dedicated team to operate are becoming far more accessible when an agent can read the manifests, reason about them, and take action on them.

The second is that everything had to be infrastructure as code. Scaling rules, update rules, deployment rules, all of it declarative. That gives us a system we can reason about. It also gives us a system an agent can dig into when something is off in production. A standard declaration file that agents can write, understand, and use to inspect what is happening.

## The cache as a network

Single-tenant on its own is not enough. Without something else, single-tenant becomes single-region by accident, and we are back to the problem we started with.

So we needed the nodes to act as a network.

Every node should be a full interface for the clients. Read, write, cache, all of it. And in the background, those nodes should distribute artifacts among themselves in a leaderless way. An artifact pushed from a developer in Berlin should make its way to a CI runner pulling from Sydney without any of the clients having to think about it. No central coordinator, no special node. Just nodes talking to nodes.

This is the part that ties the experience together. It is also the part where we are spending most of our thinking right now, because getting it wrong has the kind of failure modes that are very visible to users.

## The technology, separately

Here is where it gets interesting to me, and where it connects to a longer thread we have been pulling on at Tuist for years.

Supabase hosts Postgres. They are, in some sense, a hoster of an open-source technology with a lot of value added on top: dashboards, auth, storage, realtime. But the core thing is open, and you can run it yourself if you want to. PlanetScale was similar with [Vitess](https://vitess.io).

What if the caching layer was the same? The technology, standalone. Open source. Something you can host yourself if you want to. And we host it for you, because we will do the work of running it fast, safely, and securely. We bring the convenience. You keep the option to walk away.

On top of that, we bring the analytics. You cannot really know whether your caching is doing its job without observability. You need to see hit rates, miss rates, the artifacts that are getting evicted too often, the regions where things are slow. Without that, caching is a black box that either feels fast or does not. With it, caching becomes something you can actually tune.

This is the combination we have been working toward over the past few weeks. A piece of standalone technology that can take artifacts pushed by Gradle, by Bazel, and by many clients that nobody is thinking about caching for yet. We take care of running and managing it. You focus on your project. The analytics come along for the ride.

## What is next

I have not been this excited about a foundation in a long time. This is the layer the rest of [the house we are building](https://pepicrft.me/blog/building-the-house-from-the-roof/) sits on. Caching is the part where the speed shows up. Compute, when we add it, will be the cherry on top of the cake.

We will have more to share in the coming weeks. There is more to say than fits in a single post, and frankly some of it will read better when there are things you can actually try. For now, this is where our head is at, and it feels like the right combination of pieces. Open at the bottom. Convenient at the top. Close to wherever you happen to be building.
