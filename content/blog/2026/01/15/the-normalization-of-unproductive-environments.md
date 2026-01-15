+++
title = "The normalization of unproductive environments"
description = "One of the biggest challenges we face at Tuist is that teams have normalized working without data. They stack decisions that erode productivity, then throw resources at the symptoms rather than understanding the cause."
tags = ["Tuist", "Productivity", "Swift"]
published_at = "2026-01-15T12:00:00+00:00"
+++

One of the most challenging aspects of building Tuist as a company is something that took me years to fully understand: **teams have normalized working without data**. They operate in environments where they have no visibility into what is slowing them down, and they have come to accept this as just how things are.

This is a sad reality. Engineering teams work day after day without insights into where the productivity blockers are hiding. Which tests are flaky? Which ones take the longest to run? Where are the parallelization contention points in the build graph? Most teams cannot answer these questions. And here is the thing: they have stopped asking them.

## The slow accumulation of technical debt

In my experience, teams keep stacking decisions that have an impact on the health of their project, and this goes largely unnoticed. A new dependency here, a quick fix there, a "temporary" workaround that becomes permanent. Each decision seems small in isolation, but they compound over time into something that significantly degrades the development experience.

Teams do not wake up one day to a 30-minute CI pipeline. They get there through hundreds of small decisions, each one adding a few seconds, until one day someone asks, "Wait, has it always taken this long?"

When things slow down noticeably, the typical response is to throw more resources at the problem. Faster machines, more CI runners, additional engineers. These solutions are expensive, but they do not require much thinking. They treat the symptoms rather than the cause. I [wrote about this on the Tuist blog](https://tuist.dev/blog/2025/11/17/smart-before-fast): organizations spend hundreds of thousands on faster hardware when workflow optimization would cost a fraction and deliver better results.

## A surprising lack of engineering excellence

What surprises me the most is how many leaders out there are not being strategic about their engineering organizations. The average level of engineering excellence is quite low. Teams work in unproductive setups, and neither the engineers nor the leadership do anything about it.

I spent years at [Shopify](https://shopify.com), and they were unique in this regard. They continuously invested in making things better to stay competitive. Developer productivity was not an afterthought; it was core to how they operated. I thought this was the norm. It is not.

There is also the challenge of measuring developer productivity. The [DORA metrics](https://dora.dev/guides/dora-metrics-four-keys/) (deployment frequency, lead time, change failure rate, time to restore) gave us a starting point, but they require data that many teams simply do not have. You cannot improve what you cannot measure, and you cannot measure what you do not collect.

## The Swift ecosystem's misdirected energy

In the Swift ecosystem specifically, a lot of the collective mental energy goes into things that feel important but do not address the fundamental productivity challenges teams face. There is an endless quest for the perfect architecture. There is excitement about taking Swift to new platforms. There is continuous work to make the language more complex with new features.

I understand the appeal of these pursuits. They are intellectually stimulating. But meanwhile, we have been given the building blocks to improve the foundation we already have. We could reach a point where companies do not need to consider [React Native](https://reactnative.dev/) or [Flutter](https://flutter.dev/) because native development offers comparable productivity, including things like hot-reloading that make iteration fast and enjoyable. But here we are, having the same architectural debates we had a decade ago while the competition moves forward.

At Tuist, we spend our days talking to companies about how they can make better use of their resources. It is sometimes frustrating. The data is there, buried in `.xcactivitylog` files and `.xcresult` bundles, but it is proprietary, undocumented, and inaccessible. Teams know something is wrong, but they cannot articulate what exactly.

## The path forward: intelligence that works alongside you

I am optimistic that things can change. The combination of agents and runtime intelligence creates an opportunity we have not had before. Imagine a productivity partner that runs alongside your workflow, continuously analyzing what is happening and telling you where the slowness is coming from. Not a dashboard you have to remember to look at. Not CI logs you have to parse manually. Not metrics that require a data engineering team to make sense of.

This is where I see things heading. An agent with deep knowledge of your project structure, your build graph, and your test suite. Something that can tell you, "This test has been flaky 12% of the time this week" or "This module is a parallelization bottleneck affecting 40% of your builds." Something that can act on this information automatically, disabling flaky tests or suggesting build graph restructuring.

The technology is ready. The data exists. What is missing is the integration, the translation layer between raw build information and actionable insights. This is what we are building at Tuist.

I believe the Swift ecosystem can get there. It requires a shift in mindset from "this is just how Xcode development works" to "we deserve better, and we are going to build it." The tools and patterns exist in other ecosystems. There is no technical reason why iOS development should be less observable than web development.

The first step is acknowledging that the current state is not acceptable. The second is starting to collect the data. The third is acting on it. If this resonates with you, I would love to hear from you. We are building these tools, and every conversation helps us understand the problem better.
