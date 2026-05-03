+++
title = "The convenience tax"
date = 2026-05-03T10:00:00+00:00
slug = "the-convenience-tax"
description = "I keep coming back to the wave of companies that made infrastructure feel easy, and what coding agents are doing to the layer of convenience they were quietly selling."

[taxonomies]
tags = ["Infrastructure", "Tuist", "AI", "CI"]
+++
I have been thinking a lot about the wave of companies that made deploying software feel easy. [Fly.io](https://fly.io), [Render](https://render.com), [Railway](https://railway.com), [Vercel](https://vercel.com). They played a real role in shaping how a generation of developers thinks about infrastructure. Push to deploy. No clusters. No pager.

I was a fan. I still think they have a role to play. They are, in many ways, convenience as a service. Some of them, like Vercel and Fly.io, went down the road of running their own hardware, probably for cost reasons but also for the flexibility of deciding where and how to allocate resources. Others, like Render, run on top of AWS, which means you pay a tax on top of the compute you would already be paying for.

For a long time that tax made sense, because the alternative was learning [Kubernetes](https://kubernetes.io), or building out your own runner setup, or stitching together something with Terraform and a deep breath.

That equation has changed.

## What agents quietly did to infrastructure

Coding agents have done something I do not think we have fully appreciated yet. They have codified the knowledge of tools that were traditionally considered too complex to touch. Kubernetes is the obvious example. [Bazel](https://bazel.build) is another. These tools are still complex, but the ramp is no longer a wall. You sit down with an agent, describe the shape of what you need, and it walks you through the concepts that apply to your specific case. The ones that do not apply, you do not even need to learn.

That eliminates a whole layer of convenience that companies were charging for.

## What happened at Tuist

We just lived this at [Tuist](https://tuist.dev). We moved off Render and onto a Kubernetes cluster running on [Hetzner](https://www.hetzner.com). The cluster is currently managed by another company, and that is the next thing we are going to change. What blew my mind is how easy the whole setup was to navigate. We are a tiny team. A few years ago this would have been a project. Now it was a couple of focused weeks.

There is a motivation behind the move that is worth naming. We are shaping Tuist into a company that captures value by providing infrastructure. To do that well we need to declare our infrastructure as code, reason about it, and understand it deeply. Going through a managed PaaS is the wrong shape for a company whose product is increasingly about running infrastructure for others.

What we did not expect is the bucket of things that came along with the move.

Costs went down, which we expected. But suddenly we could lean on agents to reason about our infrastructure too. They could read manifests, propose changes, and inspect the live state via `kubectl`. [Grafana](https://grafana.com) has first-class support for Kubernetes, which means we now have an observability toolchain that was simply not on the table before. None of this would have been possible inside Render's world, where access to our own infrastructure was, by design, gated by them. That is fine for most people. After tasting another world, I cannot go back.

## CI looks suspiciously similar

I keep thinking about this in the context of CI. There is a category of companies emerging there: [Blacksmith](https://blacksmith.sh), [Depot](https://depot.dev), [Namespace](https://namespace.so), [RunsOn](https://runs-on.com). Some bring their own hardware. Some, like RunsOn, run directly on AWS. The shape is similar. You get faster, cheaper CI, with someone else doing the operational work of attaching ephemeral environments to your Git forge.

The thing is, the basic problem is not that hard to solve. You need compute. You need to spin up environments. You need to wire them to GitHub or your forge of choice. That is the floor. And once you internalize that the floor is reachable in-house with the help of agents, you start to wonder what the rest of the value really is.

You can already see developers experimenting in that direction. [Peter Steinberger](https://x.com/steipete) just shipped a release of his tool [Crabbox](https://x.com/steipete/status/2050490163810230579) that includes, among other things, an "AWS image create" command baked in. It spins up remote Linux runs from your laptop and talks to the cloud provider directly. No middle company. It is a small example, and it is one of many to come. Once the friction of touching the provider yourself drops, the layer that sits between you and the provider has to keep proving why it deserves to be there.

That, I think, is why these companies are increasingly trying to sell something beyond compute.

## What they are actually selling

What they are selling is a story. That is how capital flows in our industry, and there is nothing wrong with selling stories as long as the story holds up.

The story right now is the infrastructure for agents. The infrastructure for agents to run their tasks. The infrastructure for agents to run the work they produce. Infrastructure for a world that is unfolding and that nobody really knows the shape of yet.

I have mixed feelings about it. We already have cloud providers that can do this. You can build directly on them, and use the room you save to innovate on something else. But that is not how our industry moves. Layers emerge. They disappear. They move. They get renamed. Many of them are sustained more by stories and promises than by the strict technical need they answer.

The serverless wave is a good reminder. Functions that run close to the user, sold on the promise of latency, while still having to traverse the planet to reach a Postgres database managed by yet another company. Pricing models that look great on the cheap end of the curve and quietly become bizarre at scale. You sit there waiting for your provider to ship a feature so that your bill stops growing in ways you cannot explain.

Elastic CI compute. Elastic agent compute. Elastic function execution. Pay per minute. Pay per token. We love that.

## Where I land

I do not want to dismiss any of these companies. Many of them are run by people I respect, solving real problems for real customers. The convenience they offer matters. For most teams, paying the tax is still the right call.

But the equation underneath has shifted. If there is an agent in the room with you, the layer of convenience you used to rent gets thinner. The case for owning your infrastructure, or at least owning the ability to reason about it, is stronger than it has been in a long time. And the things you discover when you cross that line, the access to your own systems, the observability, the freedom to compose what you actually need, are hard to give back once you have had them.

That is the part nobody puts in the marketing copy. And that is the part I keep coming back to.
