+++
title = "A Tiny Nudge Can Move an Industry"
description = "One of the traits of my personality that I consider positive, yet sometimes frustrating, is that I spend a lot of time observing how things evolve. I tend to think in trajectories. In the context of Tuist, that means thinking about how we c…"
published_at = "2025-10-31T09:26:22+00:00"
+++

One of the traits of my personality that I consider positive, yet sometimes frustrating, is that I spend a lot of time observing how things evolve. I tend to think in trajectories. In the context of Tuist, that means thinking about how we can make a lasting impact, not only technically but also as a business.

It is frustrating because there are always more immediate priorities to tackle. At the same time, it is exciting because you can play with a plausible future, start building toward it, and try to get everyone else excited about it too. Let me give you a few examples.

### The Mise Moment

I remember looking at the automation landscape on iOS and asking myself why we were still facing the same problems, like [Homebrew](https://brew.sh) installing different versions across environments. At [Shopify](https://shopify.com), I had seen a different world where everyone used the same versions, and reproducibility was the norm. Outside of that, nothing had nailed the developer experience.

Nix came close, but it never resonated with me. Then one day [Jeff](https://github.com/jdx), whose work I had been following since we built the [Shopify CLI](https://shopify.dev/docs/api/shopify-cli) on [oclif](https://oclif.io/), released [Mise](https://github.com/jdx/mise). I tried it, and it immediately clicked: this is the way.

We adopted it at Tuist, and I even recommended it as the default installation method. Naturally, there was resistance. *“Why Mise if I already have Homebrew?”* That is normal, but better futures only emerge when you push through that resistance. The way to do it is by socializing the tool, writing about it, sharing tips, and showing the value of Mise through comparison. Over time, the community started picking it up, and now many projects make it their default. Anyone can clone those projects, and Mise will ensure the right tools are present and activated in the system.

### Bash Is Fine. The Abstractions Are Not.

Another conversation we have had internally is about whether abstractions for automation are even needed anymore. Years ago, people found writing Bash painful. I never loved it, but I respected it for what it is: simple, portable, and universal.

The real problem was never Bash itself. It was the abstractions built on top of it. Layers that tried to replace the shell with new DSLs, YAML files, or frameworks that re-implemented what Bash already did well. They added complexity, drift, and “one more tool” to learn.

Today the situation is different. With agentic coding tools, you can ask [Codex](https://openai.com/codex/) or another model to write automation for you, and it will probably get it right on the first try. That makes plain Bash more attractive than ever. You get the clarity of the shell and the speed of automation.

I believe the purpose of abstractions is to eventually push solutions down to the right layer. In automation, that layer is often the shell itself. If a tool cannot explain why it is better than a short Bash script you can read and understand in one sitting, it probably is not worth the dependency.

### The Stagnation of CI Innovation

A more recent realization came when Git forges like GitHub and GitLab began allowing [external runners](https://docs.github.com/en/actions/concepts/runners/github-hosted-runners). Around the same time, a CI company criticized us for adopting a model to sustain the project that did not fit their non-supportive approach to open source.

Meanwhile, many customers were telling us that the same company had doubled their contract prices for no clear reason, while offering generous discounts to large enterprises. Innovation in that space had stalled. The only game was price manipulation.

At the same time, new companies started to emerge offering macOS runners that could connect directly to GitHub or GitLab. Something clicked in my head. The innovation here had stopped. They were playing with the value–cost ratio while **the mobile ecosystem was stuck in a dream where the most exciting idea was that maybe we did not need YAML for CI**. That was wrong.

I like innovation, and when I see it being suffocated, I feel compelled to act. Solving problems that others ignore drives me, and if someone tries to stop me, that only makes me more determined.

### The Mental Model

Here is the mental model that I keep returning to. I think it describes a future that is already unfolding.

1. With coding agents joining local and CI environments, it has become critical that solutions are not coupled to any CI provider. Developers and agents should both have access to the same services that pipelines use. Punto.
2. Real innovation will only happen if we have more companies providing macOS runners elastically, based on load and cost, instead of keeping them locked behind CI providers. This benefits not only CI users but also any company that needs macOS environments for creative or development purposes. It is good for users, good for developer tool companies, and naturally, good for Tuist.
3. Like Mise, it is only a matter of time before companies realize this. I plan to act as a catalyst because I am obsessed with bringing more innovation to this space and creating a fair market where competition happens through craftsmanship, not price manipulation. Where are the [Linears](https://linear.app) of this space? We need to build them.

### Looking Ahead

I could not be more excited about this new chapter of automation. We are only at the beginning, and it may take months or even years for the shift to be fully realized. At Tuist, our role is to introduce people to these new realities as market dynamics evolve.

What I love most about the software industry is how small things, like “runs-on,” Mise, or agentic coding tools, can suddenly challenge assumptions we took for granted for years. You do not need something big to nudge the industry forward. Sometimes, a tiny design decision is enough to lay the groundwork for innovation.

The seeds of automation are planted. Now we need time and voices to nurture them. That is my responsibility.
