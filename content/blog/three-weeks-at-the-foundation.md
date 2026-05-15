+++
title = "Three weeks at the foundation"
date = 2026-05-15T10:00:00+00:00
slug = "three-weeks-at-the-foundation"
description = "Three weeks of cutting instead of patching: moving off Render onto our own Kubernetes cluster on Hetzner, rewriting the cache in Rust as Kura, reconciling bare-metal compute, and why infrastructure that agents can read natively turned into a strategy."

[taxonomies]
tags = ["Tuist", "Infrastructure", "Kubernetes", "Building"]
+++
It has been three weeks of relentless work at [Tuist](https://tuist.dev), and we cannot remember a moment in the history of the company where we felt more confident about where we are heading. Three weeks is not a long time. But the shape that emerged in those three weeks is going to define what we build for the years ahead, and we want to write some of it down before the dust settles and it stops feeling new.

## The discomfort that started it

About a month ago we started feeling uncomfortable with our own infrastructure. The kind of uncomfortable you cannot ignore, where every reactive patch on top of the previous reactive patch tells you that the thing you are running is not really yours.

We had very little telemetry. We had a system whose design would render itself unstable, and we would keep slapping fixes on top whenever something broke. Our infrastructure, which was quietly becoming a real thing as Tuist evolved into a platform, was fragmented across imperative scripts and a few platform-as-a-service providers like [Render](https://render.com). None of it composed into anything coherent. It was a collection of accidents.

We have been at this point before, and we have learned to recognize the moment when you have to stop patching and start cutting. So we cut.

## Why Kubernetes, of all things

We had been pondering [Kubernetes](https://kubernetes.io) for a while, partly with skepticism, because Kubernetes has a reputation. But it kept coming back as the answer to a different question than the one most people are asking. Not “how do we run containers at scale,” but “what is the unified interface that can hold our servers, our async workers, our caching nodes, and soon our runners, in one declarative place?”

We had one more reason that we did not see anyone else talking about. **Kubernetes is a language that agents speak natively.** Not just to write or iterate on infrastructure, but to inspect it. To observe it. To reason about the state of the system without us having to expose a custom MCP server for every little thing.

This turned out to be the most interesting realization of the whole exercise, and we want to come back to it.

## Moving off Render in weeks

What followed was the kind of execution that, looking back, still surprises us.

We moved everything off Render in a matter of weeks. We started with a managed Kubernetes cluster, with the workloads landing on [Hetzner](https://www.hetzner.com). We quickly realized the cost model of running through a third party would not scale, because the company managing the cluster would take a cut on every server in our workload. So we moved everything onto our own managed cluster, fully on Hetzner, fully under our control. The whole thing is plugged into [Grafana](https://grafana.com), which gives us the observability we never had.

The migration was fast. The system is smoother than the thing we replaced. The bill is smaller. None of that was the biggest win.

## The unplanned benefit

The biggest win was something we did not plan for, and it is the thing we have been thinking about the most since.

When you live on platform-as-a-service tools, which is a perfectly reasonable choice if you are not familiar with infrastructure, you take on a hidden cost. The interface those tools expose is not an interface that agents talk natively. A lot of the things you would love to do with agents in production, like inspecting state, correlating signals, reasoning about why a service is misbehaving, you simply cannot do. Or you can, but you depend on the provider exposing an MCP server. With Kubernetes you do not need that. The manifests, the controllers, kubectl, the state itself, they are already a language. Agents can read them, reason about them, and act on them.

This was a side effect that turned into a strategy. We now think that picking infrastructure layers that agents speak natively is going to be one of the more consequential decisions a small company can make in the next few years. The convenience of a PaaS comes with a translation layer that, with agents in the picture, becomes a tax.

## The cache, rewritten

In parallel with the Kubernetes work, we moved away from the caching technology we had been using. We rewrote the whole thing in [Rust](https://www.rust-lang.org) and took the opportunity to redesign it around a single-tenant model, which we [wrote about a few weeks ago](https://pepicrft.me/blog/the-single-tenant-cache/).

This rewrite was not just about performance. It was about boundedness. Every resource the cache touches is now controlled, from file descriptors to network connections. The system has a mechanism that reacts when it approaches its limits in a graceful way. Things slow down before they fall apart. The cache continues to serve, just less efficiently, until the pressure passes. That is the opposite of what the old system did, which would simply collapse and ruin everyone’s afternoon.

While we were at it, we decided that this cache deserved a name and a life of its own. We are calling it **Kura**. The plan is for Kura to be an open-source piece of technology that anyone can deploy, in the same way anyone can deploy Postgres if they want to. And we will offer the hosting, the updates, and the scaling as a service, as part of Tuist. The whole thing came together in a couple of weeks.

## Compute, reconciled

The next layer is compute, with a particular focus on virtualized macOS environments. We have been working on bringing that into the same Kubernetes world.

The trick is that bare metal is bare metal, and Kubernetes was not designed around it. So we wrote our own controllers that take a very physical machine, install everything needed to make it useful, and reconcile it into the cluster like any other resource. The first thing we are rolling out on top of this is CI runners. The same model will extend to runners for agentic workflows soon after.

It is honestly a bit surreal that in three weeks we have moved the entire infrastructure to Kubernetes, we are running our own caching technology that can be deployed per tenant, and we have runners almost ready. Everything is reconciled by the product, which means a customer can choose where things live and on what spec of machine. There are still rough edges. But the bones are in place, and the bones are good.

## Where this is going

There is one more piece we want to mention, because it is the part that makes all the rest worth doing.

We keep thinking about what we call the **zero-to-productive** setup. The idea that a developer should be able to go from nothing to a fully optimized workflow without ever talking to a human at our company. No contact sales. No demos. You sign up. We even pay on your behalf for the first stretch if it helps. An agent walks in, looks at your project, figures out whether you are on [Bazel](https://bazel.build), Xcode, [Gradle](https://gradle.org), or something else, and sets things up. You get CI runners. You get an agentic workforce that can keep optimizing your setup over time. You get analytics so the agents have data to iterate on.

It is the **platform team as a service** that we always wished we had at larger companies. The kind of platform team that small teams cannot afford to hire, made available to anyone who shows up. With Kubernetes underneath, Kura at the caching layer, compute being reconciled by our own controllers, and agents that can read all of it because it is declarative, this is no longer a fantasy. It is the thing we are building.

## A foundation that holds

After these three weeks we feel a kind of quiet confidence that is hard to fake. The decisions we made under pressure turned out to be the right ones. The investments compounded. The pieces that we thought were unrelated turned out to share a spine. Infrastructure that agents can read. A cache designed for proximity and graceful degradation. Compute that reconciles into the same world as everything else. And, sitting on top of all of it, a product that you can use without a human in the loop.

We have been [building the house from the roof](https://pepicrft.me/blog/building-the-house-from-the-roof/) for a long time. These three weeks were about pouring the foundation. There is still a lot to figure out. But for the first time in a while, we feel like the foundation will hold whatever we decide to put on top of it.
