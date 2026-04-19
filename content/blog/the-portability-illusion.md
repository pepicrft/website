+++
title = "The portability illusion"
date = 2026-03-25T08:00:00+00:00
slug = "the-portability-illusion"
description = "Cloud development environments keep getting rebranded, but they keep running into the same fundamental problem: your workflow is not portable. Agents might be changing the question entirely."

[taxonomies]
tags = ["Development", "AI", "Agents", "Infrastructure"]
+++
There is something interesting happening with where coding is going to happen. Not just which editor or which language, but where, physically, the act of writing and running code takes place. And I think the way the industry is approaching it reveals a lot about the difference between solving real problems and finding things to monetize.

## The granularity of billing

Our industry has a well-known preference for subscriptions over single payments. But it goes further than that. Over time, the unit of billing has become more and more granular. We went from annual licenses to monthly subscriptions to per-seat pricing, and now we are seeing models built around tokens, compute minutes, and individual API calls. There is a constant search for the smallest possible unit of value that can be metered and charged for.

I understand this from a business perspective. If you can identify a granular unit that maps to usage, you can build a pricing model that scales with your customers. But sometimes this search for the perfect billing unit leads to models that feel very forced. And I think one area where this is happening right now is the push to sell cloud development environments as the place where coding should happen.

## The three environments

For a very long time, development has happened across three environments. Your local machine, where you write and test code. CI, where changes get integrated and validated. And production, where the software actually runs. Each one has different requirements. Your local machine needs a lot of CPU and memory because you are doing compilations, running tests, switching branches, juggling tools. Production servers mostly handle I/O, so unless the workload is very compute-intensive or very critical, they do not need the same kind of raw power. CI sits somewhere in between, optimized for throughput and parallelism.

This model has worked well for decades. But some time ago, a new idea started gaining traction: what if coding did not happen locally at all? What if there was a fourth environment, a remote machine where the development itself takes place?

## The idea that keeps coming back

The first serious attempt at this that I remember was [Gitpod](https://www.gitpod.io/). Then came [GitHub Codespaces](https://github.com/features/codespaces). The pitch was compelling on paper. You no longer code on your machine. You code on a remote server, and the browser is the interface to that environment. It helped that [VS Code](https://code.visualstudio.com/) was designed to be embeddable on the web, so you could get a familiar editor experience running entirely in the browser.

The promise was appealing. You have a terminal, you have your files, you can browse them, you can run the server, connect to it. It all works. And from a business perspective, it is elegant. You can monetize as many minutes as the developer uses. On top of that, you can layer features that enterprises care about: auditing, telemetry, network firewalls, visibility into outgoing connections, security controls. It sounds like a perfect product.

But it never quite worked. [Shopify](https://www.shopify.com/) spent years trying to enable a system like this for their developers and eventually pulled back. They recently rebranded the effort into something new, and while we do not know all the details, the fact that it needed a reinvention suggests something fundamental was not clicking.

## The portability problem

I think all of these attempts missed a very important detail. You can port the editor. You can have a VS Code or VS Code-like interface in the browser. You can provide a terminal. You can provide the code. You can give people everything that looks like a development environment. But there is one thing that is not portable: your preferences, your tools, your entire workflow.

As a developer, I have accumulated years of configuration. My shell setup, my dotfiles, my CLI tools, my editor plugins, the way I have things wired together. And increasingly, things like MCP servers and other integrations that connect my tools to external services. None of that travels with you to a remote environment. You can bring some of it, but never all of it. The moment you find yourself jumping between the remote environment and your local machine because something is missing, that is when you say "forget it, I would rather do everything locally where I know I have everything and just push when I am done."

This is the fundamental tension. These environments can replicate the visible parts of development, the editor, the terminal, the file system. But they cannot replicate the invisible parts, the accumulated workflow that each developer builds over years. And it is the invisible parts that make developers productive.

## The sandbox rush

What I see happening now is a variation of the same theme. There are many companies providing sandbox environments, containers where code can run in isolation. And they need to sell them. Some of them raised money on the premise that agentic workflows would need sandboxes, that AI agents would need somewhere to execute code, and that this would be the next big infrastructure market.

I get it. The logic makes sense on a pitch deck. But I think the long-term picture is less clear than it seems. I do not think companies building agentic workflows will rely on third-party sandboxes forever. If some are using them today, it is because they need to move fast and would rather buy a solution than build one. That is a reasonable short-term decision. But sandboxes are not a particularly defensible business. The technology is well understood. It can get commoditized quickly. And the companies with the most resources to build agents, like [OpenAI](https://openai.com) and [Anthropic](https://www.anthropic.com), have every incentive and every capability to run their own infrastructure. What would prevent them from deploying their own sandboxes? Nothing, really.

So if you are building a sandbox company, you need to jump to something else quickly, something more creative, something harder to replicate. Otherwise you end up competing on price for a commodity.

## Where is the innovation?

This is the part that makes me a bit sad, honestly. I was watching a demo the other day where someone showed a browser-based environment, spun up a container, compiled some code, and ran it. And I thought, "So what?" The capabilities we have today are genuinely amazing. Large language models can reason about code, suggest changes, catch bugs, write tests. The foundational infrastructure for running code in the cloud is solid and getting cheaper. All the pieces are there for something truly creative to emerge.

And yet, a lot of what I see is just repackaging the same cloud development environment idea with a new label. New branding, same concept. I would love to see more ambition.

The places where I do see genuinely interesting ideas are products like [Codex](https://openai.com/codex/) and [Claude Code](https://claude.ai/code). The idea that you start coding locally, or even from your phone, and the session continues elsewhere. That there is a seamless transition from one context to another. Sure, I do not see myself doing that for every single task, but for debugging an issue, or having a conversation about something with the full context of the codebase, that can be incredibly useful.

But this kind of experience requires investing in user-facing software. A polished desktop app, a mobile client, a thoughtful interface that makes the transition feel natural. These are hard things to build, and they require a very different set of skills than spinning up containers. The sandbox companies are not going to invest there. They end up in this awkward position where they need to sell their infrastructure, they want to sell it because that is the promise they made to their investors, but the real innovation is happening at a layer above them that they do not control.

## Agents change the question

The funny thing is that I think agents are quietly changing the entire question. The old framing was "where does the developer code?" and the answer was supposed to be "in our cloud environment." But agents do not need a cloud IDE. They do not need VS Code in the browser. They do not care about your font size or your color scheme. They need a terminal, access to the codebase, and the ability to run commands. The environment requirements for an agent are radically simpler than for a human developer.

This means the portability problem that killed cloud development environments for humans does not apply in the same way to agents. An agent does not have twenty years of dotfiles and shell customizations. It does not need its favorite editor plugins. It just needs to execute.

And this is where things get interesting, because if the agent can work in any environment, then the value is not in the environment. It is in everything else. The toolchain optimizations that make the agent's work faster. The caching layer that prevents redundant builds. The intelligence that knows what to skip and what to rebuild. The seamless experience that lets a developer kick off an agent session from anywhere and get results back without thinking about where the computation happened.

The companies that understand this will build at the layer where the real value lives. The ones that are stuck trying to sell sandboxes will keep looking for someone to buy them.

## Building means, not ends

At [Tuist](https://tuist.dev), we think about this a lot. We need compute capabilities, and we are building them. But compute is not what we are selling. It is a means to an end. The end is making developers and their tools faster, wherever they happen to be running. We want to build these capabilities and share them with the community, because the sandbox itself was never the interesting problem. The interesting problem is what you do with it.

I would love to see more of the industry think this way. Less rushing to monetize infrastructure for the sake of monetizing it, and more thinking about what genuinely new experiences become possible when you combine powerful models with fast toolchains and seamless transitions between environments. The pieces are all there. We just need the appetite to put them together in ways that actually surprise people.
