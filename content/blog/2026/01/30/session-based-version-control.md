+++
title = "Session-Based Version Control: Tracking Why, Not Just What"
description = "Git tracks what happened. But in an agent-first future, we need systems that capture reasoning, decisions, and context. Here's what that might look like."
tags = ["Technology", "Version Control", "AI", "Systems", "Future"]
published_at = "2026-01-30T21:00:00+00:00"
+++

Git tracks what happened. Every commit is a snapshot, a frozen picture of the codebase at a moment in time. This works remarkably well for human developers who think carefully before committing, who organize their work into logical units, who write commit messages that explain their choices.

But the world is changing. We are entering an era where AI agents will make hundreds of thousands of changes per day to massive codebases. Where reasoning happens continuously, not in discrete think-then-commit cycles. Where the question is not just what changed, but why it changed that way instead of the other three approaches that were considered and rejected.

Git cannot handle this future. Not because it is badly designed, but because it was designed for a different set of constraints. A different kind of collaboration. A different relationship between human intention and code changes.

I have been thinking about what comes next. Not as a replacement for Git in all contexts, but as an evolution for workflows where capturing intent matters as much as capturing code. Where sessions of work, complete with goals and reasoning and decisions, become the fundamental unit of collaboration.

## The GitHub Lock-In Problem

Before we talk about what comes next, we need to understand what we are moving away from. GitHub controls the infrastructure that defines how developers exist online. Your professional identity lives on their servers. Your resume includes your GitHub profile URL because that is what recruiters expect to see. The stars on your projects have become a currency in open source, a signal of legitimacy and quality that exists entirely within their ecosystem.

This is not just about features being convenient. It is about network effects creating switching costs that have nothing to do with the underlying value of the platform. Continuous integration naturally integrates with GitHub Actions because that is the path of least resistance. Package registries default to GitHub because that is where the code already lives. Collaborative workflows optimize for GitHub's model because that is what everyone else is using.

Microsoft acquired npm not just for revenue, but to deepen the integration graph. Every npm package that defaults to GitHub for its source code becomes another connection in a web of dependencies that makes leaving harder. Every team that adopts GitHub Actions for CI/CD adds another integration that would need to be recreated elsewhere. Every developer who builds their professional reputation through GitHub stars has more to lose by moving to a different platform.

This is what a dominant position looks like in practice. Not one killer feature, but the accumulated weight of countless small decisions that all point in the same direction. Use GitHub. Stay on GitHub. Build your tools to integrate with GitHub.

## What Sessions Look Like

Imagine a different model. Instead of commits being the fundamental unit, sessions become the atomic piece of work. A session captures not just what changed, but the entire context of why those changes happened.

A session has a goal. Something like "implement JWT authentication for the API" or "optimize database query performance in the user dashboard." The goal is stated upfront, before any code is written, because it frames everything that follows.

A session contains conversation. The back and forth between whoever is doing the work, whether that is a human developer, an AI agent, or both working together. The places where decisions get made. The questions that get asked and answered. The moments where one approach gets rejected in favor of another.

A session includes decisions with their reasoning. Not just "we chose approach A" but "we chose approach A instead of approach B because of constraint C and trade-off D." The kind of context that usually lives in Slack threads or meeting notes or someone's memory, but rarely makes it into version control.

And yes, a session includes the actual changes. The file modifications, additions, deletions. The part that Git is very good at tracking. But now those changes are connected to the reasoning that produced them.

This is not a radical idea. It is just making explicit something that already happens in good development workflows. The difference is that the reasoning is captured as a first-class artifact instead of being scattered across tools that do not talk to each other.

## The Architecture of Capture

Building a system like this requires different architectural choices than Git makes. Git assumes the local filesystem is the source of truth, with remote repositories being synchronized copies. This works well when humans are the primary users, but becomes a bottleneck when hundreds of agents need to collaborate without stepping on each other.

What if the server is the source of truth instead? Not in the old centralized version control sense where every operation requires talking to the server, but in a more sophisticated way. The server becomes the coordination point, but individual operations can still happen locally and be synchronized later. Think of it more like how modern databases handle distributed transactions than how Subversion handled centralized source control.

Object storage becomes the foundation. Not as a cold archive tier, but as the primary storage layer. S3 or S3-compatible storage can provide strong consistency guarantees that make it suitable for this role. Content-addressed storage means the same file content gets stored once, regardless of how many sessions reference it. Immutable blobs mean you never have to worry about overwrites corrupting data.

Sessions become the organizing principle for changes. Each session gets its own isolated view of the codebase at the moment it started. Changes made during the session do not affect other sessions until the work is landed and merged into the main line. This isolation is not achieved through filesystem trickery, but through data structures that track what each session can see.

The interesting part is how this scales. Git struggles with massive monorepos not because the algorithms are bad, but because the model assumes you are cloning entire repositories to local disk. When the repository contains billions of files, that model breaks down. But if the storage layer is object-based and the client only fetches what it needs, you can support repositories of arbitrary size. Meta-scale. Google-scale. The kind of scale where hundreds of thousands of changes happen every day.

## Conflict Detection Without Coordination

One of Git's fundamental challenges is merge conflicts. When two people change the same file, someone has to resolve the conflict manually. This is fine when changes are infrequent, but becomes a serious bottleneck when agents are making thousands of changes concurrently.

The clever solution is bloom filters organized hierarchically. A bloom filter is a probabilistic data structure that can tell you "definitely not in this set" or "probably in this set" very efficiently. If you organize them in layers, you can check whether a session's changes conflict with the tens of thousands of sessions that were landed while you were working, using logarithmic rather than linear time.

The way it works is beautiful in its simplicity. Each landed session records which files it touched in a bloom filter. Groups of sessions get merged into higher-level bloom filters. To check for conflicts, you walk up the hierarchy, checking your changes against progressively larger groups of landed sessions. If any filter says "probably contains this file," you know you need to look closer. If they all say "definitely does not contain this file," you can proceed without further checks.

This gives you O(log n) conflict detection instead of O(n). The difference between checking a few dozen bloom filters versus checking hundreds of thousands of individual sessions. The difference between a system that can handle Meta-scale workloads and one that cannot.

## Agent-First By Design

The real insight is not any single technical choice. It is the recognition that systems designed for humans working carefully need to evolve into systems designed for agents working rapidly. Humans think, then commit. Agents commit, then we review. Humans organize their work into logical units before creating a pull request. Agents create thousands of small changes that need to be organized after the fact.

This changes what matters. Capturing reasoning becomes essential because you cannot assume the person reviewing the change is the same person who made it. In fact, you cannot assume the one who made the change was a person at all. Session-based workflows make this explicit. Here is what we were trying to do. Here is how we decided to do it. Here is the conversation that led to these specific choices.

The architecture choices follow from this recognition. If agents are going to be making thousands of concurrent changes, you need conflict detection that scales logarithmically. If sessions might contain gigabytes of changes, you need storage that handles large files efficiently. If work happens on servers in the cloud rather than on developer laptops, you need the server to be the source of truth rather than a synchronized copy.

None of this makes Git obsolete. Git will continue to be the right choice for countless projects. But there are workflows emerging where Git's model is the wrong abstraction. Where capturing why matters as much as capturing what. Where the number of concurrent changes makes traditional merge conflict resolution untenable.

## The Parallel to Amodei's Framework

Dario Amodei's recent essay on AI risks offers a framework that applies beyond just AI safety. He talks about the importance of surgical interventions rather than sweeping mandates. About acknowledging uncertainty rather than pretending you have all the answers. About designing systems that can evolve and adapt rather than being locked into assumptions that might prove wrong.

This applies directly to version control evolution. You cannot replace Git with a grand vision that assumes it knows better than decades of accumulated wisdom. But you can build systems that address specific problems where Git's model creates friction. Session-based workflows for agent collaboration. Bloom filters for efficient conflict detection at scale. Object storage for handling massive repositories.

The key is reversibility. If your new approach does not work, can you go back? Can you export to Git format? Can teams adopt incrementally rather than requiring a big-bang migration? The successful version control systems were always the ones that played nicely with existing workflows. CVS to Subversion to Git was a gradual evolution, not a series of forced replacements.

Amodei talks about avoiding doomerism, the belief that technology inevitably leads to bad outcomes. But he also rejects blind optimism, the belief that everything will work out fine without careful thought. The balanced position is empiricism. Try things. Measure what actually works. Adjust based on evidence.

For version control, this means building systems that can be tested at scale, that can demonstrate their value on real codebases with real workflows, that can prove they handle the edge cases that always emerge when theory meets practice. It means being honest about limitations rather than promising a silver bullet.

## The National Security Question Applied

Amodei poses a thought experiment. Imagine a country of geniuses materialized overnight, fifty million Nobel-level minds working at ten times human speed. A national security advisor would call this the most serious challenge in a century. Not because the geniuses are malicious, but because the concentrated capability creates profound vulnerabilities.

Apply this framing to GitHub's position. What happens when a credible alternative emerges that genuinely challenges their dominance? What is Microsoft's strategic response when their entire developer ecosystem depends on this platform? What second-order effects ripple through the industry when the switching costs finally get overcome?

GitHub is not going anywhere tomorrow. The network effects are real and powerful. But they are not immune to competitive pressure. The question is whether that pressure comes from genuine technical innovation that solves real problems, or from regulatory intervention that tries to mandate outcomes without understanding the dynamics.

The technology I am describing here, this session-based approach to version control, is not going to replace GitHub next year. Maybe not in five years. But it represents a different way of thinking about collaboration that might matter more in ten years than it does today. When hundreds of thousands of agents are making millions of changes per day. When the bottleneck is not writing code but reviewing and organizing it. When capturing reasoning becomes as important as capturing commits.

## The Adolescence We Are Living Through

The technology sector is in what Amodei calls an adolescence. A period where we have been handed immense power but might not have developed the maturity to wield it well. AI agents that can write code better than most junior developers. Version control systems that were designed before this capability existed. Collaborative workflows that assume human-paced decision making.

The uncomfortable truth is that we are writing the answer to the alien's question from Contact in real time. How did we survive this technological adolescence? How did we evolve systems designed for human collaboration into systems that work for human-AI collaboration? How did we avoid simply replacing one monopoly with another?

I do not have complete answers. Nobody does yet. But I know that pretending Git will suffice for the next twenty years is wishful thinking. I know that GitHub's dominance creates risks that go beyond vendor lock-in. And I know that the systems we need do not exist yet in mature form.

Session-based version control is one possible direction. There will be others. The important thing is staying empirical, building incrementally, creating escape hatches so that if an approach does not work you can walk it back. Avoiding the trap of building a new monopoly while trying to challenge an existing one.

The outcome depends on choices that are still being made. Not on technological inevitability. Not on market dynamics that are somehow predetermined. On the decisions we make about what to build, what trade-offs to accept, what principles to embed in our systems.

That is the adolescence. And we are living in it right now.
