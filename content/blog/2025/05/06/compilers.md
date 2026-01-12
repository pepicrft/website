+++
title = "Compiler optimizations or speed of delivery"
description = "The Swift compiler optimizations are becoming so costly that Apple needs to rethink its approach to the build system."
tags = ["Apple", "Swift"]
published_at = "2025-05-06T12:00:00+00:00"
+++

Compilers turn code into binaries, optimizing it for the target architecture. In ecosystems like Apple’s, this can mean the difference between a MacBook’s battery lasting an hour—or several. But the compiler can also determine whether we ship code quickly or slowly. And in today’s world, where everything moves fast and businesses must keep up, the compiler can easily become a bottleneck.

Talk to engineers, and you'll hear excitement about new language capabilities—features that, while powerful, often add build-time complexity and degrade performance. Swift Macros are a perfect example of this. It’s exciting to see the language explore new directions, but if that comes at the cost of slower compilation and unreliable incremental builds, it feels wrong. Executives feel this too. If you maintain a large Xcode codebase and compare your team’s velocity to a web team’s, the difference can feel like an order of magnitude. So it’s no surprise when leadership asks engineering teams to explore [React Native](https://reactnative.dev). When an app is merely a native presentation layer, abstracting the platform to gain speed becomes a necessity.

Now, add to the compile-time slowness the strong coupling between the compiler and a macOS host, and you’ve got a recipe for disaster. New LLM-based app development experiences are surfacing this problem more visibly than ever. Developers are expecting Apple to respond—but enabling meaningful improvements takes a long-term vision and multi-year effort. That’s something Apple seems to have lost in recent years.

They forked the web ecosystem and actively hindered it—yet the web kept building momentum. Now that momentum is paying off. I don’t know if we’ll end up “vibe coding” our apps with AI prompts, but it’s clear the way we build apps is going to change. And we can’t afford the slow compilation and feedback cycles that Apple imposes. For many new projects, React Native will be the default. You type a prompt, get your skeleton, and you’re coding in seconds.

I love Swift, and I enjoy being close to the platform—it means fewer abstractions. But I fully understand why organizations crave abstraction. And I’d love to see Apple respond to that. They have the resources to make it happen.

I wish they would acknowledge that they’ve lost their north star—but that they’re working on a strategy. Right now, it feels like they’re trying to push Swift in every possible direction while the core problems remain unresolved. How did it take so many years to address frequent merge conflicts? Will it take another decade to automatically copy dynamic binaries to the right destination in the build graph?

Or will they finally define and communicate a plan for the future of build tooling? Are they even thinking about this? If so, why not talk about it publicly? I’d love to follow along.

All of this presents great opportunities for [Tuist](https://tuist.dev). But I’d much rather our work felt like we were extending a solid platform—instead of hacking our way around its shortcomings.
