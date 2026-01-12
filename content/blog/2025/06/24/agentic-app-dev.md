+++
title = "Agentic native app development"
description = "Some thoughts on how Tuist could enable agentic building of apps"
tags = ["Tuist"]
published_at = "2025-06-24T12:00:00+00:00"
+++

I used to be skeptical about agentic coding. But after incorporating it into my daily workflow, my perspective has completely shifted.

Agentic coding is saving me tremendous amounts of time. The more context I provide—which is becoming easier thanks to the growing ecosystem of MCPs—the better results I get. This got me thinking about what this transformation means for app development as a whole.

I’ve been following Peter Steinberger’s work lately, and one thing has become crystal clear: you might not need the IDE layer most of the time. Instead, you can use your voice to spawn multiple agents working in parallel without stepping on each other.

Claude Code reinforced this realization. They built an entire coding experience at a lower layer—the terminal—proving that the IDE’s value is diminishing rapidly.

Apple’s top-down, hermetic approach is making them lag behind in crucial ways. They attempted to catch up with Xcode 26, but it’s already outdated. More importantly, they’ve completely disregarded the elephant in the room: MCPs. They’re doubling down on their proprietary model of “you need Xcode and our tools” to develop apps.

However, significant work is happening to break that dependency. As development shifts toward the terminal, new opportunities emerge to work outside of Xcode. This is where Tuist can play a transformative role.

When we built a business around Tuist, we focused on the most immediately monetizable problem: slow builds. This approach proved both slow and limited in market reach. First, you need an organization with a strong pain point, and many have already internalized that Xcode native development is inherently problematic—you can’t change their minds. Second, you need organizations that see value in investing money to optimize their workflows. Many don’t because they lack tools to measure delivery productivity. We ended up with a very limited market, which left me uncomfortable.

Can we build something exciting that a broader market would embrace, willingly pay for, and leverage all our years of investment? I think so. In business terms, it’s called pivoting. If you’ve used the Arc browser, you know what I’m talking about. Your initial market bets might not match expectations, so you can either push through with resignation because people don’t appreciate the problem you’re solving, or go back to the drawing board and iterate. We’re going to iterate.

I believe AI is fundamentally an accessibility tool. More people will be able to build without knowing how to code. Agents will become excellent copilots for app development. In that world, what would they need?

First, they’d need a build environment that doesn’t require creating a developer account or installing a heavy toolchain. The web is the most accessible solution, so we’ll build an environment like Phoenix.new with an embedded simulator. As you work with the agent, you can see your changes live. This isn’t React Native rendered using the DOM—it’s a real app running in a simulator embedded in the browser. Hot reloading will be automatic and seamless.

But this is only half the process. Once you have something usable, you want to share it with others, collect feedback, or publish to the App Store. If you’re an iOS developer, you know this involves intricacies like signing and building for distribution, making things less accessible for those unfamiliar with Apple’s ecosystem. I’d argue it’s even messy for Swift developers who don’t do this daily.

At Tuist, we’ve solved distribution to others and are working on signing when needed. The final step would be pushing to the App Store or releasing apps directly.

The project lives in your repository. You can continue using our agentic coding environment or go the traditional route of pulling everything and opening the project in Xcode. We don’t plan to support the full range of Xcode capabilities—we simply can’t, and it’s not a good idea. However, we can focus on what developers and non-developers need to build 80% or even 100% of apps, simply by chatting with an agent that guides them from idea to release.

What I love about this approach is that it builds incrementally from the product and infrastructure foundation we’ve developed over the past years, while aligning development more closely with the models emerging elsewhere.
