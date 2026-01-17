+++
title = "Schlussel: a single source of truth for agent authentication"
description = "I built Schlussel because agents deserve a simple way to authenticate with APIs. No more wasting tokens navigating documentation or guessing OAuth flows."
tags = ["Agents", "Authentication", "Open Source"]
published_at = "2026-01-17T12:00:00+00:00"
+++

I have been building something that started as a personal itch and turned into a project I think matters: [Schlussel](https://github.com/pepicrft/schlussel), an authentication runtime for agents. The name is German for "key" (Schlüssel, with an umlaut I dropped for simplicity), which felt appropriate for something that unlocks API access.

The problem is simple but pervasive. **Agents spend an absurd amount of cycles figuring out how to authenticate with services.** They crawl documentation, parse OAuth flows, guess at endpoints, and burn through tokens trying to understand what should be straightforward. Authentication is a solved problem for humans. We click buttons, follow redirects, and paste tokens. For agents, it is a maze.

## The wasted context window

Think about what happens when you ask an agent to interact with an API. GitHub is actually one of the easier cases because most developers have the `gh` CLI installed, and agents know how to use it. The CLI manages the session, and the agent can trust it. But most services are not GitHub. They either do not have a CLI, or if they do, developers do not have it installed locally. There is no session to leverage, no familiar tool to fall back on.

This is where things get wasteful. The agent needs to search for documentation, understand the OAuth flow, figure out which endpoints to hit, and then execute the flow. That is a lot of tokens spent on something that has nothing to do with the actual task.

Here is the thing that excites me: with the right session, well managed, an agent can just use `curl`. It does not need a fancy SDK or a dedicated CLI. It just needs a valid token and knowledge of the API endpoints. This means companies do not need to build agent-specific integrations. They just need to make authentication accessible, and agents can work with what already exists.

This is not a theoretical concern. I have watched agents burn through their context window just trying to figure out how to get a token. By the time they succeed, they have forgotten half of what they were supposed to do with it. The cognitive overhead is real, and it is wasteful.

What agents need is a single source of truth. A place where they can look up "GitHub" and get back everything they need: the OAuth endpoints, the scopes, the authentication method, the API base URL, even a public client they can use without registration. No searching. No guessing. No wasted cycles.

## Formulas as structured knowledge

Schlussel organizes authentication knowledge into what I call formulas. Each formula is a JSON file that contains everything an agent needs to know about authenticating with a specific service. Here is what a formula includes:

- The service identifier and human-readable label
- Available authentication methods (device code, authorization code, API keys)
- OAuth endpoints for each method
- Default scopes
- API information including base URLs and auth headers
- Public clients that can be used without registration
- Step-by-step scripts for completing the flow

This is not documentation meant for humans to read. It is structured data meant for agents to consume. An agent can fetch a formula, understand exactly what it needs to do, and execute the flow without any guesswork.

The formulas are available through a simple API at [schlussel.me/api/formulas](https://schlussel.me/api/formulas). You can query all available formulas or get details for a specific one. The data is also bundled into the CLI itself, so agents can work offline.

## A nudge toward better standards

There is a secondary motivation behind Schlussel that I think about a lot. **I want to nudge companies toward making authentication easier for agents.**

Right now, most OAuth implementations are designed with humans in mind. They assume someone is sitting at a browser, clicking through consent screens. The device code flow exists as an alternative for CLI tools, but many services do not support it. Some services require you to register an OAuth application before you can even try to authenticate, which is a non-starter for agents that need to work across many services.

By building a public database of authentication methods and making it easy to see which services support agent-friendly flows, I hope to create some pressure. If GitHub supports device code flow and your competitor does not, that becomes visible. If Linear offers public clients and you require registration, developers will notice.

The best outcome would be for services to adopt standards like [RFC 8628](https://datatracker.ietf.org/doc/html/rfc8628) (device authorization grant) and [RFC 7591](https://datatracker.ietf.org/doc/html/rfc7591) (dynamic client registration). These standards exist precisely for this use case. They just need wider adoption.

## How it works in practice

The CLI is straightforward. To authenticate with GitHub using the device code flow:

```bash
schlussel run github --method device_code --identity personal
```

This opens a browser, shows you the code to enter, polls for completion, and stores the token securely. The `--identity` flag lets you manage multiple accounts for the same service.

Once authenticated, getting a token is a single command:

```bash
TOKEN=$(schlussel token get --formula github --method device_code --identity personal)
curl -H "Authorization: Bearer $TOKEN" https://api.github.com/user
```

The CLI handles token refresh automatically. If you have a refresh token and the access token is expired, it will refresh it before returning. Cross-process locking ensures that multiple agents do not try to refresh the same token simultaneously.

For agents, there is also a skill document at [schlussel.me/skill](https://schlussel.me/skill) that provides instructions they can follow. It explains the available commands, the formula schema, and best practices for using Schlussel in agentic workflows.

## The broader picture

I see Schlussel as part of a larger shift in how we build tools for agents. We are moving from a world where agents have to figure everything out from scratch to a world where they have access to structured knowledge that lets them act efficiently.

Authentication is just one piece. But it is a foundational piece. Every agent that wants to do something useful with external services needs to authenticate first. If we can make that simple and reliable, we unlock a lot of potential.

The project is open source and contributions are welcome. If there is a service you want to add, the formula format is documented and easy to extend. The goal is to build a comprehensive database that covers the services agents actually need to use.

You can find Schlussel at [github.com/pepicrft/schlussel](https://github.com/pepicrft/schlussel), and the API and documentation at [schlussel.me](https://schlussel.me).

I am curious to see where this goes. Authentication feels like one of those problems that should have been solved by now but keeps causing friction. Maybe a simple database of structured knowledge is all we needed.
