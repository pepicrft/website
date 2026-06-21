+++
title = "The quiet corner"
date = 2026-06-21T12:00:00+00:00
slug = "the-quiet-corner"
description = "Why we are betting on remote caching instead of compute, and building Kura and Once in the open as the quiet corner everyone else overlooked."

[taxonomies]
tags = ["Business", "Tuist", "AI", "Tooling"]
+++
Development used to be a line. You wrote something, you waited for the machine to tell you whether it was wrong, you wrote a little more. One person in the loop, one thing happening at a time. We complained about the waiting, but at least we understood the shape of it.

That shape is gone. You can now have several agents going at once, each spawning its own harness, each harness reaching for a compiler or a build system, all of them landing on the same machine in the same moment and elbowing each other for the same cores. The serial loop turned concurrent while we were looking the other way.

So the number of cores you have, and how fast they are, quietly became a ceiling.

The interesting thing about that ceiling is that we already know how to lift it. Remote caching and remote execution are not new ideas. The companies operating at a scale where a single machine stopped being enough solved this years ago, and Bazel and Buck are what came out of it. What changed is not the technique. What changed is who has the problem. It is no longer the hyperscalers. It is everyone, because everyone now wants the loop to close at the speed of inference, and there is nothing more deflating than watching code appear in seconds and then sitting there for minutes to find out whether it holds.

You would think a need that widespread would have a crowded market behind it. It does not.

## Why nobody built the obvious thing

We got Bazel and Buck a long time ago. We got a few companies like BuildBuddy and EngFlow building on top of that lineage, and some ecosystem-flavored options like Nx leaning into JavaScript. And then, mostly, silence.

It surprised me at first. It stops surprising you the moment you remember what game most of this industry is playing. When the scoreboard is hypergrowth and the clock starts the day you raise, you do not pick the problem that is right. You pick the problem you can bill by the minute. Between cache and compute, compute wins that contest every time, because compute is a meter you can watch spin. Cache reads as storage, storage is cheap, and a billing model that fights the customer's intuition about what something should cost is a billing model nobody wants to defend in a board meeting.

So the money went where the meter was. CI runner companies started repackaging their idle compute as sandboxes for agents and treated the cache as a checkbox on the way there. Not because the cache did not matter. Because nobody could see how to make it spin a meter fast enough to justify the slide.

It turns out the cache was not the throwaway. The cache was the whole thing.

## The bet, in a few parts

Our first bet is that this needs real infrastructure, and not the kind you rent by the hour from the same clouds you are competing with. Build caches are sensitive to latency and bandwidth in a way that punishes you for being far away. So we are building toward global infrastructure that sits close to wherever you happen to be building, and we are doing it on our own terms, because we want to capture value in the running of it and leave the software itself open. Kura, our new caching technology, is the first hard piece of that.

The second bet is that this has to be accessible, and here is where most of our competitors and us part ways. They are pointed at the enterprise. We want the enterprise too. But if wanting a cache becomes a normal thing for a normal team, those teams are not going to be charmed by a website built entirely out of "contact sales" and "book a demo." If a comparison helps, we want Tuist to feel like Supabase. One click and you are in. Another click and your cache replicas are sitting in the regions you chose. Point your automation at it and you are done, and before long the coding harness will do even that part for you. The brand, the design system, the landing page, none of that is decoration. It is what it takes to be the thing people reach for instead of the thing people are sold.

Accessibility does not stop at the platform, though. I keep an eye on how remote caching and execution are making their way into native toolchains, and the honest answer is that it is not going well. Which leaves people resorting to Bazel or Buck, or sprinkling little bits of caching into pipeline steps and hoping. I think Bazel and Buck are genuinely good. I also think the jump from nothing to Bazel is enormous, even with an agent holding your hand. A developer told me just the other day that Starlark is a poor bet now precisely because the agents assume it is Python, write invalid syntax, and burn cycles discovering it is not. The gap between where teams are and where those tools begin is the real product opportunity, and almost nobody is standing in it.

That gap is why we keep circling a client-side automation substrate. Something that takes you from "here are the scripts I would like to be faster" to "here is a graph of my project's work that knows what can be cached and what can be skipped," one honest step at a time, in a shape a coding harness can actually read and improve. Incrementality is the point. The way the pieces fit:

- **Once** is an open source automation substrate that Tuist plugs into to provide remote execution and caching.
- **Kura** is our open source, leaderless, decentralized cache.

These are to Tuist what Postgres is to Supabase. We open the layer the tools talk to, we host and run the hard part, fast and reliably and securely, and we stay agnostic about what you bring. Gradle? We will be there. Bazel? That works too. Plain Xcode projects? Supported. There is no perfect option out there and pretending otherwise is how you end up selling lock-in with a smile. Tuist is a productivity infrastructure company now, not a single piece of technology, and that distinction is the whole strategy.

## Where this goes

There are ideas waiting behind Once that we are deliberately not rushing. Most of them are about automation that has nothing to do with building code, and they need time to take shape, to click, to be shaped by how our users and we ourselves actually live with the thing day to day. We would rather arrive at them slowly and honestly than ship a guess because a roadmap had a gap.

What we do not want is for Tuist to be the company that jumps on the obvious. The obvious move this year is to wrap compute in a sandbox and call it a strategy. It is a fine business. It is not the one we want to be remembered for. We want Tuist to be the thing people reach for when the next shape of this work arrives, the company known for its craft and for being honest about what it opens and what it charges for, rather than one that captured a quarter and forgot why it started.

There is no immediate money in the corner we picked. The cache does not spin a meter the way compute does, and that has always been the reason nobody fought us for it. Which is also why we get to keep building it, in the open, with the community, while the loud markets next door race each other to the bottom of their own margins. Sometimes you capture less value than you could have. That has always been a trade I am happy to make.

It is a quiet corner. We would not want to be anywhere else.
