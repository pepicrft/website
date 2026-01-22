+++
title = "The Session Replay Pattern: HAR Files for CLI Debugging"
description = "A pattern for CLI tools that communicate with servers: export HTTP traffic as HAR files to enable visual debugging, easy sharing, and AI-powered analysis."
published_at = "2026-01-22T10:00:00+00:00"
+++

At [Tuist](https://tuist.dev), our CLI communicates extensively with a server to provide features like binary caching and selective test execution. When users encounter issues, understanding what happened during their session is crucial for effective debugging.

Traditionally, we relied on logging. When something went wrong, we'd ask users to run the command again with verbose logging enabled and send us the output. Somewhere in those logs, we'd find the HTTP requests and responses that told the story of what happened. It worked, but it was clunky. Users had to reproduce issues. We had to parse through walls of text. And correlating multiple requests into a coherent picture required mental effort.

Recently, I discovered [Replay](https://nshipster.com/replay/) by NSHipster, a tool for recording HTTP traffic in Swift tests. What caught my attention wasn't the testing use case, but the format it uses: [HAR (HTTP Archive)](https://en.wikipedia.org/wiki/HAR_(file_format)).

## What is HAR?

HAR is a JSON-based format that browsers have used for years to export network traffic from their developer tools. It captures everything: request URLs, methods, headers, bodies, response status codes, timing information, and more. The format is standardized and widely supported.

Tools like [Proxyman](https://proxyman.io), Charles Proxy, and browser DevTools can all import and visualize HAR files. This means you get a rich, interactive view of network traffic rather than grepping through log files.

## The Session Replay Pattern

This led us to implement what I'm calling the **Session Replay Pattern**: each CLI session automatically records all HTTP traffic to a HAR file that users can share for debugging.

Here's what it looks like in practice. When you run any Tuist command, we create a session directory at `$XDG_STATE_HOME/tuist/sessions/<uuid>/` containing both traditional logs and a `network.har` file. If something goes wrong, users can share that HAR file with us.

Opening it in Proxyman gives us a complete picture: every request, every response, timing data, and the ability to inspect payloads visually. No more asking "can you run that again with `--verbose`?" No more parsing logs. We see exactly what the CLI saw.

We also automatically redact sensitive headers like `Authorization` and `Cookie` before writing to the HAR file, so users can share sessions without exposing credentials.

## Why This Matters

Three things make this pattern valuable:

**Visual debugging.** Instead of reading logs, we can see a timeline of requests in tools designed for network inspection. Spotting a failed request or an unexpected response becomes trivial.

**Easy sharing.** HAR is a single file that captures everything. Users don't need to understand what information is relevant. They just share the file.

**AI-powered analysis.** This is where it gets interesting. HAR files are structured JSON. You can feed them to coding agents and ask questions like "which requests failed?" or "what was the total data transferred?" or "show me the authentication flow." The standardized structure means AI tools can parse and analyze the data reliably, something that's much harder with unstructured log output.

## A Pattern Worth Adopting

If you're building a CLI that talks to a server, this pattern is worth considering. The HAR format is well-documented and most HTTP client libraries provide the hooks you need to capture the necessary data. The investment is minimal, and the debugging experience improvement is substantial.

You can see [our implementation](https://github.com/tuist/tuist/pull/9192) if you're curious about the details.

Logging tells you what happened in text. Session replay shows you what happened visually and lets you query it programmatically. Both have their place, but for network debugging, HAR files are a clear upgrade.
