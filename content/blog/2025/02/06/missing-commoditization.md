+++
title = "The missing commoditization"
description = "I talk about the lack of innovation in the Apple ecosystem and how Tuist is reimagining developer experiences."
tags = ["Tuist", "Business", "OSS"]
published_at = "2025-02-06T12:00:00+00:00"
+++

Have you noticed that other ecosystems have surpassed Apple’s app development experience in terms of developer tooling? Take [Vercel](https://vercel.com), for example—you can preview a website and add comments in just a few clicks. Or look at [Replit](https://replit.com), which lets you build and deploy a web app using LLMs in seconds. I can’t help but wonder: why isn’t there more innovation in this space? To be honest, bringing fresh ideas and doing things differently is what drives me at Tuist.

We’re still stuck with the same CI providers we used years ago, dealing with YAML pipelines that are a nightmare to debug, and locked into vendor ecosystems that make it hard to escape predatory sales practices. And what about all those old Ruby scripts no one dares to touch? “They work, so just leave them,” people say. Remote automation and CI are strongly coupled: you automate, push, and check if it works. Want something more intuitive, like a simple “click to release” feature? Not happening. Instead, you build in your CI environment and push the artifacts elsewhere. Need better insights into your projects? Here’s a scattered set of libraries to glue together, a server to maintain, or a build system to replace. Or even worse—an app that locks the data away, when all your manager really wants is a simple link to track team progress.

It’s too much plumbing. **It’s not fun**. And while Apple has made some progress here and there, they’re largely preoccupied with business priorities.

Ironically, the companies best positioned to enter uncontested markets—thanks to their IP and financial capital—are the ones suffering from the [innovator’s dilemma](https://en.wikipedia.org/wiki/The_Innovator%27s_Dilemma). They’re too distracted trying to fit their products into the AI narrative. But real innovation starts by looking at problems from a fresh perspective, challenging the status quo, and reimagining what already exists.

At [Tuist](https://tuist.dev), we want to be a catalyst for innovation. Our approach? Commoditizing a foundational piece we believe will unlock new ideas: remote virtualization of development environments.

I know, that sounds abstract. But think about Linux containers or web browsers. You can [launch software in a browser](https://stackblitz.com) using [WebAssembly](https://webassembly.org) or in a Linux machine with Docker. But macOS? Forget about it. We've wasted years reinventing virtualization—something every CI provider has had to solve. Yet, most see virtualization as just an enabler for CI services, rather than a tool to build new developer experiences.

Now, imagine if the cost of running virtualized environments dropped significantly, thanks to open-source technology and a simple system for orchestrating a pool of hardware. This isn’t a new concept—cloud providers already solved it for running apps and serverless functions. But no one has applied it to improving developer experiences.

Just yesterday, Vercel introduced a new runtime called [Fluid](https://vercel.com/fluid). Fluid is how things should be: spinning up virtualized macOS environments seamlessly.

And then, the magic happens:

* You can release an app with a single click from the list of commits on your Tuist dashboard. - You can run any workflow locally or remotely with just a flag. - You can sign your app remotely, letting us handle all the complexities for you.

We’re assembling the pieces to make this future a reality. I can’t wait to see Tuist help the Apple ecosystem catch up with the web. We’re making Tuist the go-to CLI for teams, building the best, most powerful, and beautifully designed dashboard that people love using. We chose Elixir for its robust runtime, which will be crucial in simplifying our solution without compromising power. And we’re developing a few missing technologies, which we’ll also open source.

We’re almost there. We just need to rethink the problem and bring down some costs to make it happen. Will it be expensive to develop? Oh yeah—especially for a small company like us. But once we release it, I bet Tuist will dominate these new spaces.
