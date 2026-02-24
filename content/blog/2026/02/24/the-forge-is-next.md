+++
title = "Headless development"
description = "Coding agents decoupled development from the editor. What follows is a new kind of platform where steering, reviewing, and collaborating on code looks nothing like what we are used to."
tags = ["AI", "Software", "Agents", "Infrastructure"]
published_at = "2026-02-24T10:00:00+00:00"
+++

We have a well-established concept in software: headless. A headless browser runs without a visible window. A headless CMS separates content from presentation. The pattern is always the same. You take something that was traditionally coupled to an interface and you remove that dependency so it can run anywhere, driven by anything.

I think we are watching the same thing happen to software development itself. Coding agents are turning development headless. The action, writing code, compiling, running tests, is being separated from the interface where it used to live: your editor, your terminal, your local machine. And just like every other headless transition before it, this one is going to reshape the entire platform around it.

## We tried this before

The idea of moving development off your local machine is not new. Cloud development environments have been around for years. [GitPod](https://www.gitpod.io/), Codespaces, various remote desktop solutions. The industry poured real money into making "code from anywhere" a reality. Even Shopify invested years into this before eventually stepping back. The vision was compelling, but the execution never quite landed.

I think the reason is that we were still too dependent on editors whose entire design assumed the action was happening locally. Extensions, language servers, debuggers, terminal integrations. Everything was built around the idea that your machine was both the steering wheel and the engine. Some teams pushed that model impressively far, but it always felt like you were fighting the architecture rather than working with it. And for platforms like Apple's, where the toolchain is tightly coupled to specific hardware and an environment that is costly to provision and run, the friction was even worse.

Cloud development tried to make the editor headless. But the editor did not want to be headless. It was designed around the assumption that it was the center of everything.

## Agents made it actually work

Coding agents did not try to make the editor work remotely. They made the editor optional. That is a fundamentally different move.

When you work with a coding agent, the relationship with the editor shifts. You prompt, you wait, you review, you iterate. The editor becomes a place to steer from, not a place where the action happens. That distinction matters more than it might seem at first.

This is exactly what companies like [Anthropic](https://www.anthropic.com) and [OpenAI](https://openai.com) are building toward. Claude Code can run headlessly. Codex spins up its own containers. The compute where your code builds and runs is no longer your laptop. It is somewhere else, managed by someone else, and that is fine because your job is to direct the work, not to host it.

Once you accept that separation, a lot of things start falling into place. Your physical machine is no longer a ceiling on how much agentic work you can parallelize. You are not bottlenecked by your CPU, your RAM, or the number of terminal tabs you can keep open. The constraint moves from hardware to orchestration. Development becomes headless, and the head, you, can be anywhere.

## Runtime review over code review

When development goes headless, the way we validate work changes too. Code review still matters, but runtime review is becoming the more important feedback loop.

What I mean by runtime review is the ability to see, feel, and interact with the result of the work. Not just reading the diff, but running the thing and experiencing it. This is not a new concept. At Shopify, we had a process called [tophat](https://shopify.engineering/shopify-tophat-mobile-developer-testing) where engineers would spin up a build of someone's branch and test it on a real device before approving. We brought a version of this to [Tuist as previews](https://docs.tuist.dev/en/guides/features/previews). And now coding agent platforms are building the same idea natively.

When [Claude Code introduced previews](https://code.claude.com/docs/en/overview), I found it entirely expected. If the agent is producing the code, you need a way to validate the output beyond reading lines of text. You need to feel it. In a headless development model, runtime review is the primary interface between you and the work. The code is an implementation detail that the agent manages. What you care about is whether the thing works, whether it feels right, whether it does what you intended.

In some side projects where I experiment with new mental models around how we could work, I ship changes without reading the code at all. I just review the runtime behavior and do periodic sessions to steer the architectural foundations in a good direction. It feels surprisingly natural. I think this is where professional development is heading too. It will just take people time to embrace it.

## The forge is the logical next step

Here is where headless development gets really interesting as a platform shift. Once you can spin up a controlled environment from anywhere, prompt an agent to do the work, and provide tools to review and analyze the results, the next step for these companies is to become git forges themselves.

Think about it. They already manage the compute. They already manage the development sessions. They already run the code. The piece they are missing is the collaboration layer, the place where code is stored, reviewed, merged, and deployed. That is what GitHub provides today. And I do not think it is a coincidence that [Thomas Dohmke](https://entire.io), the previous CEO of GitHub, ventured into building [Entire](https://entire.io), a new developer platform that reimagines collaboration between developers and agents from scratch.

But I honestly think Anthropic and OpenAI are better positioned to capture this market. They already own the agent layer. They are already running the compute. Adding a forge on top of that is a natural extension, not a leap. OpenAI in particular has the ambition and the surface area to become the new Google, the new GitHub, and the new Siri, soon with hardware to complement their products. I would not be surprised if we see movement in this direction before the end of the year.

## The identity question

The biggest challenge is switching costs. Developers' GitHub accounts carry real value. Your contribution history, your open source projects, your professional identity. For many people, their GitHub profile is their CV. That is a strong lock-in.

But in a world of headless development, the nature of that identity changes. If agents are writing the code and your role is to orchestrate and review, the value of a commit history as a signal of individual capability diminishes. The network effects that kept people on GitHub might weaken enough for a platform with stronger capabilities to pull people over.

## What headless development should feel like

If I could design the ideal headless development platform from scratch, here is what I would want. A system where my physical laptop is not a ceiling on how much agentic work I can run in parallel. A place where I can preview the results of that work instantly. Where compilation and test runs are optimized so agents are not wasting time waiting for builds. Where the right tools exist to visualize outcomes, not just code.

I would also want the ability to capture ideas on the go, just using my voice, which I could later translate into a coding session when I feel like doing the orchestration. Not everything needs to start at a keyboard. In a headless model, the "head" could be a voice memo on a walk, a sketch on a tablet, a conversation with an agent from your phone.

## This is happening

Every headless transition in software has followed the same arc. First the decoupling, then the new platforms that emerge around it. Headless browsers gave us modern testing infrastructure. Headless CMS gave us composable content architectures. Headless development is going to give us something equally transformative.

The companies that control the agent layer are in the best position to build the next generation of development infrastructure. They are already doing the hard part. The forge, the collaboration layer, the review tools, those are just the natural surface that forms on top.

It is just a matter of time and money.
