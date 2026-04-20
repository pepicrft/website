+++
title = "Codex feels like the future of editors"
date = 2026-04-20T08:00:00+00:00
slug = "codex-feels-like-the-future-of-editors"
description = "A rainy Sunday trying Codex made me rethink my terminal-first agent workflow, and made me see a big opportunity for tighter integration with tools like mise and Pitchfork."

[taxonomies]
tags = ["AI", "Agents", "Tooling", "Productivity", "mise"]
+++
Until very recently, my agentic workflow lived almost entirely in the terminal. I use `cmux`, a Ghostty fork, and I map each workspace to a project. Inside each workspace, I open tabs for different sessions. Because `cmux` lets me rename both workspaces and tabs, I ended up using naming as state management. It is how I keep track of what each agent is doing, what context belongs to which project, and where I should jump next.

That setup worked well enough that I did not feel much urgency to move to a GUI. I could see where things were heading. OpenAI was clearly investing in graphical environments like Codex, and the push toward worktrees as the right primitive for parallel work made a lot of sense. But I had not felt the need to throw myself into it.

Yesterday I finally did. Rainy Sundays are good for this sort of thing. You open a new tool out of curiosity, expecting a few nice ideas, and suddenly you realize something deeper might be changing.

## Why it clicked

The layout is obvious in the best possible way. Sessions on the left. The active coding session in the center. A terminal at the bottom, which I still need to boot services locally. And on the right, the parts of the workflow that usually live in separate windows: diffs, comments, and a browser to interact with the thing I am building.

I think that last part is what surprised me most. I did not feel like I was using an editor with AI bolted onto it. I felt like I was inside the whole loop. Ask the agent to do work. Run or restart services. Inspect changes. Leave feedback. Click into the app. Repeat. **I did not feel the urge to leave Codex.**

I had been reading Thomas Ricouard's excitement about this way of working, and I get it now. When people say the editor is changing, this is what they mean. The terminal is still there, which matters to me, but it is no longer the whole experience. It becomes one pane in a larger environment that keeps the entire feedback loop close at hand.

## The integration opportunity

The more I used it, the more I kept thinking about a big opportunity: tighter integration with the toolchain many of us already love, starting with [mise](https://mise.jdx.dev/) and its satellite tools.

First, sessions need tools from the system. That is exactly what mise is for. Python, Ruby, Node, and pretty much anything else a project might need. If a repository already describes its toolchain through mise, the editor should be able to lean on that rather than invent another provisioning story.

Second, Codex has the notion of actions, and that aligns beautifully with `mise tasks`. A repository already knows how to start itself, test itself, lint itself, seed data, or build artifacts. If those tasks exist in `mise.toml`, Codex could detect them and auto-register them as actions in the UI. That would turn the repository into the source of truth, which is exactly where that knowledge should live.

Third, some projects need services running. A Postgres instance. A cache. A local broker. That is where [Pitchfork](https://pitchfork.jdx.dev/) gets interesting. It can manage those services, scope them to a session, and even set up a system-level proxy that is bound to that session. If Codex can see that URL, it could hoist it in the UI as a first-class destination. Click it, and you are in the running app without jumping across tools.

What excites me here is not just convenience. It is the chance to make the editor a thin integration layer over tooling we already trust. Not another place where configuration gets duplicated, but a place that reads the project's declared tools, tasks, and services and turns them into a cohesive experience.

I still love the terminal. I still think it is the right substrate for agentic development. But after spending a rainy Sunday with Codex, I no longer think the terminal is the final form. There is a lot of room above it for an integrated environment that keeps sessions, terminals, review, and the browser in one place.

If Codex gets tighter integration with tools like Mise and Pitchfork, I think it becomes even more compelling. Even without that, I have to give credit where it is due. The Codex team is building something that, at least to me right now, feels like the future of editors.
