+++
title = "Generation of Swift interfaces to access resources"
description = "Many of you might already be familiar with SwiftGen ; a tool that generates Swift code to access resources in a type-safe manner. Having a type-safe API is something that Android developers have had for a long time, and that Apple has never…"
tags = ["Tuist", "swiftgen", "project generation", "Xcode", "Swift", "fastlane"]
published_at = "2020-02-25T12:00:00+00:00"
+++

Many of you might already be familiar with [SwiftGen](https://github.com/SwiftGen/SwiftGen); a tool that generates Swift code to access resources in a type-safe manner. Having a type-safe API is something that Android developers have had for a long time, and that Apple has never added to Xcode.

I think it’s a wonderful idea because we delegate to the compiler the task of checking whether a resource exists or not. It prevents apps from crashing at runtime, and thus improves the stability of the apps.

*Why am I bringing this up?* Because I like the idea so much that I’m pondering integrating SwiftGen into [Tuist](https://tuist.io). SwiftGen suggests adding a new build phase to every target for which we’d like to generate the interfaces. However, I’m planning to do it differently. If users of Tuist enable this feature, the interfaces will be generated at the project generation time. The generated project will already contain the resources and their interfaces ready to be bundled and compiled.

I might give this a shot later this week. I had a look at the SwiftGen project and it exports a target that we can link against to use its API. Moreover, the license is compatible with Tuist’s so there shouldn’t be any issue. I’m planning to set up this first integration defaulting to a conventional format for the interfaces and maybe revisit this in the future to add a certain level of configurability.
