+++
title = "The tolerance shift"
description = "Coding agents are making developers and organizations less tolerant of slow toolchains. That shift in tolerance is opening a door that was surprisingly hard to open before."
tags = ["Tuist", "AI", "Agents", "Productivity"]
published_at = "2026-03-18T08:00:00+00:00"
+++

There is something I keep running into when talking to engineering organizations about productivity: most of them do not really appreciate the problem. They know their builds are slow. They know their CI takes too long. They know developers lose time waiting. But it rarely rises to the level of something worth solving with intention. It is background noise. A tax they have learned to live with.

This is surprisingly common. Unless you operate in a very competitive market where you do not dominate, where saving a minute or even seconds translates into a real edge, productivity tends to sit somewhere near the bottom of the priority list. People acknowledge it, nod when you bring it up, and then move on to the next feature request.

For us at [Tuist](https://tuist.dev), this has always been a challenge. If organizations do not appreciate the problem, they do not see the value in investing in a solution. And if they do not see the value, they certainly do not see the point in paying for one.

## The reflex to throw resources at it

When organizations finally do start feeling the pain, their first instinct is almost always the same: throw resources at it. Hire more engineers. Buy faster laptops. Provision beefier CI machines. These are tangible, visible investments. You can point at a new M4 Max sitting on someone's desk and feel like you did something.

There is actually a well-known pattern behind this. Behavioral economists call it the **tangibility bias**: people systematically overvalue things they can see and touch relative to intangible alternatives. A new machine feels like progress. A software tool that makes all your existing machines faster feels like an expense. Organizations also tend to prefer capital expenditures over operational ones, because buying hardware looks like growth on a balance sheet, while paying for a tool that optimizes what you already have looks like admitting something is broken.

The irony is hard to miss. These same organizations will happily spend hundreds of thousands on new hires and faster compute, but if you tell them "I can make everything you already have significantly faster," they think it is too expensive. They want speed, but only if it comes in a form they can physically see.

## Agents are changing the equation

Here is where things get interesting. I think coding agents are quietly reshaping how people think about this.

When you use a coding agent, you get used to a rhythm: you prompt, you wait for inference, the agent does its work, you review. The total cycle time is a combination of inference time and toolchain time. The time the model spends thinking, plus the time it takes to compile, run tests, lint, or whatever else the toolchain demands.

If you have used agents with languages like Python or JavaScript, you know that the inference piece dominates the cycle. The toolchain is fast. Feedback comes quickly. The experience feels fluid.

Now try that same workflow with a compiled language. Swift with Xcode. Kotlin or Java with Gradle. Suddenly, everything feels painfully slow. Not because the agent is slower, but because the toolchain adds minutes where you used to wait seconds. And because you have already experienced what fast feels like with other languages, your tolerance has shifted. What was once an acceptable wait now feels broken.

This is the shift I find fascinating. **Agents are training developers to expect faster feedback loops.** And once that expectation is set, it is very hard to go back. The frustration compounds because you know the slowness is not fundamental. It is not physics. It is the toolchain. It is fixable.

## Two layers of the solution

Once you accept that the toolchain is the bottleneck, there are really two layers where you can attack the problem.

The first layer is compute. Faster CI machines, faster laptops, faster cloud environments for agents. This is the obvious one, and it works up to a point. But it has a ceiling. You can buy the most powerful machine available and your build still takes however long it takes to recompile everything from scratch. On top of that, compute resources are usually shared. You want good utilization to keep costs reasonable, which means resource contention, which means you cannot just throw infinite cores at the problem.

The second layer is the toolchain runtime. This is where you cache build artifacts so you never rebuild what has not changed. Where you identify and fix flaky tests so agents stop retrying them endlessly. Where you eliminate redundant work in the build graph. Where you are selective about what gets compiled and what gets skipped.

This second layer is more powerful. It is cheaper. It is more flexible. You can take it anywhere because it is not coupled to a particular machine or environment. It works on your laptop, on CI, in whatever sandbox an agent is running in. It solves the problem at a fundamental level rather than throwing hardware at symptoms.

## The coupling problem

This brings me to something I have been thinking about a lot. Many companies that provide CI or development environments bundle their runtime optimizations with their compute. They offer caching, build optimization, test insights, and on paper you can plug them into other environments too. But the system design is deeply coupled to their own infrastructure. When you try to use it outside of their environment, the latency is high, the effectiveness drops, and the experience is nothing like what they advertise. Sure, you can technically plug it in. But the plug does not deliver what you would expect as a developer.

I understand why they design it this way. Compute is where the money is. You monetize CPU minutes, memory, storage. Why would you optimize for environments you do not control?

But I think this model is heading for trouble. The future of compute is fragmented by design. OpenAI runs [Codex](https://openai.com/codex/) in its own containers. Anthropic will have its own agent environments. [Linear](https://linear.app/) is already running agentic workflows in their own infrastructure. [Sentry](https://sentry.io/) is too. Every tool in the chain wants to own execution. No single player is going to control where all development happens.

If your runtime optimizations only work well in your environment, you are betting on a future where you are the only environment. That is an unrealistic bet. And from the other side, why would OpenAI or Anthropic give away their compute revenue to a third-party environment provider? They have every incentive to run things themselves.

## The clean build problem

There is another dimension to this fragmentation that does not get enough attention: incremental builds. On a developer's laptop, builds are incremental by default. You change a file, the compiler rebuilds only what depends on it. This is fast because state persists between builds. Your derived data, your intermediate artifacts, they are all sitting there from the last run.

But when Codex compiles your Swift project in a fresh container, or when a CI runner picks up a job on a clean machine, that state is gone. Every build is a clean build. Everything gets recompiled from scratch. This is where the toolchain slowness becomes most brutal, and it is exactly the environment where agents are increasingly doing their work.

The solution is to bring incrementality across environments. Not just within a single machine, but across local development, CI, and agentic workflows. When an agent runs a build in a remote sandbox, it should be able to pull cached artifacts from a previous build, whether that build happened on your laptop, on CI, or in another agent session. The build should feel incremental even when the environment is ephemeral.

This is not a simple problem to solve. It requires a deep and complex system design for the cache infrastructure. You need content-addressable storage, fine-grained dependency tracking, and a distributed system that can serve artifacts with low latency from wherever the build is happening. It also requires a decentralized architecture where pieces of the system can escape a centralized model and be brought closer to the compute. Sometimes that means a cache node in the same data center as your CI runners. Sometimes it means a node in your office, close to where your team develops every day. The system needs to support all of these topologies without forcing you into a single deployment model.

## Going deep where others do not

This is where I think Tuist can bring something genuinely different to the table. As Peter Steinberger once said, doing interesting things that are hard is what positions you strongly as a business. And the runtime optimization space is exactly that: interesting, hard, and largely ignored.

There are some players focused on specific ecosystems, like [Bazel](https://bazel.build/). [Gradle](https://gradle.org/) is expanding beyond its own build system with Develocity. CI companies are adding value layers on top of their runners. But most of these efforts are shallow, or tightly coupled to a specific environment, or both.

What we are doing at Tuist is going deep into every ecosystem we touch. Not surface-level integrations. Deep understanding of how each toolchain works, where it breaks, what makes it slow, and how to fix it. We cross-pollinate ideas across ecosystems, bringing optimizations from one world into another. We expose APIs for everything. We invest in documentation and developer resources. We use the tools ourselves, every single day.

The vision is to become your platform team, offered as a service. We want to get to a point where we actively monitor your projects, your workflows, your setup, and proactively make sure things are fast. Whether you are coding locally, asking an agent to do it on your machine, or running that agent remotely in some cloud sandbox. The optimizations travel with your project, not with your infrastructure.

## Building the network

If I draw a connection to another company, I think about [Cloudflare](https://www.cloudflare.com/) and how they solved the problem of bringing computation close to where it is needed. Their Workers run at the edge, close to the user making the HTTP request. The function does not live in a single data center waiting for traffic to arrive. It lives everywhere, and the system routes you to the nearest one. That model is what inspires how we think about cache infrastructure at Tuist, but applied to development. Instead of running functions close to your end users, we run cache nodes close to where the development is happening. Close to your CI runners. Close to the agent sandbox. Close to your office.

This requires a different kind of infrastructure. Global. Low-latency. Decentralized by design. The system needs to let organizations bring cache nodes into their own environments when that is what makes sense. Not every team wants their build artifacts traveling across the internet to a centralized service. Some want a node in their own network, in their own data center, or even in their office. The flexibility to support that, while still providing a managed experience for teams that do not want to think about infrastructure, is what makes this problem hard and interesting.

But the pieces are coming together. Telemetry to understand what is actually slow. Cache infrastructure to eliminate redundant work. Deep toolchain integration to know what to cache, what to skip, and what needs to change in your project. Sometimes the optimization is not just adding a cache. Sometimes it is telling you that a specific configuration in your project is causing unnecessary recompilation, or that a dependency is pulling in work you do not need. All of that requires the kind of depth that you can only build by being genuinely obsessed with the problem.

## The window is open

What excites me most about this moment is the convergence. Agents are shifting developer tolerance toward faster feedback. Compute is fragmenting across providers. And the runtime layer, the layer that actually determines how fast your tools run regardless of where they run, is wide open.

This is the ground we are building on at Tuist. Not competing on compute. Not locking value into a single environment. Going deep into the toolchain, building the platform team that every organization needs but few can afford, and making it work everywhere development happens.

The window for this was hard to open before. It took a lot of convincing, a lot of explaining why productivity matters, a lot of fighting the tangibility bias. But agents are opening it for us, one frustrated developer at a time.
