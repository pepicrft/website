+++
title = "If Swift app development teams had the data..."
description = "What are we waiting to help Swift app development teams be productive?"
tags = ["Tuist"]
published_at = "2025-02-25T12:00:00+00:00"
+++

When chatting with organizations that build native Swift apps with Xcode, a common denominator I've found is their limited insights into their development environment.

As you might know, solutions start with understanding. Without it, solutions are chosen blindly and based on assumptions.

The organizations that can afford it throw more engineering resources at the problem, hoping everyone will become more motivated and productive. Others might suggest, "Let's adopt [React Native](https://reactnative.dev) because I've seen company X successfully implementing it." Or one engineer might propose swapping the build system completely with something like [Bazel](https://bazel.build).

But the data is there. It's just not pleasant to obtain and work with.

Want to know more about `.xcactivitylog` and the `.xcresult` schema? Search for it on your preferred search engine. You'll most likely end up finding some parser on GitHub. The community has to reverse-engineer these formats, just as we did with the `.pbxproj` format to build [XcodeProj](https://github.com/tuist/XcodeProj).

There's an unfounded obsession with keeping everything close to Xcode, as if development didn't extend beyond your local macOS machine and your `Xcode.app` instance. Look at Xcode Cloud—it's built right into Xcode. Beautiful. But the capabilities of CI services haven't fundamentally changed. We're just doing the same things, or even worse, but now it's official and native.

It feels as if we're stuck on this idea of "it's native" while watching our builds take an insane amount of time, or our flaky tests blocking people without really knowing how serious the problem is.

So [Tuist](https://tuist.dev) is jumping in because no one else is:

1. We're collecting the data for you 2. We're making it accessible 3. We're helping you act on it 4. And potentially, we'll be the ones acting on it (e.g., auto-disabling flaky tests)

For the first point, we're learning about those proprietary formats to collect and push them to a server. Yes! A server. We love native apps too, and we'll build a native interface to the Tuist platform, but that should be an interface, not the core. A server also means a database, so you can understand how the data evolves over time, and the possibility to interact with other services, integrating with things that happen outside of developers' environments and Xcode. We can't disregard that there's a lot happening out there, because otherwise we end up with a developer experience that's lagging behind in a world where LLM is challenging how we code.

We're standardizing, documenting, presenting, and making the data available to you via an API. Your project, your data.

It's that simple.

We're just a group of developers passionate about this domain. It's not our aim to monetize your data. Our business is helping you solve your problems. Period.

With all our learnings from past years and current interactions with customers, we'll codify that knowledge into a dashboard and a set of tools to make development enjoyable.

I don't understand why this hasn't happened before, but on the upside, it's a great opportunity for us to build something different—something focused on developer experience.

The data is there. We're just going to use it.
