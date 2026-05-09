+++
title = "The company before the tools"
date = 2026-05-09T08:00:00+00:00
slug = "the-company-before-the-tools"
description = "Layoffs are the bill for designing companies in a world that no longer exists. With the cost of building collapsed, small teams can finally design how they want to work first, and shape the tools around that, instead of bending themselves to off-the-shelf opinions."

[taxonomies]
tags = ["Building", "Business", "Tuist", "AI", "Tooling"]
+++
There has been a wave of layoffs lately, and I keep coming back to it. Coinbase. Cloudflare. A long list of others. I have been part of one of those layoffs myself, on the receiving end, and I can confirm there is nothing fun about it.

What I cannot stop thinking about is the reasoning behind them. Listening to founders and CEOs talk about why they are doing this, the answer that emerges is not really “things got worse.” It is more uncomfortable than that. It is “we designed our company years ago, and the shape we ended up with no longer fits the world we are in.” Some of the people they hired are excellent at executing the old shape. Some do not want to embrace the new one. That is a brutal position to be in, and I understand why it ends in layoffs even when nobody wants it to.

I am writing this from the other side. From the side of designing a small company today, with a clean sheet of paper, while watching this play out.

## The Shopify thing

When I worked at [Shopify](https://shopify.com), one of the things that quietly shaped my thinking was how they treated internal tooling. Most companies I had seen, including ones I had been part of, would reach for whatever the market offered. Linear, Jira, the CRM of the moment, the support tool of the moment. The tools came with their own opinions about how work should happen, and the company quietly bent itself around those opinions.

Shopify did the opposite. They thought about how they wanted to operate, and then they built tools that supported that. They had the resources to do it, of course, and at the time that felt like a luxury reserved for companies of their size. If you were a small team or a single founder, the cost of building and maintaining your own internal stack was prohibitive. So you did the only thing you could do: you adopted the tools other people made, and you absorbed their model of work.

That equation has flipped.

## The cost of building has collapsed

The cost of producing code is at a historic low. The cost of running it on infrastructure is at a historic low. The cost of designing thoughtful interfaces, when you can lean on a design system and a coding agent, is at a historic low. There has never been a better moment to sit down and ask the question that used to be a luxury: how do we want to work, and what would the tool that supports that look like?

This is something we can afford to do at [Tuist](https://tuist.dev) precisely because we are tiny. We do not have to nudge dozens of people in a particular direction. We can spend a week thinking about how we want to do something, and another week translating that into the tool that supports it. A lot of what makes a company run is common sense and pattern matching from what others have done. There is good literature out there. But there is also something specific to our space, our values, the way we like to work, and that part is not in the literature. Someone has to take the time to think about it, and then translate it into the tools.

## What we built first

We built an internal tool we call [Atlas](https://pepicrft.me/blog/atlas/). I have written about it already, but let me share what we have actually done with it lately.

I started with the CRM side. We dropped the CRM we were using and moved everything to Atlas. Then we plugged in the sources of signal we already had:

- Transcripts from [Granola](https://granola.ai)
- Conversations on Slack, including the shared channels we have with companies
- Email threads
- Product usage data

From there, Atlas builds a profile for every account, and agents nudge me towards the things that are likely to matter. Not “send a generic check-in.” More like “this conversation three weeks ago was about a feature you just shipped, this is a good moment to follow up.” Because Atlas can read how a customer is using the product, it can also suggest features they have not tried yet but probably should. That is the floor. We will keep raising it.

## The Zapier-shaped trap

There are CRM tools out there leaning hard into agents. I look at them and I see something that feels broken to me. They are, in essence, Zapier-shaped. Connect this API. Connect that one. Build an orchestrator over the orchestrator. The reason this happens is structural: a tool that wants to fit every company has to be designed against the lowest common denominator of all the other tools out there.

When you build for yourself, the equation is different. You do not need to integrate with every CRM in the world. You need to integrate with the systems you actually use. And ideally, once your tool integrates with them well, some of those systems are no longer necessary. The CRM we were using, in the end, was a database wrapper with a few nice features on top. We copied the features that were useful, and we dropped the wrapper.

There are tools where reinvention does not make sense. We use a service to sync our banking data and give us financial insights, and replicating it would be silly. That is a regulatory and data-source problem more than a product problem. But most everything else, at least in our case, is replicable. More than people realise.

## What is next

We are looking at support next. Then development operations. I can already picture Atlas reading an alert from [Grafana](https://grafana.com), doing an initial investigation against the codebase, opening a draft PR with a candidate fix, and pinging the team with the reasoning. I can picture it drafting responses to community questions by reading the code and the docs. None of this requires a research breakthrough. The pieces exist. It is a matter of deciding to compose them around the company you want to be.

## Where I land

The layoffs we are seeing are, in part, the bill for designing companies in a world that no longer exists. I do not say that to be smug, because designing a company is hard, and the world genuinely changed faster than anyone expected. But the lesson, for those of us building now, is hard to miss.

You want people who can leverage these technologies to build first. People who look at the resulting system with curiosity, and want to contribute to making it better. The tools come from the company you want, not the other way around. The companies that internalise this and act on it are the ones I expect to compete on a different curve. The ones that do not, I suspect, will be writing the layoff blog posts a few years from now.

That is the company we want to build.
