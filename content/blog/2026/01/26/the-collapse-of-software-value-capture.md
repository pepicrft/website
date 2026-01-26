+++
title = "The Collapse of Software Value Capture"
description = "How the move from closed source to services created new business models, why open source spoiled those models, and what happens when everything collapses to Markdown, SQLite, and CLI tools you run yourself."
tags = ["Software", "Business Models", "Open Source", "SaaS", "Value"]
published_at = "2026-01-26T09:00:00+00:00"
+++

There is a quiet crisis unfolding in software, and most people in the industry don't want to talk about it. The business models that sustained an entire generation of software companies are quietly collapsing, one self-hosted tool at a time.

I've been watching this unfold for years, and it's reaching an inflection point.

## The Golden Age of Value Capture

Software companies figured out how to capture value in the 1990s and early 2000s. You sold a perpetual license, and customers paid you for the right to run your software on their machines. Microsoft Office cost a few hundred dollars, and you owned it forever. Encyclopedia Britannica cost thousands, and your library had it on shelves for decades.

The model was simple: you write code, customers pay you, and they run it indefinitely on hardware they control. The value you capture comes from intellectual property and the ongoing cost of maintaining and improving the product. There's a clear transaction: they pay, they get the software, and that's the end of it.

Then something shifted.

## The Move to Services

The industry gradually moved from perpetual licenses to subscription services. Salesforce led the way, proving that selling access to software delivered over the internet was not just viable but potentially more valuable than the old model. Why? Because you get a lifetime value of a customer that compounds over time, not just a one-time payment.

When a customer pays you $100/month for your SaaS product instead of $500 once, you're capturing more value over the long run, assuming they stick around. This changed everything. Companies optimized for retention, for reducing churn, for making the cost of leaving higher than the cost of staying.

The subscription model also meant continuous revenue, which made companies more investable. You could raise capital against a predictable monthly stream. You could hire more people. You could build bigger products. The entire venture capital dynamics of the software industry shifted because of this model.

## Open Source Spoils the Party

Then open source happened, and it spoiled everything.

Not because open source is bad. Open source is wonderful. Open source democratized access to incredible tools that would have remained expensive or unavailable otherwise. But open source also meant that anyone could take your code, host it themselves, and get the benefits of your software without paying you the subscription.

We've seen this play out in countless markets. WordPress is free, so companies building CMS products have to compete with a zero-cost alternative that you can run anywhere. PostgreSQL is free, so database companies have to offer something beyond the database itself. Linux is free, and that one probably ended more companies than we can count.

The companies that survived this transition figured out that they needed to provide value beyond the software itself. They needed to build ecosystems where leaving had a cost that wasn't just technical.

## The Ecosystem Play

GitHub is the masterclass in ecosystem lock-in. When you host your code on GitHub, your profile is there. Your stars are there. Your contribution graph is there. Your followers are there. Your actions workflows are there. Your packages are there. Even if GitHub's pricing became unreasonable, the cost of moving is higher than the cost of staying because you would lose all of that accumulated social and technical capital.

This is a brilliant business strategy, and it's also a user-hostile one in some ways. You're not just paying for hosting code. You're paying for the ecosystem effects that keep you there. GitHub understood that they weren't selling version control. They were selling a platform that gets more valuable the more you use it and the more your network is on it.

Not every company succeeded at this. Look at CI companies. They built ecosystems where you could share steps, share configurations, share entire pipelines. But there's no real incentive for the ecosystem to grow because step authors don't capture value from their contributions. If I write a killer CI step for deploying to a niche platform, who pays me? Nobody. The CI company captures all the value from the ecosystem while contributors give away their work for free.

Compare this to Apple's App Store, where developers capture real revenue from their contributions. Or to Salesforce's AppExchange, where partners build businesses on top of the platform. Those ecosystems work because value flows to the contributors. CI ecosystems are hollow because they extract value from the community without returning it.

## What Companies Actually Provide

So if open source means anyone can run the software themselves, what do software companies actually provide? Why would anyone pay for something that's available for free?

The honest answer is that companies provide liability, reliability, and expertise.

When you run software yourself, you're liable if there's a security breach. If you host your own database and someone steals your customer data, that's on you. If you run your own authentication system and it gets compromised, you face the consequences. Some organizations cannot accept that liability. They need a company to take ownership of security and compliance.

Reliability matters too. If your self-hosted tool goes down at 3 AM, you're the one who has to fix it. If the SaaS version goes down, you have someone to call, someone who is responsible for bringing it back. Some organizations value that support contract more than the software itself.

Expertise is the third pillar. When you use a specialized tool and you run into problems, who helps you? The community might answer questions on forums, but they have no obligation to you. A company selling you the tool has every incentive to help you succeed because your continued payment depends on it.

These three things are real value. Companies that provide excellent support, rock-solid uptime, and genuine expertise can survive in an open-source world. But the bar is high, and the software itself is no longer the differentiator.

## The Collapse to Personal Infrastructure

Here's where things get interesting. We're now seeing a generation of tools that collapse the entire value proposition down to personal infrastructure that individuals control.

I've stopped paying for to-do apps because I can manage tasks through a CLI on my own system. I've stopped paying for recipe apps because I store the recipes I care about in Markdown files that I control. I've stopped paying for note-taking apps because SQLite and a few scripts do everything I need.

This isn't about cost, though it's certainly cheaper. It's about control. When I own my data in formats I control, with tools I can inspect and modify, I'm not dependent on a company's pricing decisions, feature priorities, or survival. My infrastructure is mine.

The tools enabling this shift are remarkable. You can run a remarkably capable personal database with SQLite. You can build workflows with tools that run in your terminal. You can store information in plain text files that will be readable in fifty years, not in some proprietary format that might not exist next year.

And this isn't just for developers anymore. The tools are becoming accessible enough that non-technical people can benefit from self-hosting. Raspberry Pis are powerful enough to run useful services. Docker makes deployment tractable. Projects are spending real effort on making installation easier.

## The Clawdbot Problem

Clawdbot crystallizes this shift in a way that's hard to ignore.

Clawdbot is, depending on your perspective, either a remarkable open source project or an existential threat to an entire category of SaaS businesses. It does what companies like Zapier, Make, and dozens of workflow automation platforms do. It connects services, orchestrates data flows, and automates complex processes.

But Clawdbot doesn't require a company to run it. You can install it on a Raspberry Pi, run it for years on minimal hardware, and only pay for the AI API calls you actually use. There is no subscription. There is no tier pricing. There is no sales team. There's just software that you run yourself.

This is deeply annoying for the companies that built those workflow platforms. They spent years building features, optimizing UX, creating integrations, and convincing users to pay monthly fees. Now someone can get equivalent functionality for the cost of electricity and API tokens.

And Clawdbot is just the beginning. We're going to see more tools like this. Tools that automate tasks that companies currently charge for, tools that can run on hardware you own, tools that don't require a business to exist between you and the functionality you need.

## The AI Acceleration

AI makes this worse for traditional software companies and better for self-hosted alternatives simultaneously.

Training on your own data becomes possible. You can run models that understand your specific context, your specific tools, your specific needs. You don't need a company to provide that because the models are available and the infrastructure to run them is increasingly accessible.

The argument that "AI requires massive compute that only companies can provide" is weakening. Yes, training large models requires resources. But inference is increasingly affordable, and many use cases don't need the largest models. You can run useful AI on consumer hardware for many applications.

And if you can run AI locally, you don't need a company to provide it. You don't need to send your data to a service somewhere. You don't need to pay a subscription for AI features. You can have an AI assistant that runs on your machine, that knows your files, that helps you with your specific context.

## What Remains for Companies

This doesn't mean all software companies are doomed. It means that the value capture mechanisms that worked for twenty years are no longer automatic.

Companies that provide genuine expertise will continue to thrive. If you're building something genuinely novel that requires specialized knowledge, customers will pay for access to that knowledge. But companies selling commodity functionality wrapped in a subscription will struggle as self-hosted alternatives mature.

Companies that provide legal and compliance coverage will continue to find customers. Some industries require vendor contracts, audit trails, and liability transfer. Those businesses will persist, but they'll compete increasingly on service quality rather than on feature lock-in.

Companies that build genuinely valuable ecosystems where contributors are rewarded will continue to exist. But those ecosystems need to offer real value to contributors, not just extract free labor. Apple's App Store works because developers make money. Salesforce's ecosystem works because partners build businesses. Extractive ecosystems that treat contributors as free labor will lose to alternatives.

## The Opportunity

Despite all of this, I think there's an incredible opportunity for companies that approach this honestly.

What if you built a platform for self-hosted AI assistants? Not one that locks users in, but one that makes it easy to run, update, and manage AI tools on your own infrastructure? What if the business model was support and enhancement rather than lock-in and metered access?

What if you built tools that worked the same whether you ran them yourself or used a hosted version? No artificial distinctions between self-hosted and cloud, no premium features withheld from one version. Just excellent tools that respected user autonomy.

What if you focused on the problems that genuinely require expertise? Security auditing, compliance implementation, performance optimization at scale. Things that individuals can't easily do themselves and that require ongoing specialized knowledge.

The companies that will thrive in this new era are the ones that stop trying to capture value through lock-in and start providing value that customers choose to pay for. That's a harder business to build, but it's also a more honest one, and I suspect it will be more resilient in the long run.

## The Personal Compute Renaissance

We're entering what I call the personal compute renaissance. After decades of centralization toward cloud services, we're seeing a pendulum swing back toward personal and local infrastructure.

This is driven by multiple forces: the maturation of self-hosted tools, the increasing accessibility of capable hardware, the growing awareness of data sovereignty issues, and the demonstrated fragility of relying on services you don't control.

The software industry is going to look very different in ten years. The default will no longer be "pay a monthly fee for access to functionality." The default will be "run the tools you need on infrastructure you control, and pay for support if you want it."

Some of this will be driven by ideology. People who care about digital autonomy will choose self-hosted options because they align with their values. But most of it will be driven by economics and practicality. Self-hosted tools that work well will simply be better options for most use cases.

## What I'm Doing

I've been moving more of my personal infrastructure to self-hosted tools over the past few years. I run my own notes system, my own task management, my own CI, my own AI assistants. I've reduced my dependence on cloud services and increased my control over my own digital life.

This is not for everyone. It requires comfort with the command line, willingness to maintain your own infrastructure, and tolerance for occasional friction. But the tools are getting better, and the friction is decreasing.

The future belongs to tools that respect their users, and to companies that provide genuine value beyond the software itself.
