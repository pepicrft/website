+++
title = "Remote macOS Containers as a Service"
description = "If we want more innovation in the mobile developer tooling space, we need to commoditize macOS containers."
tags = ["macOS", "DevX"]
published_at = "2025-05-05T12:00:00+00:00"
+++

I find it somewhat ironic that mobile CI companies that dominated the mobile automation space, amassed VC capital, and built the muscle to manage macOS environments see squeezing every dollar from their customers as their only way forward, while the rest of the industry could push for innovation if the management of macOS containers became cheaper and easier. There's never been a better example of [The Innovator's Dilemma](https://en.wikipedia.org/wiki/The_Innovator%27s_Dilemma) than this one.

Hence why I'm so excited about all the creative energy that's going into the space with projects like [Tart](https://tart.run), [Lume](https://github.com/trycua/cua/tree/main/libs/lume), or [Curie](https://github.com/macvmio/curie). Sure, there's still a long way to go, but incremental steps are being taken towards enabling that commoditization. Even Cloudflare announced [Linux Containers](https://blog.cloudflare.com/cloudflare-containers-coming-2025/) for their workers as part of the platform. Ideally, we move to a world where getting a virtualized environment is just one API call away.

I remember during my time at [Shopify](https://shopify.com) when we had calls with the [MacStadium](https://www.macstadium.com) team, my recurrent feedback was: you guys should productize your offering and make it developer-friendly. Many developer tools in the space, including [Tuist](https://tuist.dev), would pay for some kind of "Remote macOS Containers as a Service." Many developer tools require teams to leverage their CI/CD pipelines to build and push products. Imagine if you didn't have to do that. We want to move to a world with Tuist where you can create a preview or a release right from your phone. And for that, we need to access macOS environments quickly and cheaply.

I'd be lying if I told you that we are not already thinking and starting to put some work into making this happen. We are, and we want to offer that investment to our users so that organizations can reduce their costs down to just the infrastructure costs. It's easy. You place your AWS or [Scaleway](https://www.scaleway.com/en/) API keys, and we provision CI runners automatically or manually and plug them directly into GitHub or GitLab organizations. And those are the same environments that we can reuse to build your releases and previews, and sign your apps. No more YAMLs and complex automations. This is the world that we want to enable with Tuist.

[BuddyBuild](https://www.crunchbase.com/organization/buddybuild) was moving in that direction until Apple acquired them and thought what the industry needed was CI but embedded into Xcode. Once we complete the [current cycle](https://community.tuist.dev/t/we-kicked-off-the-1st-cycle-april-7th-to-may-18th/492), we'll start exploring this and content addressable stores. This is a muscle that we need to build because it'll bring the ecosystem closer to the developer experiences that other ecosystems have access to. And we'll advocate for any open source solution that gets us closer to enabling that future.

*This post is written by a human with its grammar reviewed with Grammarly.*
