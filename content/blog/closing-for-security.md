+++
title = "Closing for security"
date = 2026-06-26T09:00:00+00:00
slug = "closing-for-security"
description = "Daytona went closed source yesterday, and the reasoning was security. Look at these moves through the lens of business instead, and a different and more honest story shows up."
[taxonomies]
tags = ["Business", "Open Source", "Infrastructure", "AI"]
+++
Yesterday [Daytona](https://compute.daytona.io/) went closed source. A lot of how they framed it reminded me of [Cal.com](https://cal.com), who did something similar not too long ago and supported the move by pointing at security.

These moves are hard to understand when you don't look at them through the lens of business. For most software companies, software is intellectual property, an asset with a value. When your software is open source, you don't fully own that asset. Every contributor holds a piece of the cake. Investors tend to dislike this, because they see it as gifting away something the company has invested in. What they often miss is that open source, when it's done well, can lead to a much better and more financially rewarding business.

The trick is that you need to make something else your moat. You can build a loyal user base that connects with your brand. You can take on the operational complexity of running the thing reliably, fast, and securely, which is work most companies are unwilling to do. Or you can draw a line the way [GitLab](https://gitlab.com) does and put some enterprise features behind a different license. That last one works in some ecosystems and product shapes, but not in all of them.

## The sandbox domain

The sandbox space is an interesting one, and it reminds me of a post I read about [the margins database companies have](https://www.bitsxpages.com/p/the-broken-economics-of-databases). Companies like Supabase don't develop the underlying technology, they contribute to it. Supabase does that with Postgres. So they end up relying on the fact that operating the thing is complex, or on making everyone believe it is complex and not worth their time. The alternative is to complement the core offering. You host a database, and then you also let people run functions as a side effect of operations, or you hand them an SDK so they can add authentication to their app. Look at a product like Lovable and you see the same bet, except the product gets confusing fast, doesn't it?

The problem in the sandbox space is that there are already thousands of options. It's an obvious solution that was on the path to commoditization the moment it became popular, and it's a sexy thing every founder wants to jump into, because it enables the kind of per-minute granularity everyone prefers, the same way people prefer paying per token over a subscription. Every day someone takes a VM solution, runs it on virtual or physical machines, rented or owned, wraps an API around it, and calls themselves a Sandbox as a Service provider.

They are limited in how they can innovate, so they gravitate toward the obvious. They try to compete on performance. But does it really matter that you shaved 200ms when the agentic session is going to run for ten minutes? I don't know. And if Anthropic gives its users the flexibility to swap the sandbox, these providers rush to make Anthropic their go-to-market, because otherwise they are competing with companies like Daytona throwing millions of dollars at building a movement around themselves. Remember serverless? Same script.

## Back to open source

So innovating in hardware can't make much of a difference. At the software layer there are thousands of others doing the same thing. And even if you had a genuinely creative idea, surprise, it turns out you are building on a way of working that someone could replicate in a day. If you believe they won't because your code is closed source, you have a very myopic understanding of how this works.

What you are left with then is to follow the script. You make your investors believe your code is an important asset no one else will be able to replicate, and you keep inflating what users and investors think you are bringing to the table. As a developer, all sandbox providers look the same, really.

This is what we see over and over. In a pure closed source business you might not see it as clearly, because those conversations happen in private rooms. But when you are open source and you start to feel the pressure, the most common manifestation is closing everything down to protect the intellectual property, while telling the world you did it for security.

That's how it works. You have to align your approach to business with the mental models of the people who make it possible for you to throw big parties and stand out over everyone else shipping compute wrappers.

Good luck.
