+++
title = "Tuist Is Not What You Think It Is"
description = "Something great about having chosen Tuist as a name for a product is that we have a high ceiling in terms of the product definition we can come up with. Unfortunately, we have a floor that we need to raise too, and that's people's perceptio…"
published_at = "2025-09-22T17:40:10+00:00"
+++

Something great about having chosen Tuist as a name for a product is that we have a high ceiling in terms of the product definition we can come up with. Unfortunately, we have a floor that we need to raise too, and that's people's perception and mental models around what Tuist is.

For many people today, Tuist is a project generation tool, and for some in that group, we are an unnecessary abstraction because [SwiftPM](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/) is just fine. But the reality is very different from that. **Tuist is a platform to address challenges of scaling app development with Apple's toolchain**, and only a subset of those challenges requires project generation, an abstraction upon Xcode projects, to solve them. Those challenges are modularization complexities and slow compilation. We are the first ones who would avoid abstractions if we could; in fact, we peel them when they are no longer needed, like we recently did by telling people that if they are using Tuist to minimize merge conflicts, that's not really needed. However, in some cases, an abstraction is unavoidable, and Xcode's terrible derived data decision or inability to optimize the build process left us with no choice. Perhaps your project with few modules declared with SwiftPM is just fine, but [when you grow that into hundreds](https://medium.com/bumble-tech/scaling-ios-at-bumble-239e0fa009f2) of modules and it takes 1 minute to index the project, or 15 seconds to delete a file from a project, then I don't know about you, but this is not a nice setup to work with. Perhaps it just takes experiencing sustained pain over time to look at the need for abstraction with different eyes.

![](__GHOST_URL__/content/images/2025/09/image-3.png)

An image from Bumble's [benchmarking](__GHOST_URL__/standards-over-lock-in-why-were-building-tuist-differently/) that shows the differences between using a vanilla Xcode project and SwiftSPM

As I said, we are evolving Tuist to be more of an extension that you plug into your Xcode project and toolchain. It's an extension that takes just a few lines to integrate. For instance, if you want to get build insights like those that we get for the Tuist project, all you need to do is add a [post-action](https://docs.tuist.dev/en/guides/features/insights#builds) to your Xcode project scheme, and you are good to go. Or selective testing, which you can adopt in your Xcode projects by just prefixing your `xcodebuild` invocation with `tuist`. Now, you might not want to depend on or even pay for third-party tools, and I'd understand that too, but once your project reaches a certain scale, I'll tell you that you'll experience a regression in developer experience that Apple won't support you with, and you'll be alone there. I've seen that many times, and it was hard for developers. From companies adopting [React Native](https://shopify.engineering/five-years-of-react-native-at-shopify) to others replacing the build system entirely, the pain was much stronger than the little cost that a non-official abstraction like Tuist could have brought to your project.

![](__GHOST_URL__/content/images/2025/09/image-2.png)

A screenshot of the Tuist's dashboard where you can see build insights from the Tuist project itself. The data that we show includes for a period of time: the number of builds, the number of failing builds, the average duration of builds.

**The journey we're on is about making Tuist invisible when you don't need it and invaluable when you do.** We're building a platform that respects your existing workflow while providing escape hatches for when Apple's toolchain shows its limitations. Every feature we add is designed to be adopted incrementally. You don't need to rewrite your entire build system or learn a new paradigm. You just need to recognize when the pain has become unnecessary and know that there's a solution available.

We understand that not every project needs what we offer today. But as your codebase grows, as your team expands, and as your build times stretch from minutes to hours, remember that these problems aren't inevitable. They're solvable, and we're here to help solve them. **The abstraction we provide isn't about replacing Xcode; it's about making Xcode work better for you at scale.**

Our vision is simple: no developer should have to choose between staying native and having a productive development experience. With Tuist, you don't have to.
