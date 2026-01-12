+++
title = "Lynx is an invitation for UI frameworks to support mobile development"
description = "The appearance of Lynx is an invitation for UI frameworks to support mobile development."
tags = ["OSS", "Mobile"]
published_at = "2025-03-10T12:00:00+00:00"
+++

A week ago, [ByteDance](https://www.bytedance.com/en/) announced the release of [Lynx](https://github.com/lynx-family/lynx), a technology for building mobile apps using Web technologies. ByteDance had been using it to power many of their apps, and they decided to package it up and open-source it. Having Lynx enter the space with a new approach is great news for the community.

Something that slightly bothered me about the alternatives to native development is that they were strongly dependent on Google in the case of [Flutter](https://flutter.dev/), or [Expo](https://expo.dev/), which Meta recommends as the framework to use because they deemed it's not their responsibility to address that part for the community. These companies became dominant players in those spaces respectively, and that came at the cost of killing competitiveness, which fosters innovation.

Lynx challenges the status quo, in the same way AI is challenging Apple's ability to catch up with the rest of the industry. And it does so by presenting a technology that's UI framework agnostic. It comes with support for React, but people are already working on adding support for [Vue](https://github.com/lynx-family/lynx/issues/193), and I expect SolidJS, Svelte, and others to follow soon.

In other words, **Lynx paved the way for other frameworks to support mobile development**, unlike React Native, which coupled its solution to React as a framework. It also comes with a fast Rust toolchain, so technologies building upon it don't have to re-invent that part. This is an area where Meta said, "We use different tooling at our scale, so we are not going to bother to support a toolchain," and if you ask me, that's a shame. Lynx recognized that both go hand in hand, and that's amazing.

It's still early days for Lynx, so the future is a bit uncertain, but if I had to make a bet, I strongly believe the fact that it allows other UI frameworks to build upon it will create a unique ecosystem of tools, resources, and libraries that React Native won't be able to compete with.

It's a matter of time, but if ByteDance does well at building a thriving community, I think it can happen. The React Native ecosystem could have gone a similar path, owning an integrated toolchain, and providing the ecosystem with the resources to build great packages, but instead sold it to Expo. Expo is amazing. I think having only Expo is terrible.

With [Tuist](https://tuist.dev) transforming into a platform, I want to play with Lynx to see where we could bring value on the server-side, for example easing the distribution of previews, providing sign-in to the bundling process, or conceptually compressing mobile intricacies. Or maybe helping them break the dependency on [CocoaPods](https://cocoapods.org/).

The future of mobile development is bright.
