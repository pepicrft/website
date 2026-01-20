+++
title = "Rethinking Version Control for an Agentic World"
description = "Git and Git forges were designed for a world where humans write code in isolation. As agents become central to how we build software, I believe we need to rethink everything from branches to CI to how open source contributions work."
tags = ["Agents", "Git", "Open Source", "Infrastructure"]
published_at = "2026-01-20T12:00:00+00:00"
+++

I keep coming back to a conversation I've been having with other developers lately: **Git and Git forges feel increasingly stretched in the world of agents.** The mental models we built around version control assume humans writing code in isolation, occasionally syncing their work. That assumption is breaking down.

Git was designed in 2005. Linus Torvalds needed something to manage the Linux kernel, where geographically distributed developers would work independently and merge their changes periodically. The branch-and-merge model made perfect sense for that world. But agents do not work like kernel developers. They generate code continuously, they need to understand context, and the *why* behind changes matters as much as the *what*.

This is why you see developers exploring tools like [Jujutsu](https://github.com/martinvonz/jj), a version control system from a Google engineer who previously worked on Mercurial. Jujutsu treats the working copy as a commit from the start, eliminates the concept of a staging area, and handles conflict resolution in a fundamentally different way. Conflicts can exist as logical representations in the commit tree, and resolutions propagate automatically to descendant commits. This is not just a nicer Git. It is a different mental model that happens to be Git-compatible.

The shift to Jujutsu tells me something important: developers are reaching for new abstractions because the old ones no longer fit how they work. And with agents becoming central to development, this tension will only grow.

## The forge dilemma

GitHub sits in a fascinating position right now. They have the moat. The community. The profiles that serve as developer CVs. The ecosystem of tools that implicitly depend on them. But they also face a radical product challenge that I do not think they are well-positioned to address.

The forge model assumes pull requests, issues, code review, and CI workflows that were designed for human-to-human collaboration. GitHub has been adding AI features aggressively. Copilot can now write code, review PRs, and even be assigned issues to work on autonomously. But these feel like AI bolted onto existing workflows rather than workflows redesigned from first principles.

GitLab is in a similar position with their Duo agent platform. They are building AI as a feature layer on top of the existing forge model. Multiple agents working in parallel, sure, but still within the constraints of branches, merge requests, and pipelines.

I believe forges are going to face a difficult choice. Either they evolve their core abstractions, which is extremely hard when millions of workflows depend on the current model, or they get disrupted by something built for agents from the ground up.

## Sessions, not branches

Here is one change I have been thinking about while tinkering in my free time: what if we replaced branches and pull requests with **sessions**?

A session would capture not just the code changes, but the rationale behind them and the prompt that originated them. When I ask an agent to implement a feature, the session would record my prompt, the agent's reasoning, the code it produced, the tests it wrote, and how it responded to my feedback. The *why* becomes a first-class citizen alongside the *what*.

These sessions would land on the project as the unit of contribution. Instead of a branch that shows you a diff, you would see the entire context of how and why the code came to be. Code review would shift from "does this diff look correct?" to "does this session's reasoning make sense?"

This matters because agents need context to work effectively. When an agent looks at your codebase today, it sees code and commit messages. If it could see the sessions that produced that code, including the prompts, the decisions, the rejected alternatives, it would understand the project at a much deeper level. The institutional knowledge that currently lives only in developers' heads would be captured and accessible.

## Prompt requests instead of pull requests

Open source maintainers are already pointing at something that I think will become the norm: prompt requests instead of pull requests.

The idea is simple. Instead of submitting code, you submit the prompt that would produce the code. The maintainer reviews the prompt, perhaps iterates on it with you, and then leans on agents to execute it. The human contribution becomes the intent and direction, not the implementation.

This flips the maintenance model on its head. As I wrote about [before](/blog/2025/03/09/ai-oss-cost), AI can dramatically reduce the cost of maintaining open source. But prompt requests go further. They recognize that specifying what you want is often harder than implementing it, and that is where human judgment adds the most value.

The challenge is that maintainers are already overwhelmed by AI-generated PRs. The [OCaml team rejected](https://devclass.com/2025/11/27/ocaml-maintainers-reject-massive-ai-generated-pull-request/) a 13,000+ line AI-generated PR. Other maintainers [report](https://piero.dev/2025/06/nuisance-of-ai-on-open-source-maintainers/) that AI makes it easy to spam them with garbage. The current model of accepting code submissions does not work when the cost of generating code approaches zero.

Prompt requests could help here. Instead of reviewing generated code, maintainers would review intent. They could reject prompts that do not align with the project's direction without spending hours understanding an AI's implementation choices. And when they do execute on a prompt, they control the generation process, ensuring it meets their quality standards.

## Token lending for open source

If prompt requests become the unit of contribution, an interesting question emerges: who pays for the tokens to execute them?

I think we will see supporters contribute tokens to execute prompt requests. Model platforms would need to introduce the concept of lending tokens, essentially allowing you to allocate part of your token budget to a project you care about. The maintainer could then draw from this pool when executing on contributions.

This is a different economics than GitHub Sponsors or Open Collective. Instead of giving maintainers money to spend on infrastructure or their time, you would be giving them compute to execute on the community's ideas. The contribution becomes more direct: your tokens literally turn into code in the projects you care about.

Model providers like Anthropic or OpenAI would need to build this functionality. It requires a concept of delegated token access, probably with scoping so you can limit what your tokens can be used for. But I do not see any fundamental barriers. It is mostly a matter of product and business decisions.

## CI needs to go away

This might sound radical, but hear me out: CI in its current form does not make sense in an agentic world.

The premise of CI is that you cannot trust what happened on a developer's machine. Code needs to run in a controlled environment before you can trust the results. This made sense when "developer machine" meant a laptop with who-knows-what installed. But it creates enormous waste. We run the same tests twice, once locally to get feedback, and again on CI to get trust.

What if we could trust the checks that ran locally?

This is where tools like [Nix](https://nixos.org/) and [Bazel](https://bazel.build/) become interesting. They give you hermetic, reproducible environments. If you can cryptographically attest that a specific set of checks ran against a specific state of the code in a hermetic environment, you do not need to run them again on a server. The attestation is the proof.

I touched on this in [a previous post](/blog/2026/01/13/unlocking-new-mental-models), but I keep coming back to it. The technology exists. We have content-addressable storage. We have reproducible builds. We have cryptographic signatures. What we lack is a system that ties them together in a way that forges and development tools can trust.

This matters especially for agents. When an agent runs locally, it could run checks and produce attestations as part of its work. The forge would verify those attestations rather than re-running everything. You would skip the CI queue entirely because the proof already exists.

## Remote sessions, anywhere

Another piece of the puzzle: sessions should be triggerable in remote VMs from anywhere, including from your phone.

VMs as a service is commoditizing rapidly. Companies like [Namespace](https://namespace.so/), [Coder](https://coder.com/), and many others are making it trivial to spin up development environments. GitHub Codespaces did a lot to normalize this. The infrastructure is becoming a commodity.

In a world of sessions rather than branches, you would be able to trigger a session from anywhere. See a bug while you are on the train? Open your phone, describe what needs to change, and trigger a session in a remote VM. The agent works on it, produces a session with code and rationale, and it is ready for review when you get to your laptop.

This is not just about convenience. It is about making the cost of starting development work approach zero. No need to have your laptop, no need to wait for Xcode to start, no need to pull the latest changes. You describe intent and let the infrastructure handle the rest.

## Learning from the giants

There is one more piece I have been thinking about: how do we make this work at scale?

Companies like Meta and Google have invested heavily in monorepo infrastructure. [Sapling](https://sapling-scm.com/), Meta's version control system, handles repositories with billions of lines of code. They use virtual file systems that only materialize the files you need. They have sophisticated caching that makes builds fast even at massive scale.

These are not just engineering curiosities. They are solutions to real problems that emerge when you have thousands of developers working on the same codebase. And in an agentic world, we might all face similar challenges. If agents generate code at the rate they are capable of, the volume of changes will grow faster than traditional Git infrastructure can handle.

I think the future looks more like a giant monorepo where local workflows pull and push only what is needed, when it is needed. The forge becomes a coordination layer rather than a storage layer. Your local environment, whether it is your laptop or a remote VM, has just enough of the codebase to do its work.

This requires rethinking how we think about repositories and organizations. Maybe an organization is not a collection of repositories but a single logical codebase with intelligent visibility and access controls. The boundaries become logical rather than physical.

## Where I am spending my time

I do not have a finished open source project to announce (yet). But I have been spending my free time exploring what this world might look like. The pieces are there: Nix for hermeticity, cryptography for attestation, remote VMs for compute, structured data for capturing intent and rationale.

What I find exciting is that this is not incremental improvement. It is a chance to rethink the assumptions we have carried for twenty years. Git forges have been incredibly successful, but success creates path dependence. They have to support existing workflows even as new ones emerge.

If you are building for agents from scratch, you do not have that constraint. You can ask: what would we build if we knew agents would be the primary authors of code? What abstractions would we create if capturing *why* mattered as much as capturing *what*?

I think those questions lead somewhere interesting. And I am having a lot of fun exploring where that might be.
