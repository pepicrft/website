+++
title = "Dogfood if you can"
description = "If you can dogfood your product, do it. It's a great way to build a better product."
tags = ["Product"]
published_at = "2025-03-12T12:00:00+00:00"
+++

I've noticed that when using various products, I frequently encounter frustrating bugs that seem obvious - issues I would have fixed immediately had it been my own product. This is precisely why I'm drawn to open source software: the ability to directly implement fixes and submit pull requests to repositories.

When developers regularly use their own products (dogfooding), they naturally identify and address pain points. Without this practice, teams must rely solely on empathy for users' challenges. In our increasingly individualistic society - partly influenced by current social media dynamics - genuine empathy is becoming less common.

Entire ecosystems suffer from this disconnect. Take localization tools, for instance - using them often leaves me wondering if their creators have ever experienced them from a user's perspective. Investigation typically reveals they don't localize their own tools, which explains the subpar user experience.

While dogfooding can be challenging in some contexts, leadership should integrate it into company culture whenever possible. During my time at Shopify, though developers rarely maintained their own stores, they utilized a tool called "tophat" that simplified testing new changes. This led to more meaningful code reviews based on actual usage experience rather than just inspecting code or confirming passing tests.

At Tuist, we build our CLI and app using our own tools, using them daily. This creates a natural alignment between the improvements we identify and the needs of our users. While users typically only report major blockers, daily usage reveals numerous small opportunities for enhancement that collectively create exceptional products no competitor offers.

For example, we recently began improving our CLI's user interface, not because of user complaints, but because our own daily usage showed clear opportunities for enhancement. This approach to continuous refinement is what makes products like Linear superior to alternatives like Jira.

Developer tools are uniquely positioned to benefit from this practice. Developers at GitHub use GitHub; developers at GitLab use GitLab. Companies that create developer tools without using them internally are missing a crucial opportunity, and their products inevitably reflect this disconnect.
