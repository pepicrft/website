+++
title = "If system APIs where awaitable"
description = "Swift’s async/await concurrency is a game-changer, but to fully leverage it, foundational APIs need to be designed with concurrency in mind."
tags = ["Swift", "Concurrency"]
published_at = "2024-10-25T12:00:00+00:00"
+++

Swift’s async/await concurrency reminds me a lot of when a similar pattern was introduced in JavaScript. Syntactically, it was a game-changer, making the code much easier to reason about. But performance-wise, it didn’t meet the expectation that sprinkling async and await statements everywhere would make code faster.

Many APIs back then remained synchronous, wrapped or not in an awaitable promise—similar to how some Foundation APIs, like FileManager, are still synchronous today. Wrapping calls to FileManager in something awaitable doesn’t actually make a difference since FileManager will still block the system thread until it finishes. This means you can’t reuse that thread to do something else while FileManager is busy.

In other words, to truly take advantage of async/await, the underlying APIs need to be designed to leverage it. Otherwise, you’re just wrapping synchronous code, gaining syntactic benefits without performance improvements.

This is why we began replacing [FileManager](https://developer.apple.com/documentation/foundation/filemanager) with [NIOFileSystem](https://swiftpackageindex.com/apple/swift-nio/), which is designed with concurrency in mind. Unfortunately, its design has some flaws that lead to worse performance than FileManager’s blocking API. Plus, it doesn’t shield consumers from the limited number of available handles.

I’d love to see Apple invest resources in revisiting foundational APIs, so code built on top of them can fully utilize hardware capabilities without requiring too much additional effort.
