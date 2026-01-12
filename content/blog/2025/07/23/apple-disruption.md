+++
title = "The coming disruption of Apple developer tooling"
description = "GitHub Actions and commoditized Mac infrastructure providers like Namespace are disrupting the stagnant Apple developer tooling market, enabling innovative alternatives to traditional pipeline-centric CI solutions."
tags = ["Tuist"]
published_at = "2025-07-23T12:00:00+00:00"
+++

Markets are supposed to be this tool that forces companies to compete, transitively building products that are more aligned with users' expectations.

This is the theory, but whether it unfolds and how really depends on the market. We developers of apps for the Apple ecosystem are a bit unlucky. The incentives for diverse competition are not there.

First, the market is big, but not big enough. Second, Apple has significant say and control in the ecosystem, and third, anything that you do for the ecosystem is an act of reverse engineering proprietary and undocumented technologies. We at Tuist know that well.

The consequence is that we don't see much innovation. Either you wait for Apple to come up with something innovative, or you hope for another company to have a culture of innovation. Sadly, neither of the two is happening.

Outside of Apple's factory, companies have gone for the safe bet. The problem and solution that have for many years been validated: CI. Same model repeated over and over: a pipeline, most likely YAML, a UI to see the logs and exported artifacts, and all the glue with the Git forge. Different package, same product. Apple adds the twist (on purpose?) of making their hardware infrastructure-unfriendly, so CI companies usually go from adding a little margin to infrastructure managed by other companies and eventually attempt to own the vertical themselves to have better cost control. BuddyBuild tried to bring some fresh air to the space by challenging YAML pipelines, but Apple went their own way with the product.

CI companies have some foundational blocks to enable innovation—Mac infrastructure and capital—but they struggle at innovating. Product-wise, everything becomes pipeline-centric. Want to automate your release? It's a pipeline. Want to optimize your builds? It's in your pipeline too. And analytics? In the pipeline with the steps that we provide. I'm sure this all sounds familiar.

But sometimes miracles happen. A bigger fish makes an impactful decision, and suddenly the models can be challenged. This is the case with Git forges like GitHub opening up the vertical and making layers replaceable. They solved the topmost layer of CI and gave accounts the option to bring in third-party runners by themselves or from third-party companies. Companies like CirrusLabs or Namespace can commoditize a piece of the infrastructure that was previously reserved for CI companies. MacStadium had a huge opportunity there and failed to take advantage of it.

Sticking to GitHub CI or the equivalent in other forges has something interesting that helps move the ecosystem to a better place. It's so easy to switch providers that companies in the space are more incentivized to provide better and cheaper Mac environments if they want to capture the market. It's also cheaper for you as a user because you go one level lower, and the experience is so much better because it's tightly integrated into the platform where code collaboration happens.

And this move has cascading consequences that can further impact the ecosystem. If Mac environments get better, cheaper, and more commoditized, like with Namespace, which provides an API to get Mac environments, then it opens the game to new players like Tuist that have limited financial capital but huge creative capital. We are not a pipeline-centric product. We want to explore creative ways to solve challenges that developers face.

Now, CI companies won't want this to happen. They are already working on redefining themselves as Mobile DevOps platforms, hoping that companies' perception of the cost of migrating and value remains in their favor. But OMG, LLMs have challenged that too. You can ask a model to migrate a pipeline back to GitHub Actions, and voilà, it'll certainly do the work very reliably. This will take time for organizations to realize, but I'll help create awareness around this.

While the incentives to build for the Apple dev tooling market are not that high, and that makes it trickier to attract capital to support making an impact, changes like the ones we are witnessing since the appearance of GitHub Actions make it more accessible and allow players like Tuist to play the game with a different form of capital—one based on human capital and their ideas. So yes, I talk a lot about Namespace because I deeply care about our users and, more importantly, about having the foundation to enable more innovation in the space. I believe Namespace and their commoditized infrastructure can make a big difference, from being able to release by clicking a button on a website to building apps remotely from non-macOS environments.
