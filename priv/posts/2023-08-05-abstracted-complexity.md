---
title: "Abstracted complexity remains complexity"
description: "Recently, I had to decide on a technology stack for Glossia, a localization tool I’m bootstrapping with my wife. Choosing a technology stack is an exciting decision for us, as software crafters. Still, it carries a profound impact on both the software and the business that builds on it, and should not be taken lightly."
categories: ['Elixir', 'Complexity', 'Glossia']
---

Recently, I had to decide on a technology stack for [**Glossia**](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/reh8hoh0vvnq48i2/SFRUUFM6Ly9nbG9zc2lhLmFp), a localization tool I'm bootstrapping with my wife. Choosing a technology stack is an exciting decision for us, as software crafters. Still, it carries a profound impact on both the software and the business that builds on it, and should not be taken lightly.\
​
Many factors can influence this decision, but **simplicity weighed heavily in our choice**. By controlling system complexity, we limit the resources needed to bring the tool into existence. This approach is **key to bootstrapping** the project without taking external investment, an option we're not wholly against but prefer to defer.\

While assessing the complexity of various stacks, I noticed something revealing --- *many technologies that seem simple at first glance may either have complexity abstracted away, which can sneak through upper layers, or may present complexity relatively early*, such as when you introduce a background jobs system.

**Can we maintain a simple stack for as long as possible? **Let's look at some examples to understand better what I mean.

​[**Ruby on Rails**](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/dpheh0h0wwrq6mbm/aHR0cHM6Ly9ydWJ5b25yYWlscy5vcmcv) is a fantastic framework, and Ruby is a very idiomatic language that's enjoyable to work with. Large organizations like [GitHub](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/owhkhqhrll549rbv/aHR0cHM6Ly9naXRodWIuY29t)and [Shopify](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/p8heh9hz55896guq/aHR0cHM6Ly9zaG9waWZ5LmNvbQ==) running their businesses on it speaks volumes about the technology. We could go a long distance with it building a product and attracting the first customers. However, you would eventually need a platform or developer productivity team to ensure that complexity remains under control, not impacting developer productivity. These teams might find themselves grappling with state mutation causing test flakiness, scaling the system horizontally using technologies like Kubernetes, or building sophisticated pipelines to debug production issues and heal the system swiftly. One might think this is normal in any software, but let me tell you, **a technology that doesn't require that does exist.**

**What if we choose **[**JavaScript**](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/kkhmh6hl2248wztl/aHR0cHM6Ly9kZXZlbG9wZXIubW96aWxsYS5vcmcvZW4tVVMvZG9jcy9XZWIvSmF2YVNjcmlwdA==)** or **[**TypeScript**](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/25h2hoh200n799s3/aHR0cHM6Ly93d3cudHlwZXNjcmlwdGxhbmcub3JnLw==)**?** They're very popular and offer extensive ecosystems, allowing your app to leverage Cloud Infrastructure providers like [Cloudflare](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/9qhzhnhp33ngwvu9/aHR0cHM6Ly9jbG91ZGZsYXJlLmNvbQ==). *Cool, right?* Cool until it's not. Pretty much any layer in the ecosystem is fragmented, which might foster creativity but isn't practical for running a business. [React](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/n2hohvh355enq7i6/aHR0cHM6Ly9yZWFjdC5kZXYv)continues to be trendy, but with the introduction of React Server Components and Vercel monopolizing its development, some are flagging it as evil and shifting towards web components. *If your company opts for it?* Well, good luck. Frameworks are abstracting an absurd amount of complexity and introducing a lot of indirection, **creating the sensation that complexity doesn't exist. But it does.**It's just hidden. When things don't work as planned, you must wade through complex layers, not designed for navigation during issues, and spend days unraveling complexity rather than developing the actual product. If we could gauge the time spent dealing with these matters, my bet is that it's substantial.

**So what should I choose instead?** I recently discovered [Elixir](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/reh8hoh0vvnqd8b2/aHR0cHM6Ly9lbGl4aXItbGFuZy5vcmcv) and the [Erlang VM](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/l2hehmh3vvwo74h6/aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQkVBTV8oRXJsYW5nX3ZpcnR1YWxfbWFjaGluZSk=), powerful technologies that can scale with low complexity, without compromising developer experience. They provide everything you need to build from a very basic to a highly sophisticated system, and that's why I chose it for [Glossia](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/m2h7h5h800woz0sm/aHR0cHM6Ly9nbG9zc2lhLmFp).

The **world is concurrent**, with things happening simultaneously, communicating via messages. Each of these occurrences, or processes, is an independent element with its memory and interface. Traditional programming languages propose a sequential mental model, which evolved with hardware enabling multiple simultaneous processes. However, issues like shared memory led to memory races and complicated concurrent software development.

Erlang, which preceded Elixir and provides the Erlang VM, examined the world and asked: *why not model problems and solutions to align with real-world mental models?* What if processes were easy to create, each with a portion of memory and CPU, communicating through messages? This fundamental idea prevents complexity that other languages naturally inherit, making software more logical.

Elixir runs on the same VM, BEAM, but **offers a more modern language and toolset**. It can handle millions of processes running tasks in parallel across cores and concurrently on each core. It does this fairly, meaning that if one process is busy indefinitely due to a bug, others can continue working. Thanks to this, we can scale the system vertically by adding more cores, usually a simple task, and avoid Kubernetes unless resembling a tech giant more than a small startup. Since the language is functional with processes to store state, code is more predictable, easier to test, and can even run tests in parallel with less likelihood of flakiness. *How crazy is it that you don't need all the additional efforts associated with other languages?*

That's not all. Elixir's support for macros and compilation error checking, access to powerful tools like the [observer](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/7qh7h8hopp3050az/aHR0cHM6Ly93d3cuZXJsYW5nLm9yZy9kb2MvbWFuL29ic2VydmVyLmh0bWw=), and its error tolerance make it an impressive choice. [Phoenix](https://click.convertkit-mail2.com/wvunw9zro6fgh5xwzgzu7heweekxx/p8heh9hz5589ogaq/aHR0cHM6Ly93d3cucGhvZW5peGZyYW1ld29yay5vcmcv) leverages processes to support component-based UIs without the complexity of frameworks like React, easing real-time experience creation, which we may utilize in Glossia for a collaborative review functionality.

**Elixir and the Erlang VM are fantastic, and I strongly believe they'll help us stay focused on bootstrapping Glossia.** I'm thrilled these days building with it, and everything is fitting together beautifully. The ecosystem is mature, and the community is welcoming.