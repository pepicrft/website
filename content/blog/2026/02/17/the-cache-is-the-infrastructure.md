+++
title = "The cache is the infrastructure"
description = "Why the future of CI isn't about dedicated compute but about colocated caching, and how build systems, coding agents, and shifting economics are making that future real."
tags = ["CI", "Infrastructure", "Tuist", "Building"]
published_at = "2026-02-17T10:00:00+00:00"
+++

I was reading [a piece by Ian Duncan](https://www.iankduncan.com/engineering/2026-02-05-github-actions-killing-your-team/) the other day about CI infrastructure investment. His argument, like many others in this space, placed a strong focus on the importance of dedicated compute resources. The idea is that cloud providers are not interested in building these capabilities because their business model prefers shared compute. You rent a VM from a hyperscaler, and you're fighting for CPU time with whoever else landed on that physical machine.

And he's right. The piece resonated because it lines up with what most of us have experienced. GitHub Actions runners are slow. Shared compute means noisy neighbors. An entire cottage industry exists (Namespace, Blacksmith, Actuated, [Depot](https://depot.dev/), BuildJet) whose sole product is "GitHub Actions, but the runners don't suck." There's a real problem here.

But I think the framing is starting to age.

## Where dedicated compute matters

The argument for dedicated compute is strongest when you're running compiled languages. Swift, Rust, C++, Go. Build systems for these languages will happily consume every CPU core and every gigabyte of RAM you give them. When your Xcode build is maxing out 16 cores for forty minutes, the last thing you want is another build on the same machine competing for those resources. In that world, dedicated compute is not a luxury. It's the baseline.

This is also why most web applications don't feel the same pain. A typical SaaS backend spends its CI time waiting for database queries, network calls, and object storage operations. The CPU is idle most of the time. For those workloads, shared compute is fine. The bottleneck was never the processor.

But here's the thing. Even for compiled languages, the ceiling of what dedicated compute can give you is a physical ceiling. You can buy the biggest machine available, and your build still takes however long it takes to compile everything from scratch. You're bound by the hardware. There's no way to go above it.

Unless you stop compiling everything from scratch.

## The shift to caching

The real unlock is not faster CPUs. It's not having to use them. When a build system can fetch a pre-compiled artifact from a cache instead of rebuilding it, the constraint moves from compute to network. And network latency, unlike CPU clock speed, is something you can optimize almost without limit if the cache is close enough.

This is what [Bazel](https://bazel.build/remote/caching) figured out years ago. Remote caching and remote execution meant that builds could reuse work across machines, across teams, across CI runs. The problem was that Bazel carried a brutal adoption cost. The migration complexity, the learning curve, the need for dedicated infrastructure to support it. [Alex Eagle from Aspect Build described it well](https://www.aviator.co/podcast/hidden-cost-of-bazel): you needed management buy-in, a dedicated team, and months of migration work. For most organizations, the cost simply wasn't worth it.

So the industry settled into a comfortable pattern. Buy bigger machines. Run fewer things in parallel. Throw hardware at the problem. It worked well enough.

That's changing now, from two directions at once.

## Build systems are catching up

The first shift is that build systems are incorporating caching and remote execution capabilities natively, without requiring a Bazel migration.

[Gradle](https://docs.gradle.org/current/userguide/build_cache.html) has had remote build caching for years, with a simple HTTP protocol that lets CI populate the cache and developers consume it. [Vite Plus](https://voidzero.dev/posts/announcing-vite-plus), VoidZero's evolution of Vite into a unified toolchain, ships with a built-in monorepo task runner that brings intelligent caching with sophisticated task input inference, so most tasks can be cached without explicit configuration. Often with better granularity than manual setups.

And then there's Xcode. [Xcode 26 introduced compilation caching](https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes) using LLVM's Content Addressable Storage, with sub-function-level granularity and a gRPC protocol for remote cache support. [Bitrise did a deep technical analysis](https://bitrise.io/blog/post/lifting-the-hood-on-build-cache-for-xcode) of how the local and remote caches interact. [We wrote about our own integration at Tuist](https://tuist.dev/blog/2025/10/22/xcode-cache), where combining Xcode's native caching with our module-level binary caching produced a 77% build time reduction with local cache and 53% with remote.

The pattern is clear. Caching is moving from a Bazel-exclusive advantage to a standard capability across build systems. And when your build system can skip most of the work by pulling cached artifacts, the question stops being "how fast is your CPU?" and starts being "how close is your cache?"

## Coding agents changed the equation

The second shift is that coding agents have fundamentally altered the adoption economics.

The reason Bazel was so expensive wasn't just the build system itself. It was the human cost of migrating to it, maintaining it, and teaching teams how to use it. That cost is collapsing. Tools like [Claude Code](https://code.claude.com/docs/en/overview) and [OpenAI's Codex](https://openai.com/index/introducing-codex/) can handle migration work, write build rules, and maintain configurations at a fraction of the previous cost. The barrier to adopting sophisticated build systems is dropping fast.

But coding agents are doing something else too. They're breaking the strong coupling between your development environment and your CI environment.

When Codex runs a task, it spins up [its own isolated container](https://developers.openai.com/codex/cloud/environments/) with the repository pre-loaded. Claude Code can [run headlessly in CI pipelines](https://code.claude.com/docs/en/headless). These agents are generating code at a higher velocity than human developers, which means CI is running more frequently. [Depot wrote about this directly](https://workos.com/blog/depot-builds-ai-era): the AI era demands faster builds because there are simply more builds to run.

In this world, the compute where your code builds might not be something you control at all. It might be a Codex container, or a Claude Code session, or some future agent runtime that doesn't exist yet. What you can control is where the cache lives and how fast it responds.

## What this means for us

This is something we've been thinking about a lot at Tuist, especially as we venture into the runners space. And honestly, we don't find it fun to solve dedicated compute. Building and maintaining bare-metal infrastructure, negotiating with hardware vendors, optimizing hypervisor configurations. That's not where we want to spend our energy.

What we find exciting is building a compute solution upon which we can shape developer experiences at the intersection of software craftsmanship and LLM capabilities. The developer experience layer. The part where you make builds feel instant, where you give teams visibility into what's slow and why, where you connect the cache to the agent to the build system in a way that feels seamless.

The more we thought about it, especially seeing products like [Depot building on AWS](https://aws.amazon.com/solutions/case-studies/depot-dev/) with EC2 instances and achieving incredible results for their customers, the more obvious it became that starting from existing cloud infrastructure is the right call. Yes, the margins are thinner than owning hardware. But in a world that's changing this fast, if we ever had to own that layer for better cost control, that would be a good sign. It would mean we've grown to the point where it makes sense. It doesn't make sense for us to start from there.

Instead, we prefer to build on existing foundations and bet on the future by throwing resources into enabling it. We're building infrastructure where organizations can bring cache close to compute, wherever that compute lives. If your builds run on GitHub Actions, the cache should be there. If they run on Codex, the cache should be there too. If they run on your own machines, same thing.

## The infrastructure that matters

The CI industry spent a decade telling us that the answer to slow builds is faster machines. And for a while, that was true. But the next decade is going to look different.

Build systems are getting smarter. Caching is becoming universal. Coding agents are decoupling environments from infrastructure. The bottleneck is shifting from compute to network latency, from raw CPU cycles to cache proximity.

The companies that win in this space won't be the ones with the most sophisticated compute infrastructure. They'll be the ones that make the cache invisible, that make builds feel instant regardless of where they run, that meet developers wherever their code happens to be building.

That's the bet we're making. And we think it's a good one.
