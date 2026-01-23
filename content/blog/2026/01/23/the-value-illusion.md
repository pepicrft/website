+++
title = "The value illusion"
description = "A reflection on what 'providing value' really means in software, why traditional business models are built on artificial limits that AI is tearing apart, and how embracing constraints can lead to more sustainable approaches."
tags = ["Business", "Open Source", "AI"]
published_at = "2026-01-23T12:00:00+00:00"
+++

I had a conversation with a founder recently about building software businesses. Throughout our exchange, one phrase kept surfacing: "focus on providing value to users." It sounded noble, almost unquestionable. Who could argue against providing value? Every company claims to do it. Every pitch deck leads with it. But the more I thought about it, the more I realized this phrase often obscures what people actually mean.

What I suspect they really mean is capturing value. And there's a significant difference.

## The ownership question

When you build a traditional software company, your employees sign contracts that grant you ownership of the code they write. Every line belongs to the organization. This creates a clean story for investors and potential acquirers: here's our intellectual property, here's what you're buying, here's the moat we've built.

Open source complicates this narrative. When you build in the open, there's no singular owner of the code. Contributors relate to it through the terms of a license. The code belongs to everyone and no one simultaneously. For some, this makes the software less attractive as an asset, less valuable in the traditional sense of what can be owned and sold.

But this framing assumes that software itself is the valuable thing. And increasingly, that assumption is falling apart.

## Software's inherent problem

Software has properties that make it terrible for traditional business models. It can be copied infinitely at zero marginal cost. It can be studied, understood, and replicated. Its functionality can be reproduced by anyone with enough time and skill.

This was manageable when "enough time and skill" meant years of engineering effort. But we're living through a fundamental shift. AI is making software production cheaper and faster every month. What once required a team of engineers working for a year might soon be achievable in weeks. The [defensible business advantages that companies spent a decade building are becoming commodities overnight](https://liatbenzur.com/2025/07/20/data-moats-dead-new-competitive-advantages-ai/).

Your carefully crafted codebase, your elegant architecture, your unique implementation details... all of it can be replicated by competitors with access to the same AI tools you have. The moat you thought you were building is filling with water from all sides.

Yes, there's brand. Yes, there's distribution. Yes, there's the accumulated trust of existing customers. These matter. But if your entire strategy relies on the software itself being defensible, you're building on an increasingly unstable foundation.

## The artificial limits

Here's what's interesting about this moment: much of the software industry has been sustained by artificial limits. Closed source creates scarcity where none naturally exists. Proprietary formats create switching costs. Complex deployment requirements create dependencies on specific vendors.

These aren't value creation. They're value capture mechanisms dressed up as products.

AI is systematically tearing these apart. When an AI can understand your API and help someone build a compatible alternative, your "ecosystem advantage" evaporates. When deployment complexity can be abstracted away by intelligent agents, your professional services revenue disappears. When the cost of building software approaches zero, the question becomes: what were you actually selling?

Research suggests that [most AI startups built as wrappers around existing APIs have zero moat and zero differentiation](https://medium.com/@iram.ahmed1997/the-ai-reckoning-why-the-bubble-is-bursting-in-2026-and-what-we-can-still-build-from-the-ruins-2388aa8bbc4f). The same fate awaits traditional software companies that rely on artificial scarcity rather than genuine value creation.

## Our experience at Tuist

At [Tuist](https://tuist.dev), we know this dynamic well. It's funny, actually. Many people look at us and see developers who don't understand business. Just idealistic engineers who open-sourced their work without thinking about monetization. The reality is quite different. We're engineers who think deeply about business, precisely because we understand software's inherent properties.

We transitioned Tuist from a CLI tool to a server, and we're now moving into infrastructure. Not because we're randomly pivoting, but because we're following where genuine value can be captured without creating artificial limits that don't make sense. Project generation? That's a commodity now, a gift to the community. Server-side optimizations like selective testing and binary caching? There's value there, but only when paired with the infrastructure that makes them work at scale. Hosting, maintaining, and scaling these systems for teams who'd rather focus on their own products? That's where sustainable value lives.

We don't like creating artificial limits. We find it philosophically distasteful, but more importantly, we find it strategically foolish in a world where AI can tear down any artificial barrier you construct. What you think is your moat is someone else's weekend project with the right AI assistance.

## The choice we all face

This presents every software company with a choice. You can embrace traditional business models, believe you have a moat, and hope that AI won't undermine your position before you've extracted enough value to exit. Many companies are making this bet. Some will win it.

Or you can embrace the uncomfortable truth that we're all building on shifting sand. That the software industry has sustained itself on artificial limits that are collapsing. That the companies likely to thrive are those building genuine value that doesn't depend on artificial scarcity.

This second path has a caveat: it takes longer to build a business this way. [Open source business models require constant reflection on core purpose and value proposition](https://www.generativevalue.com/p/open-source-business-models-notes). You can't just build a feature, slap a paywall on it, and call it a day. You have to think about what value you're actually creating, where it lives, and how to capture enough of it to sustain your work.

At Tuist, we've embraced this path, and we've also embraced the resource constraints that come with it. Having a small team with limited capital forces creativity. It forces us to think carefully about what actually matters. It forces us to produce more with less, to focus on genuine value rather than the appearance of it.

Companies like [Grafana](https://grafana.com/) and [Sentry](https://sentry.io/) have proven that this approach can work spectacularly. They've shown that if you're open, if you genuinely serve your community, you can become a dominant player with momentum that's nearly impossible to compete against. The key is patience and genuine commitment to the model.

## What value really means

Everyone wants to provide value to users. It's a universal claim because it's universally good-sounding. But the question beneath the question is: what kind of value, and how does it relate to what you capture?

If your value proposition depends on keeping users from leaving through artificial barriers, you're not providing value. You're extracting it. If your business model requires obscuring how things work so competitors can't replicate them, you're building on borrowed time in an age where AI makes obscurity nearly impossible to maintain.

The companies that will thrive are those whose value proposition is genuine: they make things genuinely better, they operate at a scale or with an expertise that can't be easily replicated, they build communities and ecosystems that people want to be part of for reasons beyond lock-in.

Value, we all want to provide it. But in a world where software is commoditizing faster than ever, where AI is dissolving traditional moats, where artificial limits are being systematically dismantled, we have to be honest about what that means. It means building something real. It means being useful in ways that don't depend on keeping people trapped. It means accepting that the old playbooks might not work anymore.

At Tuist, we're betting on openness, on community, on genuine usefulness. We're betting that resource constraints and transparency will force us to be better, not worse. We're betting that taking longer to build something sustainable is better than racing to capture value before the foundation collapses.

It's a harder path. But it might be the only one that leads somewhere worth going.

Sources:
- [Data Moats Are Dead: The New Competitive Advantages in an AI-Everything World](https://liatbenzur.com/2025/07/20/data-moats-dead-new-competitive-advantages-ai/)
- [The AI Reckoning: Why the Bubble is Bursting in 2026](https://medium.com/@iram.ahmed1997/the-ai-reckoning-why-the-bubble-is-bursting-in-2026-and-what-we-can-still-build-from-the-ruins-2388aa8bbc4f)
- [Open Source Business Models: Notes on Profiting from Free Software](https://www.generativevalue.com/p/open-source-business-models-notes)
