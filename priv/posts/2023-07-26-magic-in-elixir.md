---
title: "The Power of Concurrency: My Journey Learning Elixir"
description: "Exploring Elixir, I discovered the power of concurrency-oriented programming"
categories: [Elixir, Concurrency, Swift, Ruby, Software, 'Functional programming', 'José Valim']
---

For the past few months, I've been immersed in learning **Elixir**. I can still recall the precise moment when curiosity about Elixir ignited within me. There I was, strolling around New York, while tuning into a podcast that featured [José Valim](https://twitter.com/josevalim?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor). He discussed how many programming languages, like [Ruby](https://www.ruby-lang.org/en/), were **not designed to scale vertically** (increasing computing power with more CPU processors). Moreover, those that did scale through threading primitives often posed challenges, such as data races. This made the task of writing parallel code less than ideal. Elixir, however, **combined the Ruby-like syntax I favored with the Erlang mental models and virtual machines.** This fusion allowed for the easy construction of scalable, distributed, and fault-tolerant apps. As soon as I returned home, I delved into the [Elixir documentation](https://elixir-lang.org/docs.html).

The syntax of the language is reminiscent of Ruby, yet entirely **functional**. It didn't take long for me to get acquainted with the syntax and primitives. Everything is organized into modules placed in various directories in the system, each exposing pure functions that can be piped using the `|>` operator. Things started getting truly fascinating when I began working with **processes**. This was somewhat of a novel concept for me in a programming language, yet I quickly drew parallels with an OS and its processes. They are **lightweight encapsulations of tasks that don't share CPU or memory resources**. Numerous processes can be created instantaneously, communicating with each other through message exchanges. These processes can also be structured into a tree, enabling the codification of supervisory rules such as automatically restarting any child process that crashes.

This introduces a profound mental shift in how you perceive your programs. When this shift resonated within me, I instantly fell in love with Elixir's approach to programming. The *'click'* occurred when I started reading [Joe Armstrong's thesis on Erlang](https://erlang.org/download/armstrong_thesis_2003.pdf), which fuels the BEAM virtual machine that Elixir operates on, as well as the programming language itself. The thesis opens with an exploration of the system requirements that Armstrong was designing for Ericsson, the need for a programming language, and his vision for solving global issues with software. He then introduces the concept of **concurrency-oriented programming**. Let me share some fragments from the thesis:

> The word concurrency refers to sets of events which happen simulta- neously. The real world is concurrent, and consists of a large number of events many of which happen simultaneously. At an atomic level our bodies are made up of atoms, and molecules, in simultaneous motion. At a macroscopic level the universe is populated with galaxies of stars in simultaneous motion.

> When we perform a simple action, like driving a car along a freeway, we are aware of the fact that there may be several hundreds of cars within our immediate environment, yet we are able to perform the complex task of driving a car, and avoiding all these potential hazards without even thinking about it.
> In the real world sequential activities are a rarity. As we walk down the street we would be very surprised to find only one thing happening, we expect to encounter many simultaneous events.

> If we did not have the ability to analyze and predict the outcome of many simultaneous events we would live in great danger, and tasks like driving a car would be impossible. The fact that we can do things which require processing massive amounts of parallel information suggests that we are equipped with perceptual mechanisms which allow us to intuitively understand concurrency without consciously thinking about it.

> When it comes to computer programming things suddenly become inverted. Programming a sequential chain of activities is viewed the norm , and in some sense is thought of as being easy, whereas programming collections of concurrent activities is avoided as much as possible, and is generally perceived as being diecult.

> I believe that this is due to the poor support which is provided for con- currency in virtually all conventional programming languages. The vast majority of programming languages are essentially sequential; any concur- rency in the language is provided by the underlying operating system, and not by the programming language.

This perspective is eye-opening, isn't it? **The world is concurrent, but programming languages are forcing us to model the world differently**, using primitives that don't map 1-to-1 to the real world, like controllers, repositories, factories, and builders. Armstrong goes further in explaining how we should observe the world to shape our software. He advocates for a 1:1 mapping of real-world concurrent activities to concurrent processes in our programming language, asserting that this **is critical to minimize the conceptual gap between the problem and its solution**, therefore enhancing maintainability:

> Now we write the program. The structure of the program should exactly follow the structure of the problem. Each real world concurrent activity should be mapped onto exactly one concurrent process in our programming language. If there is a 1:1 mapping of the problem onto the program we say that the program is isomorphic to the problem.

> It is extremely important that the mapping is exactly 1:1. The reason for this is that it minimizes the conceptual gap between the problem and the solution. If this mapping is not 1:1 the program will quickly degenerate, and become diecult to understand. This degeneration is oden observed when non-CO languages are used to solve concurrent problems. Oden the only way to get the program to work is to force several independent activities to be controlled by the same language thread or process. This leads to a inevitable loss of clarity, and makes the programs subject to complex and irreproducible interference errors.

This is one of the most potent concepts I've encountered recently, and it's the primary reason I'm smitten with the Erlang VM and Elixir as a modern language on top of it. Just yesterday, someone questioned why I didn't opt for Swift, which [is also embracing a similar model](https://developer.apple.com/tutorials/app-dev-training/managing-structured-concurrency). While I appreciate Swift's syntax, the problem lies in its inherited technical debt from supporting the transition from Objective-C. Furthermore, the incorporation of concurrency-oriented programming adds another layer of technical debt. Many libraries and standard library APIs are unprepared for it, which could potentially expose you to data race conditions.

Erlang's processes are the foundation for several other brilliant ideas that I'll explore in future posts. On a side note, did you know that [Glossia](https://glossia.ai) is powered by Elixir?