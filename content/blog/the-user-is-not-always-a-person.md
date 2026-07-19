+++
title = "The user is not always a person"
date = 2026-07-19T09:00:00+00:00
slug = "the-user-is-not-always-a-person"
description = "For as long as we have built SaaS, we assumed a human was the one registering, setting up, and wiring things together. That assumption is quietly breaking, and it changes how software should be designed."

[taxonomies]
tags = ["Tuist", "AI", "Agents", "Product"]
+++
There is an assumption baked so deep into how we build software that most of the time we do not even notice we are making it. When we sit down to design a SaaS product, we assume the thing on the other side is a person. A human signs up, a human clicks through the setup, a human creates the project and generates the token and connects the repository and, eventually, after enough tooltips and empty states, gets everything wired together. Every onboarding flow we have ever written quietly assumes there is someone with eyes and hands and a certain amount of patience on the receiving end, and for a very long time that has been a perfectly reasonable thing to assume.

I have started to think we should hold that assumption a lot more loosely than we do, because it is breaking, and it is breaking faster than most of the software built on top of it is prepared for.

## The thing in the middle

What has changed is that there is now something sitting between the person and the platform, and that something is increasingly the one taking the action. Call it a coding agent, a harness, an assistant, whatever you like. The developer still has the intent, they still know what they want to happen, but they are no longer the one doing the registering and the configuring and the connecting. They describe the outcome, and something else goes and produces it.

Once you start looking at your own product through that lens it becomes a little uncomfortable, because a lot of what you built, the guided setup, the carefully sequenced onboarding, the copy that explains the next step, was all designed for an actor that is no longer the one showing up. I think assuming the human is the one performing the action is going to age about as well as assuming everyone is on a desktop did, and the interesting question is not whether that shift happens but what a platform should look like once you take it seriously.

That is a good chunk of what I have been spending my time on at [Tuist](https://tuist.dev) lately. Not the polite, incremental version of it, but the version where I actually try to imagine most of the meaningful actions being taken by an agent on behalf of a person, and then work backwards from there to figure out what we would need to be good at.

## Start with authentication

The most obvious action to get right is authentication, because before an agent can do anything on your behalf it has to get you an account and get itself authorized to act, so that is where I started.

We implemented [auth.md](https://workos.com), following the shape that the [WorkOS](https://workos.com) folks have been turning into something closer to a protocol. The idea is almost embarrassingly simple in hindsight. A platform publishes a well-known document that describes, in a way an agent can actually read and follow, how to authenticate against it: where to send the developer so they can claim their account, what the flow looks like, and how the agent picks the credentials back up once the human part is done.

So picture the realistic version of this. You are in the middle of a session, you decide you want to set up Tuist, maybe because you are tired of waiting on your Gradle builds or your Xcode compilations, and instead of the agent handing you a docs link and wishing you luck, it walks through a flow that was designed specifically for this handoff. It does the registration, it takes you through the one part that genuinely needs a human, which is confirming that you are you and claiming your identity, and then it comes back authenticated and ready to keep working. The agent did the authentication. You just vouched for yourself.

## Benchmarking the agent instead of the human

The part of this I have enjoyed the most is figuring out how to know whether it actually works, and not just in the happy path I had in my head when I wrote it.

What I have been doing is asking a coding agent to drive a second coding harness in headless mode. That second harness is connected to our [MCP](https://modelcontextprotocol.io) server locally, it has the docs available to it, and its whole job is to come in cold and complete the authentication task the way some developer's agent would encounter it for the very first time, with none of my context. Then I look at what happened. How far did it get, where did it hesitate, what did it misread, where did it go looking for something that was not where it expected it to be. Every one of those friction points is a friction point a real developer's agent would hit too, so I go and fix the docs, or the flow, or the auth.md itself, and I run the whole thing again. What I am optimizing for is that any coding harness, not just the one I happen to be sitting in front of, can get through authentication cleanly and without me holding its hand.

It is a slightly disorienting thing to write a benchmark whose subject is not your code and not your user but the agent that stands in for your user, and yet that is exactly the point of the exercise. If the agent is the one taking the action, then the agent's success rate is the number that actually matters, and pretending otherwise just means you find out about the gaps later, from someone who is annoyed.

And when it works, it folds into the moment so naturally you almost forget it is happening. You are working on something, the agent realizes this would be faster with Tuist, and it asks whether you would like it to set that up. You say yes, and it does.

## The same pattern, one layer out

Authentication is only the first of these actions. The same shape shows up again the moment you think about integration.

Setting up Tuist inside an existing project, whether that is an Xcode project or a Gradle one, is another thing developers used to do by hand and will increasingly just hand off, so I have been building it the same way, treating every action a developer might take through a harness as something the harness itself has to be genuinely good at. This is also where the [automation substrate I have been writing about](/2026/02/24/the-forge-is-next/) fits in, because when someone prompts something like "create me an app for iOS and Android with shared Rust code," the natural next beat in that conversation is "can you also integrate this with Tuist," and I want the agent to have every resource it needs sitting right there to do it. The outcome I am after is that in one prompt, maybe two, you do not just walk away with an account. You walk away with the account, the integration, and the configuration all in place, because at no point did the agent run out of what it needed to carry the action to completion.

## Every platform has a headless version now

The generalization I keep landing on is that every platform now has a headless version of itself, and the head, the part doing the driving, is the harness.

We borrowed the word headless from browsers and CMSs, where the move was always to take something coupled to an interface and pull that dependency out so it could be driven by anything. I think platforms are simply next in line, and the question worth sitting with is what the headless version of your product looks like, the one an agent operates, and where the head has actually moved to, because it is not your onboarding UI anymore. It is the harness the developer was already talking to before they ever thought about you.

I suspect this runs further than setup and integration, all the way out to money. I fully expect agents to subscribe and pay on behalf of the people they are working for, and [Stripe](https://stripe.com) is already building the primitives that would let that happen, the pieces that let a machine transact inside boundaries a human set. This is not some distant thing to speculate about, it is a roadmap that is already partly shipped, which is usually the sign that it is worth paying attention to.

## Building toward a world that has not arrived yet

There is a tension in all of this that I would rather name than pretend away. Almost none of what I just described is what customers are asking us for today. Today they ask for the obvious things, the incremental improvements whose value is legible and whose willingness to pay we can already feel, and we build those, and we should build those, because that is what pays for the rest of it and it is genuinely useful.

But if I actually believe that in a couple of years the world looks like this, with agents as the primary actors and, eventually, the paying customers on behalf of the humans behind them, then building only the incremental thing is just a comfortable way to end up late. So alongside the obvious work we try to build toward the future we actually think is coming, and to be ready for it a little before it is undeniable, because when that shift finally becomes obvious to everyone I would much rather Tuist be one of the places where this way of working already feels normal than one of the places frantically retrofitting it.

That is a lot of where my attention has gone lately, both at Tuist and in the little experiments I keep running on this site, and it all traces back to that one quiet assumption we inherited without ever really examining it, the assumption that the user is a person. It has been true for a long time, it is becoming less true every month, and the sooner we start holding it loosely, the better the software we will build for whatever is actually on the other side.
