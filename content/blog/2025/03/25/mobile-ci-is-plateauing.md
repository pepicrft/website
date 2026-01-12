+++
title = "Mobile CI is plateauing"
description = "In this blog post I share how we might be on the verge of a revolution in mobile CI."
tags = ["OSS", "Business", "CI"]
published_at = "2025-03-25T12:00:00+00:00"
+++

We are considering solving some problems at [Tuist](https://tuist.dev) that require virtualizing macOS environments. As part of this, I’ve invested some mental energy into understanding the finances and technology stack of the mobile CI landscape. What I’ve discovered is that the landscape is plateauing, CI companies are responding to this shift, and we might be on the verge of either a devaluation of CI companies or a revolution. To better understand the situation, let’s dive into the stack:

## The stack

Technologies can be broken down into layers, and CI is no exception. Starting from the bottom:

* **Machines**: We need environments—physical or virtual—where a set of steps can run. This is already offered as a service by most cloud providers. The availability of Apple hardware has been somewhat limited, but this is changing as more players enter the space. - **Virtualization**: CI services run builds in disposable, virtualized environments to prevent data leakage across builds. In the Linux world, this is highly commoditized with tools like Docker or Podman. For macOS environments, Apple took the first step toward commoditization by releasing the Virtualization Framework. Tart followed with a source-available, Docker-like solution, while Lume and [macvm](https://github.com/macvmio) joined the game with open-source-licensed alternatives. - **Orchestration**: For Linux environments, where provisioning new environments is fast, orchestration is typically handled by the cloud provider. However, macOS is a different story. Since macOS images are not lightweight, you need a system that can provision a fleet of Apple hardware, configure the environments, load them with the appropriate images, and make them available for use. - **User Layer**: At the topmost layer are the features users interact with directly (beyond just the UI). This includes viewing logs, retrieving them along with build artifacts, and parsing and executing pipelines.

If you use a CI service, you probably don’t think about this structure. But once you understand how it’s organized, it’s striking to realize how close we are to full commoditization. Let me highlight some key developments that led me to this conclusion.

## The commoditization of the space

In 2019, [GitHub](https://github.com/) released GitHub Actions, which introduced hosted runners alongside the concept of “bring your own runners.” You could either provide your own runners or use partners that integrate directly into your GitHub organization. This meant GitHub would handle the user layer and the entire stack—unless you chose to bring your own.

Let’s be honest: it’s hard to compete with GitHub’s user-layer experience. It’s embedded where collaboration happens, and its proximity enables features that CI providers can’t replicate—such as declaring permissions for the exposed `GITHUB_TOKEN`. GitHub also built a rich ecosystem of reusable actions to base your workflows on.

This shift gave rise to companies like [Cirrus Labs](https://cirruslabs.org/), [Cirun](https://cirun.io/), and [Depot](https://depot.dev/), which handle the runner provisioning for you. From the layers above, they manage orchestration, while GitHub takes care of the rest. The adoption process is remarkably straightforward, and there’s no need to migrate pipelines from one proprietary format to another.

GitHub isn’t alone in this trend—[GitLab](https://docs.gitlab.com/runner/) and [Forgejo](https://forgejo.org/docs/latest/admin/runner-installation/) also support bringing your own runners.

Another recent change is in virtualization. [Tart](https://github.com/cirruslabs/tart) brought Docker-like concepts to Apple’s Virtualization Framework, but now it faces competition from permissively licensed alternatives like [Lume](https://github.com/trycua/cua) and [Curie](https://github.com/macvmio/curie). Virtualization is getting cheaper. While Tart may still lead in capabilities, open-source projects have a knack for catching up quickly due to community contributions. I believe it’s only a matter of time before they’re on par.

## What’s keeping people with CI providers?

I ask myself this question daily, and I think the answer is straightforward: vendor lock-in. By design, users are tied to platforms they chose years ago through proprietary YAML formats that are costly to migrate and ecosystems of steps that tightly couple their automation to the service.

But people are waking up. [Dagger](https://dagger.io/) is leading the charge by proposing that automation shouldn’t be tied to a single company. Pipelines should be portable, just like OCI images. Absolutely! Dagger builds on a foundation that doesn’t yet seamlessly support macOS-dependent builds (due to its approach to virtualizing steps), but there are still many ways to make automation portable. I wrote about this in [Tuist’s blog](https://tuist.dev/blog/2025/03/11/own-your-automation). Your automation should belong to you, not a company.

CI providers know they must offer more to differentiate themselves from GitHub Actions. However, they often lack the expertise to meet developers where they are. Instead, they double down on vendor lock-in with serverless solutions that could simply be open-source CLIs. This confuses users—CI companies were supposed to focus on CI, but now they’re tackling signing, release management, and security promises that large enterprises obsess over. Meanwhile, solutions like [Runway](https://www.runway.team/) are emerging, focusing on doing one thing exceptionally well and easily capturing customers.

## Plateauing

Looking at the layers above, orchestration is the next to commoditize. We’re one open-source project away from a service where you input an AWS or Scaleway key, install a GitHub app, and you’re set. This is already happening in other domains, like [app hosting](https://www.coolify.io/) and [database hosting](https://supabase.com/). If an orchestration layer goes open-source and invites companies to collaborate on building the best plug-and-play solution for your Git forge, CI providers could lose market share quickly.

I predict this will happen. Orchestrating virtualized macOS environments will become cheaper, potentially even offered as a foundational service for others to build upon. This could spark more innovation in the space—an area where mobile CI has lagged behind the web, largely due to innovation being locked in proprietary systems. That’s why I’m excited about this shift. We need more players thinking creatively, and commoditization enables that accessibility.

At Tuist, we’ll ride this wave of commoditization and explore how virtualization can solve some of our needs and challenges while delivering a better developer experience.
