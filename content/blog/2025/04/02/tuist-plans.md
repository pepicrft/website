+++
title = "Tuist's plans"
description = "This is an stream of thoughts around the future of Tuist."
tags = ["Business", "open-source"]
published_at = "2025-04-02T12:00:00+00:00"
+++

Since we decided to turn Tuist into a business to ensure we could continue supporting teams and individuals, we've thought a lot about what we want Tuist to look like in the future.

With codebases growing larger and the speed of business demands increasing, we believe Tuist should position itself as a productivity tool for app developers. The "app developers" part is crucial. While some challenges extend beyond app development, we believe app development is where we originated, where we understand the challenges thoroughly, and where we can deliver the most value. Other ecosystems already have established productivity solutions, so venturing into them would be counterproductive.

We believe we should cover the entire lifecycle, from the early stages of an app to its distribution and the scaling of its development. Apple provides some basic tools, but they are insufficient. Developers must handle initial plumbing themselves and eventually delegate it to what companies call "platform teams." We want to be that virtual platform team and eliminate all plumbing work. Tuist needs to feel "plug & play." Its adoption should be as simple as installing a GitHub App in your repository. The developer experience we aim to enable already exists in other ecosystems. The web has [Vercel](https://vercel.com). React Native has [Expo](https://expo.dev). We want to play a similar role in native development.

You might think you don’t need this—that you can grab the tools yourself and wire everything to build your own experiences. I understand. Many people felt the same about managing their servers and using [Kubernetes](https://kubernetes.io/) to orchestrate their own deployments. But let’s be honest: that’s fun to build, but not fun to interact with every day. All the energy spent maintaining such a stack is energy not directed toward solving problems. I like to say that your building momentum is frequently interrupted in app development. There’s something magical about doing a `git push` and seeing a URL to preview your changes shortly after.

Now the question is how to enable that future. We are limited in resources and capital. Some might see this as a limitation, but I see it as an asset. Limits force us to think creatively, and they’ve helped us realize that we have the most valuable asset in the developer ecosystem: a community. Communities take significant time and human capital to build, and at Tuist, we’ve invested heavily in that since we wrote the first line of code in 2017.

I touched on the role of communities in [the commoditization trap](__GHOST_URL__/blog/2025/03/31/software-commoditizes). The long-story-short version is that a community is the best asset a company can have these days. For instance, [Mobile CI is plateauing](__GHOST_URL__/blog/2025/03/25/mobile-ci-is-plateauing) because they failed to build a community. Every company builds communities differently. We want to grow ours on the same foundation that gave birth to the community: open source.

We had to close-source part of Tuist because the project was at risk of free-riding, but we want to return to everything being open source, and we have a plan in place for it. But first, let’s talk about open source for a bit.

We want to continue developing open-source technologies. We are shifting the focus away from project generation, so expect innovation in other app spaces. These are gifts to the community to foster innovation. We’ll then figure out how those technologies can be extended by leveraging the capabilities of a server to build a revenue source for the company. A server brings three elements:

* A remotely accessible database - A public HTTP interface to interact with - Background jobs

We envision a model where the client-side technology can work independently without the server. You can build your own server using our client-side open-source components if you want—they’ll be permissively licensed. We’ll support any open-source efforts that align with this direction, like [Lume’s virtualization solution](https://github.com/trycua/lume).

We’ll also make part of the server open source with a permissive license. This means you can self-host the server too and not pay a dime for it. You’re right—we need to address this. Experience has taught us two key lessons:

1. The needs of large enterprises differ greatly from those of small and medium companies. 2. Large enterprises are the ones with significant capital to invest in these tools.

Instead of trying to capture 100% of a market—which traditional companies attempt, only to end up building vendor-locked ecosystems—what if we figure out how to capture value from the 20% of large companies that could bring 80% of our revenue (Pareto principle at work)? We could treat the remaining 80% as companies contributing other types of capital: - Feedback - Word-of-mouth marketing - Code contributions

Business owners often view everything through a financial lens because it’s measurable. But there are other forms of capital that make a company valuable, which we continue to struggle to quantify. The companies that value these are the most likely to thrive.

For Tuist, we’ll place some features or capabilities under a different license that large companies would need to pay for, while everything else would be MIT-licensed with a ready-to-deploy Docker instance. Note that over time, hosting Tuist will become more complex—not because we’ll force complexity, but because it will naturally evolve, especially as we invest in capabilities like low-latency cache servers and features based on running ephemeral builds. At that point, even that 80% might be inclined to pay for us to host it.

This isn’t a new model. You see it in [GitLab](https://gitlab.com), [PostHog](https://posthog.com), [Cal.com](https://cal.com), and [Grafana](https://grafana.net). It’s just not common in the app development productivity space because companies there often have a strong sales and business profile. We’re bringing a different take on business.

There’s one catch to the open-source model: besides marketing being more effective because you build a loyal community that spreads the word organically (as opposed to throwing money at marketing, which is expensive and doesn’t guarantee results), you open yourself to a diverse pool of talent and ideas that contribute to the project. Let me tell you, you can’t beat a product built by a community. We’ve learned that with Linux. I’m surprised we haven’t seen more of this in this space. That’s why we’re enabling it with Tuist.

So, picture a world where Tuist is open source, with some enterprise-related features or capabilities under a different license.

To enable that vision, we are focusing strongly on the following pillars:

## Foundational blocks

We are investing heavily in automation and establishing the right foundations so people can build with them easily. Contributing to Tuist should feel like playing with LEGO. This is why we’re investing in a design system for the CLI and the web, Noora. Developers without much design experience can contribute features and design them themselves.

## Standardizing data and making it accessible

Apple’s development environment is well-known for its proprietary formats. We’re going to standardize them and make them accessible via the web. Want to access the results of your last build? It’s just one request away. The web is a tool for accessibility, so we’re embracing it fully. As part of Tuist, we’re building an API—currently used only by the CLI—but we plan to productize it so people can build their own tools with their project data. The API will be part of the product, not just an implementation detail.

## Virtualization capabilities

We’ll invest in developing the ability to run virtual ephemeral builds—first, to enable web-driven workflows like releasing an app or creating a preview with a button click, and second, to break the strong vendor lock-in organizations face with CI providers, allowing them to take control of their data and infrastructure.

## Top-notch DX

Developer experience (DX) is front and center in Tuist. We can’t afford to degrade someone’s experience compared to Vercel, Supabase, or Linear. Tuist needs to be a joy to use—something whose value is conveyed through its design. We don’t want it to be a tool made by developers trying to be designers. No, we need to think deeply about design, crafting workflows and visual hierarchies that are delightful to navigate.

I’ve never been this excited about Tuist’s plans. I firmly believe this strategy will pay off in the long run. As mentioned, it requires significant human and time capital investment. But while other companies come and go, outcompeted by better open-source alternatives, we’ll keep rowing, building the best and most open development productivity tool for app developers.
