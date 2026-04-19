---
title: "Agentic productivity"
slug: "agentic-productivity"
date: "2026-03-27T08:00:00+00:00"
layout: "Pepicrft.PostLayout"
description: "We have the data from builds and test runs. We have the agent primitives in Elixir. Now we are connecting them into something that can actively improve your developer workflows, not just report on them."
tags:
  - "Tuist"
  - "Elixir"
  - "AI"
  - "Agents"
  - "Productivity"
---
Something has been clicking into place for me over the past few weeks. At [Tuist](https://tuist.dev), we sit on a lot of data. Build telemetry, test run results, project configurations, dependency graphs. We have been collecting and surfacing this information for a while now, and it is genuinely useful. Teams look at their dashboards, find the slow spots, fix things. But there is a gap between **showing someone a problem and solving it for them**.

That gap is where I think the next chapter of what we are building lives. If we have the data, and we understand the toolchains deeply enough to know what the data means, why are we stopping at dashboards? Why not act on it?

## The platform team you do not have

Most companies above a certain size have a platform team. A group of engineers whose job is to make everyone else more productive. They look at build times, investigate flaky tests, optimize CI pipelines, maintain shared infrastructure. They are the people who care about the things that no feature team has time to care about.

The problem is that most companies are not above that certain size. They do not have a platform team. They do not have someone whose job is to notice that a test suite has been getting slower by two seconds every week for the past three months. They do not have someone who catches that a specific module is being recompiled unnecessarily because of a misconfigured dependency. These things just accumulate silently until one day the build takes twenty minutes and nobody remembers when it started being this slow.

What we realized is that the data we already have from builds and test runs, combined with the context we have from the project structure, gives us everything we need to play that role. **We can be the platform team.** Not as a consulting engagement, not as a one-time audit, but as something that is always running, always watching, always ready to act. And the exciting part is that this makes the **platform team accessible to any company**, no matter how small.

## From dashboards to actions

Everyone in the developer tools space is starting to think about agents, but they are thinking about it differently depending on where they sit. [Linear](https://linear.app/) is exploring agents that can act on issues and look at code. [Codex](https://openai.com/codex/) and [Claude Code](https://claude.ai/code) are building agents that write and modify code directly. These are valuable directions, but they are all converging on code as the thing the agent acts on.

I think there is an underexplored space next to that. **Not acting on code, but acting on productivity.** Using the signals from builds and test runs to trigger workflows that actively improve the state of things. If we detect a flaky test, do not just flag it. Quarantine it, investigate it, propose a fix. If we see a build graph that is not making good use of available parallelism, suggest the structural change that would fix it. If a dependency update introduces a regression in compile times, catch it before it lands.

I do not know if there is an established term for this yet, but I have been calling it **agentic productivity**. The idea that an agent does not just help you write code, it helps you maintain the health of your entire development workflow.

## Building the pieces in Elixir

Because this is the direction we are heading, I have been spending time building the foundational pieces. Our server runs on [Elixir](https://elixir-lang.org/), and I wanted to understand what it would take to build agent workflows natively in that ecosystem. Not just call an LLM API, but build something that feels right in Elixir and takes advantage of what the platform gives you.

The first thing I needed was a place for the agent to work. If you are going to have an agent that acts on a repository, cloning it, running commands, reading files, making changes, it needs a sandbox. A disposable environment where it can do its thing without affecting anything else. I looked at the landscape of sandbox providers and found a lot of options: [Daytona](https://www.daytona.io/), [Exe](https://exe.dev/), and others. They are all converging on a similar model. You spin one up, do your work, tear it down. Fast and ephemeral.

But they all have slightly different APIs, and I did not want to couple our agent infrastructure to any single provider. So I built an Elixir package I am calling [:terrarium](https://hex.pm/packages/terrarium). It is an abstraction layer over sandbox providers, a unified interface with adapters. You configure your credentials, pick a provider, and you get a consistent API to create a sandbox, SSH into it, run commands, stream output, and destroy it when you are done. I built adapters for [:terrarium_daytona](https://hex.pm/packages/terrarium_daytona) and [:terrarium_exe](https://hex.pm/packages/terrarium_exe) to start with, but the interface is designed so that adding more is straightforward.

This matters for us in particular because none of these providers offer macOS environments. And most of our customers are working with Xcode. So we are also working on being able to provide those environments ourselves, which is something we need regardless for the broader compute story at Tuist. Having Terrarium as the abstraction means our own macOS sandboxes slot in through the same interface as any third-party provider.

## The agent itself

On top of the sandbox layer, I built the agent. I am calling it [:condukt](https://hex.pm/packages/condukt). It is a GenServer in Elixir, which is the natural way to model a long-running, stateful process in the BEAM ecosystem. At its core, an agent is a loop with tools. You give it a prompt, it reasons about what to do, it picks a tool, it executes it, it observes the result, and it loops again until it is done.

For the LLM interaction, I am using [:req_llm](https://hex.pm/packages/req_llm), a library that abstracts over different providers. The same fragmentation problem exists there: Anthropic, OpenAI, Google, they all have slightly different APIs for doing essentially the same thing. A unified interface lets us swap providers without rewriting the agent logic.

The tools are what you would expect. Execute a command, read a file, write a file. I drew inspiration from how [Claude Code](https://claude.ai/code) structures its tool set. It is a simple and effective model. I also added a browser tool, built as a separate Elixir package called [:browse](https://hex.pm/packages/browse), which can drive a web browser so the agent can navigate and extract information from the web. I even built a variant using the [Servo](https://servo.org/) engine for lightweight rendering.

What makes this feel good in Elixir is how naturally the pieces compose. A GenServer for the agent. Adapters for LLM providers. Behaviours for tools. Telemetry for observability. These are all patterns the ecosystem already has strong conventions for. You are not fighting the language to build this; you are leaning into it.

## Connecting the layers

Here is where it gets interesting. The agent itself needs to run somewhere, and the somewhere matters. If you are going to clone a repository, run builds, execute tests, you want that happening in a sandbox, not on whatever machine is hosting the agent process. So the architecture has **two layers of remote execution**. The agent logic runs as an Elixir process, possibly on our infrastructure. The actual work, the file operations, the shell commands, happen inside a sandbox provisioned through Terrarium.

From the developer's perspective, it should feel like the agent is just doing its thing. You give it a task, it reports back when it is done. But behind the scenes, it spun up a sandbox, cloned the repository, did its work, and cleaned up. The sandbox is gone. **The only thing that remains is the result.**

The primitives that Erlang and Elixir give you make this easy to model. Processes, message passing, supervision trees. You can represent the entire lifecycle of an agent session as a supervised process tree that starts, does work, and shuts down cleanly. If something crashes, the supervisor handles it. If the sandbox provider has an issue, the adapter can retry or fail gracefully. All of this composes in ways that feel natural rather than bolted on.

## Toward a workflow language

Once these building blocks are in place, something else starts to become possible. Right now, you interact with an agent by giving it a prompt. That works for ad hoc tasks, but what we are building toward at Tuist is not ad hoc. We want workflows that run in response to signals. When a flaky test is detected, run this. When build times regress past a threshold, investigate that. When a new dependency is added, check its impact.

This is where I want to explore something more structured. A way to describe productivity workflows that live in the repository, right next to the code they care about. Something that combines **deterministic steps with non-deterministic ones**. A pipeline where some steps are plain shell commands and others are prompts that an agent reasons through.

If you think about it, CI pipelines are the closest thing we have to this today. A sequence of deterministic steps triggered by a git event. What I am imagining is that concept extended in two directions: adding non-deterministic steps powered by an agent, and expanding the set of triggers beyond git events to include signals from build telemetry, test results, and other data we already collect.

Elixir is particularly well suited for this because of macros. Macros in Elixir let you build expressive DSLs that are still just Elixir under the hood. You get the readability of a declarative language with the full power of a general-purpose one. I have not landed on the exact API yet, but the idea is that you would describe a workflow in an Elixir script, and the system would interpret and execute it. **No YAML.** I have seen implementations of similar concepts using YAML, and I think they always end up fighting the format. YAML is fine for static configuration, but the moment you need conditionals, loops, or any kind of dynamic behavior, it becomes painful. Elixir scripts can be evaluated at runtime, which gives us a much more natural foundation.

## Putting it all together

What excites me about all of this is how the pieces connect. We have the data from builds and test runs. We have the sandbox infrastructure to give agents a safe place to work. We have the agent framework to orchestrate reasoning and tool use. And soon, we will have a way to describe workflows that tie it all together.

The vision is that Tuist becomes something that does not just observe your development workflow but actively participates in improving it. Not by writing your features for you, that is what coding agents are for, but by maintaining the health and speed of everything around the code. The plumbing. The infrastructure. The things that a platform team would handle if you had one.

I will share more as these pieces mature. For now, the foundations are coming together, and the thing I keep coming back to is how well Elixir fits this problem space. The concurrency model, the process architecture, the metaprogramming capabilities. It feels like the right tool for building the kind of system where agents, sandboxes, and workflows all need to work together reliably. I am glad we bet on it years ago when we started building the Tuist server.
