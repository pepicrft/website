+++
title = "The Two Dimensions of Mobile Development Infrastructure"
description = "As part of shaping Tuist , and especially in the context of where Tuist can leverage LLMs to bring value to the ecosystem with features like Tuist QA , we like to think of the problem space as two dimensions: platforms and lifecycle . Tuist…"
published_at = "2025-09-10T15:29:16+00:00"
+++

As part of shaping [Tuist](https://tuist.dev), and especially in the context of where Tuist can leverage LLMs to bring value to the ecosystem with features like [Tuist QA](https://tuist.dev/qa), we like to think of the problem space as two dimensions: *platforms* and *lifecycle*.

Tuist's strong focus since its inception has been native development for Apple platforms. And by native here I mean without any runtime abstraction like [React Native](https://reactnative.dev/) or [Flutter](https://flutter.dev/). We know the ecosystem well, we have a presence in it, and we feel very comfortable exploring problems and building the best solutions for them. We are not closed to navigating that dimension by taking our solutions to Android, and potentially abstractions like Flutter and React Native, but the time is not now.

The other dimension is the lifecycle of app development. An app can be broken down into features and dependencies between them, and features usually start with an idea that navigates through different phases, in some of which Tuist supports you.

## **Development**

This has traditionally been our area of focus. **We extend the native toolchain with solutions to make your job easier and faster as a developer.** From [project generation](https://docs.tuist.dev/en/guides/features/projects) that makes managing projects a breeze, to [binary caching](https://docs.tuist.dev/en/guides/features/cache) and [selective testing](https://docs.tuist.dev/en/guides/features/selective-testing) to speed up build and test runs. It turned out there are no companies interested in tackling this problem space for the Apple ecosystem, leaving us with a huge opportunity to build a financial foundation that we can then use as a lever to step into the next phase of app development.

If you think of some solutions that are making their contribution to this space from the angle of AI, we have agentic coding tools like [Claude Code](https://www.anthropic.com/claude-code), [Codex](https://openai.com/codex/), or the many live coding platforms that are crowding the space quite quickly. We thought about exploring that space too, but it took us a bit of waiting to realize it wouldn't be a great idea. At least not today.

## **Validation**

With the feature built, the next phase is ensuring the work is right, and that usually implies tests, and some kind of automation to run those tests automatically as a result of pushing the code upstream. CI. We thought a few times about doing something in the CI space. Companies that like how we support them in the development phase showed interest in trying anything built by us in this space, but similarly, it took us a while to make some realizations that are key, and about which I already talked about [in the past](__GHOST_URL__/mobile-ci-is-plateauing/). TL;DR:

* CI orchestration has been solved by Git forges (e.g. [GitHub Actions](https://github.com/features/actions)), and this is making Mobile CI providers lose customers
* The "pay for runners" is the new and better model that leads to better pricing and services
* We just don't like managing Mac infra. We prefer building on it.

**So we concluded that CI is not something we'd want to do.** We were already doing something in this space with selective testing, but as we thought about automated tests, we came up with the idea of Tuist QA, which I talked about yesterday, and I think it's damn cool. By talking to customers we've also learned that sharding of testing, and infrastructure for snapshot testing are another two areas where companies have traditionally invested resources, and that they'd outsource if there was a company that managed those things for them. We'll get there, but the idea is already in our heads.

There are other forms of validation that you can't catch until the app is built, and for that we built [bundle analysis](https://docs.tuist.dev/en/guides/features/bundle-size), which allows you to catch regressions in bundle size and ensure the app that you ship to your customers is as small as it can be. As you've probably noticed at this point, in development, our problem space centered more around how to make developers more productive. The validation phase centered for us more around how do we make sure that developers are shipping the best apps?

## **Releasing**

This is another territory that we've mentally explored. I was part of building [Shipit Mobile](https://shopify.engineering/mobile-release-engineering-scale-shipit-mobile) at Shopify, and the impact that it had internally was immense. And now that we've invested in integrating with [Namespace](https://namespace.so/) macOS environments, we can make release automation fully CI-independent, breaking away from many existing models that require having a pipeline that builds and pushes the app. This might sound like a tiny thing, but it's not, because it leads to a much better developer experience, and a lot of control for us to build much better experiences, like a release process on the go.

The idea and the appetite are there, but as I mentioned before with other features, the time is not yet right.

## **Monitoring**

Once the app is in the wild, we need to monitor if the app is doing well, and potentially make decisions, like doing a hotfix release that fixes a severe issue. In this territory we step into error tracking, and speaking honestly, it's the territory where it makes the least sense to step into, because error tracking platforms have done this for many years, and have much better products that are hard to compete with. But hey, never say no! PostHog started as an analytics platform, and not too long ago they added error tracking into their product. The integration of a built-in solution with the rest of the product can lead to much better and specific solutions that wouldn't be possible with solutions that are too generic. They'll likely not go the extra mile of building a solution that has knowledge of a specific platform.

Stability is not the only thing that you might want to optimize for. *What about performance?* *Performance of the loading of the UI? What about logs? Or sessions of the users in the app?* Compared to the previous phases, before we do anything in this space, we need to have a very solid service and infrastructure that can scale well. It's not the same building infra and services that support X developers per company as supporting X users per company's application. From the legal standpoint, we are more liable because we'll be dealing with more sensitive data, so monitoring the apps, though on our radar, is something we are holding back on a bit.

## **One more thing... the product (runtime)**

There's one third dimension that would be awesome if we could ever get to. The first two dimensions had the development of the product as a target. But what if the target was the product itself? What if we provided infrastructure for the product itself by leveraging our infrastructure? For example, analytics for your product, since most solutions center around websites or web apps, or product feedback solutions? Or maybe tools around subscriptions. These are just some ideas.

---

We have ambitious plans for Tuist, and a lot of blocks that we are slowly connecting into a cohesive vision to **turn Tuist into infrastructure for mobile app developers**. Our name doesn't constrain us to any problem space, which gives us the flexibility to evolve our vision, and the only constraint today is really capital. Executing all the above vision takes a lot of resources, and a lot of time, but we look at this constraint as something positive, because it helps us be very mindful about what the next step is going to be, and when it's very clear we just take it. This prevents jumping into areas too eagerly, and that's the reason why we didn't jump into building a Lovable for iOS or trying to solve CI for mobile. They just don't make sense.
