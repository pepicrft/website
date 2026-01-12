+++
title = "Makers and takers"
description = "In this blog post I reflect on Dries Buytaert's piece about balancing makers and takers in open source, and how it relates to Tuist."
tags = ["open-source", "Sustainability"]
published_at = "2024-10-13T12:00:00+00:00"
+++

I recently came across [this piece](https://dri.es/balancing-makers-and-takers-to-scale-and-sustain-open-source) by the creator of Drupal, [Dries Buytaert](https://dri.es/about), and it helped me articulate, through mental models, how I've been thinking about open source sustainability.

Open source and free software are **non-excludable** and, contrary to what many believe, **rivalrous**—because the resources available to maintain and improve them are limited. This makes them a [common good](https://en.wikipedia.org/wiki/Common_good), a concept I first encountered while reading the book [Working in Public](https://press.stripe.com/working-in-public).

However, I hadn't fully realized that, from the perspective of open source companies like the one we are building at [Tuist](https://tuist.io), open source is also rivalrous in another way: the shared resource is the **customer**, who cannot be shared by two companies at the same time.

**Tuist has become a common good.** And like any common good, it began to experience the [tragedy of the commons](https://en.wikipedia.org/wiki/Tragedy_of_the_commons)—sustaining the project became increasingly difficult. When you reach that point, you must consider how to balance the makers and the takers. Otherwise, the project will die. This is something I’ve observed in many open source projects in the ecosystem where Tuist operates: they struggle to keep up with demand and slowly fade away.

In [his blog post](https://dri.es/balancing-makers-and-takers-to-scale-and-sustain-open-source), and drawing on ideas from past research, Dries shares three patterns to address this issue, which we have considered at Tuist:

1. **Self-governance:** This is unfeasible at a large scale where many takers have conflicting interests. Making this work would require most of the limited resources available to be spent on governance. 2. **Privatization:** This is the approach we are currently exploring at Tuist, similar to what companies like Mozilla have done. Through our [paid server features](https://docs.tuist.io/en/server/introduction/why-a-server), we gain a commercial advantage over takers, while still creating a positive social impact for all users of the open source project, including the takers. In other words, privatization allows for a win-win scenario. 3. **Centralization:** This approach mirrors how governments manage common goods (e.g., highways). In open source, we see this in foundations that govern projects. The challenge with this model lies in the accuracy of monitoring and the effectiveness of rewarding (or sanctioning). As Dries notes:

> Because Open Source contribution comes in different forms, tracking and valuing Open Source contribution is a very difficult and expensive process, not to mention full of conflict. Running this centralized, government-like organization also needs to be paid for, and that can be its own challenge.

It's reassuring to see that what we are experiencing at Tuist is not unique. The imbalance created by having more takers than makers is a common problem in open source, and there are ways to address it. We've discarded self-governance and centralization for now due to the costs involved. Instead, we are exploring privatization as a way to bring in funding to support continued open source development.

Not long ago, a new group of licenses emerged: [fair](https://fair.io). These licenses look promising as a way to explore open-sourcing the innovations we are bringing to the server.
