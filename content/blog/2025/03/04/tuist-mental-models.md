+++
title = "From open source to open core business"
description = "In this blog post I unfold the journey of Tuist from an open source tool to an open core business."
tags = ["Tuist"]
published_at = "2025-03-04T12:00:00+00:00"
+++

[Tuist](https://tuist.dev) started as a pure client-side tool. Through project generation, it made Git conflicts less frequent and modular Xcode projects easier to manage. That work was the foundation to build a strong brand and a community around it. But it made it clear that this approach isn't the most suitable from a sustainability perspective. That's the reason why open-sourcing client apps is more rare than server-side ones. But a closed-source CLI was out of the question.

For context, project generation continues to be the reason why many projects come to Tuist—most of which, surprisingly, are trying to find a developer experience that's better than [SwiftPM](https://www.swift.org/documentation/package-manager/)'s.

Once you reach the inflection point of having many people using the tool (therefore demanding energy from you) while you're treating it as a side gig, you have to consider doing something about it if you don't want to burn out. In many cases, developers don't do anything, and projects stagnate. Look around; I'm sure you'll find some examples. We were once suggested to move Tuist to a foundation, but foundations don't solve sustainability. So in our case, we decided to evolve Tuist into an open core business.

Transitions like this are not easy. You are going from open source and free to partially open source with some paid features. It's natural to think, "But you didn't tell me about this," but we didn't know either that Tuist would end up being largely adopted. So it's either we do something or let it die. I know it sounds harsh, but it's the truth.

The month that followed came with a lot of learning and questioning around what we'd like the company to be like. Open source is in our DNA, so as you can imagine, that influenced how we are shaping the company.

The first conclusion we reached is that **we had to introduce solving problems that required a server to be solved.** Capturing value through a server (in other words, asking people to pay for it) aligns better with people's mental models. It's still tricky to this date because, since people interface through the CLI, they find it rare that they have to have a paid subscription bound to the account they authenticated with through the CLI. Yet I believe this will shift as we continue to make Tuist server-centered. Solutions like [cache](https://docs.tuist.dev/en/guides/develop/cache), [selective testing](https://docs.tuist.dev/en/guides/develop/selective-testing), [previews](https://docs.tuist.dev/en/guides/share/previews), or analytics were born to solve server-solvable needs.

Our limited capital and the cost of getting a business off the ground led us to making the server closed source to avoid free-riding until we could better understand the market and how to monetize it. We did so contrary to our principle of keeping things open, and as you can imagine, the idea of making it open source again is something we've been pondering since.

When I tell this to developers and other business founders, they look at me and think, "Are you crazy? Opening the sources? You won't build a business like that." But after a lot of reading, discussing, and learning about the models of companies like [GitLab](https://gitlab.com) or [PostHog](https://posthog.com), I believe more than ever that this model is feasible. Let me unfold that for you.

But first things first: the motivations. **We believe the best products are built by communities of people from all over the world.** Despite your efforts of hiring diverse teams, you are limited to your team of 10, 20, or 100 people to build a product that addresses everyone's needs. Our work in the CLI taught us that. Once you experience it, you want to apply it everywhere. The human force you get access to through this model is unbeatable by throwing capital at the problem. Look at [Wikipedia](https://wikipedia.org), [Discourse](https://www.discourse.org/), or [Grafana](https://grafana.com/). Elon Musk is annoyed by Wikipedia, but you can't compete with a group of people motivated by a common goal.

Second, it's important to understand one thing: **businesses generate most of their revenue from large enterprises.** I bet it follows the [Pareto Principle](https://en.wikipedia.org/wiki/Pareto_principle), where 20% of your customers generate 80% of your revenue. So with that in mind, the question is how to have the server open source while still capturing the revenue from the 20% of customers. Well... this is what we are trying to understand. There are many good references out there, like GitLab, which charges for advanced features, or [Penpot](https://penpot.app/), which charges for control. Our hunch is that our model will be a mix of charging for advanced features or control and for hosting a complex infrastructure.

And here comes an interesting twist: *what about the 80% of users?* This is where traditional business people get uncomfortable. When you look at this from a monetary angle, they might feel like you are losing an opportunity to capture value there. But **what if the value they contribute back is not monetary, but marketing and contributions to the product, helping make it better for everyone?** When I first reached this idea by myself, it blew my mind. I could finally understand why something like Discourse or Grafana is so successful and why few to none can compete with them. Most of the people in that 80% group wouldn't have paid anyway.

Let's take all this framing further.

We are focusing on shifting value to the server, understanding the needs of the 20% of our customers, and building a mental model around where the line can be drawn. But not just that—in that future where Tuist becomes a community effort, **we need to make ourselves as dispensable as we can be.** In other words, can we shape a world where we can openly iterate on the product with a minimum cost for us? Definitely.

So we are focused on putting the right foundational pieces to ease contributions. If you look at our work in the past weeks, part of our focus has been on building a [design system foundation](https://github.com/tuist/Noora/) for the CLI and for the web app, such that contributing to Tuist feels like LEGO. You've got an idea for a new dashboard feature to build? Sure! Go ahead, prototype something, and open a PR. Our designers will play more of a reviewer role than an active contribution one. And what's even better than all of this is that GitHub is [doubling down on tools to leverage LLMs to review PRs](https://github.blog/changelog/2025-02-26-code-review-in-github-copilot-is-now-in-public-preview/). A few tests that we've done yield impressive results, so our coding will gear towards providing the right rules so agents can do a great job, and we are confident that the work does what it's supposed to do and aligns with the practices of the repo.

Besides what this means for the community, **we'd build the first open source app developer productivity platform for app developers**. Suddenly, it positions us with limited capital but with a world of contributions to expand Tuist in two directions:

* Into other app development lifecycle phases, for example, release automation. - Into other app development technologies, like [React Native](https://reactnative.dev/) or [Android](https://developer.android.com/).

In a traditional model, the above is done by raising endless capital, but that usually comes at the cost of potential misalignment of incentives and products "enshittifying" themselves. We don't want that for Tuist. Hence, we are embracing a model that allows us to create an innovative development environment where the community is an intrinsic part of it, with a world of opportunities to help teams build better apps.

I'm damn excited about this model!.
