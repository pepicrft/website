+++
title = "CI is commoditizing"
description = "It's time to rethink the CI market."
tags = ["Tuist", "Business"]
published_at = "2025-02-24T12:00:00+00:00"
+++

I remember coming across the idea of Mobile DevOps and wondering: what are they talking about? Isn't Mobile DevOps just [Fastlane](https://fastlane.tools/)? Why do we need a new term?

I later learned that it was just a marketing term, and a vendor-locking tool to prevent customers from switching to other tools in a market where there are already many options available. The same model is repeating across other CI companies that are rushing to build more than just CI. For example, have you noticed that they all rushed to present an App Center alternative?

Many tech companies, including those in the CI space, typically follow this pattern. They run the infinite game of venture capita. They follow the [loss-leading](https://en.wikipedia.org/wiki/Loss_leader) script, first bringing and vendor-locking customers into a reasonably-priced solution, and then squeezing as much money as possible from them. Product and innovation become secondary as they focus on the value-cost trade-off.

As someone who likes to see new ideas flourishing and long-standing challenges addressed, I find it sad.

But software and communities that might form around them can be catalysts for change, and I believe we are entering a bit of a wake-up call in this space. Let me unfold that for you.

GitHub Actions started changing the game. First, they built a solution where developers could build and share steps (i.e., GitHub Actions) with others. Sure, platforms other platforms have it too. But think about it for a second. Would you rather have an action in a repository that's part of your CV on GitHub, or commit it to a centralized repository that's more distant from your GitHub profile? It's a subtle but important difference.

They then integrated the UI (e.g., logs) very tightly into the platform. You don't need to leave the platform to see the execution and results of your CI builds. It's right there, in the same place where your code is. And because it's so close, annotating PRs from your builds is as easy as following some conventions in your logs (e.g., [workflow commands](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions)).

And last but not least, they embraced **the freedom to bring your own hosts**. This not only became freedom for companies and developers to customize their solution but for companies like [CirrusLabs](https://cirruslabs.org) or [Depot](https://depot.dev/blog/ultra-runners-for-macos) to provide hosted runners.

So if your Git forge, most likely GitHub and GitLab, already provides a much better CI experience than other players, gives you access to a marketplace of steps (which, by the way, [Dagger](https://dagger.io) is commoditizing and making CI-platform-agnostic), and many companies are emerging to provide hosted runners, what are you left with as a CI company?

I'll tell you... You need to share the illusion that you provide more than what you really do, and hope that the years of investing in vendor-locking will prevent companies from leaving you. Ehem, Mobile DevOps. But this model is falling apart. It's a matter of time. And we'll see more companies iterating on the idea that they are a CI company. Give it some time...

How are we doing things differently at [Tuist](https://tuist.io)? First, we are designing a company that fosters innovation over seeking value-cost tradeoffs. Innovation is in our DNA. And yes, this will mean we'll make bets that won't bring any return, but that's fine. We want to bring some innovation to the CI space, and you'll see that in the following months.

Second, we are embracing people's freedom to choose. We are not about capturing as much as we can from the value that we generate. It's about generating way more value than traditional businesses. And we are going to do that through open source, so we expect to open-source our server and everything that makes Tuist possible. We'll charge for maintaining the services up and running, and the community will be able to contribute to the project, from the CLI to the server. This will make Tuist stand out over competitors that look at openness with fear. We believe this is also the path to get to Android, React Native, and Flutter.

And last but not least, we are placing a strong bet on making everything collaborative. From the moment we have an idea for something we'd like to build, it becomes a shaping process where the community participates. We want people to feel that Tuist is as much theirs as it is ours.

In the following months, we'll see a lot of changes, not just in the CI space, but in app developer tooling, and we are going to drive the change at Tuist.
