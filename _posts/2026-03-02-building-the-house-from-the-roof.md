---
title: "Building the house from the roof"
slug: "building-the-house-from-the-roof"
date: "2026-03-02T10:00:00+00:00"
layout: "Pepicrft.PostLayout"
description: "Tuist started at the toolchain layer and is working its way down to compute and caching. This is the whole house, from roof to foundation, and why going deep into each layer is how you earn trust that money cannot buy."
tags:
  - "Tuist"
  - "Building"
  - "Infrastructure"
  - "Open Source"
---
There is a song in Spain called ["La Casa por el Tejado."](https://www.youtube.com/watch?v=8qz8FqmTsJY) It describes the act of building a house starting from the roof. It is meant as a cautionary metaphor, the idea that you are doing things in the wrong order. But I have been thinking about it differently lately, because that is exactly how we have been building [Tuist](https://tuist.dev). And I am not sure it was the wrong order at all.

We started at the roof. Deep integration with the Xcode toolchain, then [Gradle](https://docs.tuist.dev/en/guides/install-gradle-plugin), now expanding into more ecosystems. This layer, the toolchain runtime, sits between your project and the infrastructure that builds it. It is the layer where you understand how code gets compiled, linked, tested, and packaged. We did not plan to start there out of some grand architectural vision. We started there because we cared about it. We wanted to make it better. And in doing so, we built a foundation of understanding that now informs everything we do as we work our way down to the rest of the house.

## Why the roof first

Starting at the toolchain layer gave us something that most companies in this space lack: depth. Real, technical depth in how build systems work, where they break, and what developers actually experience when things go wrong.

Most companies prefer not to go this deep. They would rather place an abstraction between the technology and the infrastructure. This is why solutions like [Docker](https://www.docker.com/) and [Kubernetes](https://kubernetes.io/) exist in the form they do. It is why CI providers settled on the message of "just give us a container and we will run it." The abstraction is convenient. It scales as a product. But it also means you never really understand what is happening inside.

Going deep into toolchains is uncomfortable work. You end up contributing to tools you do not own. You invest time into understanding systems that change under you. You sometimes spend weeks on a problem that benefits an ecosystem but has no direct financial return for your company. This is not the kind of work that looks good on a quarterly report or in a pitch deck.

But it is the kind of work that earns trust. **And trust, in developer tooling, is the real currency.**

## The toolchain layer as a differentiator

I think this is where Tuist can bring something genuinely unique. The way you gain developers' trust is by contributing to the tools they already use. Not by replacing them. Not by wrapping them in a proprietary layer. By understanding them deeply enough to make them better, and then building your product on top of that understanding.

Not many companies are willing to make this investment. It requires an open source mindset, a community mindset, where you accept that some of your work will benefit people who never pay you a cent. That feels irrational if your model is purely transactional. But if you think about it over years rather than quarters, those ecosystems respond. They respond with trust, with adoption, with the kind of organic growth that no growth hack can replicate.

I see so many companies hiring growth hackers and optimizing funnels when the real problem is that developers do not trust them. You cannot shortcut trust by throwing money at it. You can buy awareness, sure. You can manufacture a sense of urgency. But developers remember who showed up to their ecosystem and actually helped versus who showed up with a landing page and a sales pitch.

## From the roof to the walls

If the toolchain layer is the roof, the next layer down is observability. This is the part where you look at your project, analyze your build graph, and surface the things that make developers waste time. Flaky tests, redundant dependencies, suboptimal compilation paths. All of this requires telemetry and deep understanding of build and test data.

**This is why companies traditionally build platform teams.** Someone has to watch the system, understand it, and optimize it. But platform teams are expensive. They require specialized knowledge. And most organizations either cannot afford them or cannot retain the talent.

We think Tuist can be the platform team of the future. A virtual platform team that understands your toolchain, watches your build and test signals, and tells you what to fix. This is not a dashboard with pretty charts. This is the kind of insight that requires understanding the system deeply enough to know what the data means and what to do about it.

As we continue expanding into new ecosystems, this becomes even more relevant. Agents are producing code at a velocity that human developers never reached. More code means more builds. More builds means more opportunities for things to go wrong, to slow down, to waste cycles. The need for a layer that watches, understands, and optimizes is not going away. It is growing.

## The foundation: compute and caching

If you keep going down from observability, you reach the foundation of the house: compute and caching. These are the layers that determine how fast things actually run.

There is a growing consensus in the industry that compute matters. And it does. But I think many companies are being a bit myopic about it. They see compute as the whole story. Faster cores, more cores, dedicated machines. It sells well because it is easy to understand. "Your builds are slow? Here, have a faster machine."

The problem is that compute alone has a ceiling. A physical ceiling. You can buy the most powerful machine available and your build still takes however long it takes to compile everything from scratch. No amount of cores can overcome a build graph that is doing unnecessary work.

This is why we believe compute and caching must go together. Caching is what breaks through the compute ceiling. When your build system can pull a pre-compiled artifact from a cache instead of rebuilding it, you shift the bottleneck from CPU to network latency. And network latency is something you can optimize almost without limit if the cache is close enough. This means compute and caching need to be colocated. You cannot have a cache on the other side of the world and expect it to be fast enough. Physics does not care about your product roadmap.

The compute market is going to get very crowded. We already see [Daytona](https://www.daytona.io/), [Modal](https://modal.com/)), [E2B](https://e2b.dev/), and many others. I would not be surprised to see AWS step into this more directly. When you are only selling compute, your differentiation is thin. Someone will always match your specs at a lower price. But when compute is one layer in a full stack that includes deep toolchain understanding, build graph optimization, observability, and colocated caching, the picture changes entirely.

## The fragmentation problem

There is another dynamic that worries me about compute. As coding agents become more prevalent, everyone wants to provide their own compute. OpenAI runs [Codex](https://openai.com/codex/) in its own containers. CI providers have their runners. [Linear](https://linear.app/) might offer compute for development workflows. Every tool in the chain wants to be the one hosting the execution.

This fragmentation is problematic. Each provider optimizes for their own slice of the workflow, and developers end up with their build artifacts scattered across five different systems, none of which talk to each other. It gets even more concerning when you consider how sensitive the data is. Your source code, your credentials, your build outputs. Having all of that spread across multiple compute providers with different security postures is not ideal.

**I hope the industry converges on a protocol that separates who needs compute from who provides it.** Something that lets you choose your compute provider independently from the tools that orchestrate your work. Without that, we are heading toward a world where every tool is also an infrastructure provider, and the switching costs become unbearable.

## The whole house

What I keep coming back to is that you need the whole house. The toolchain layer, the observability layer, the compute, and the caching. Each one is necessary but not sufficient on its own. Fast compute without an optimized build graph is wasteful. An optimized build graph without good caching still hits a ceiling. Caching without proximity to compute is bottlenecked by physics. And none of it matters if you do not understand the toolchain deeply enough to know what to cache, what to skip, and what to rebuild.

We are building all of it. Going deep into the areas where we do not see other companies going deep because they do not see the value. As I said, going deep requires an open mindset where you invest into areas without seeing direct financial returns. That is why it is not attractive to many companies. But in the long term, it compounds. The ecosystems respond. The trust builds. The product gets better because you understand the problem better than anyone else.

This is not the fastest way to build a company. It is not the most capital-efficient path in the short term. But it is the path that leads to something real. Something that developers can rely on because it was built by people who genuinely understand the systems they work with every day.

We started building the house from the roof. Now we are adding the walls, the scaffolding, the foundation. And when the whole thing is standing, it will be standing on a depth of understanding that you cannot buy, you cannot shortcut, and you cannot fake. You can only earn it by doing the work.
