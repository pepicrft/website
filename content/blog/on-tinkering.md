+++
title = "On tinkering"
date = 2026-05-27T12:00:00+00:00
slug = "on-tinkering"
description = "On tinkering with new ideas, the tension with perfectionism and fear, and building Tuist as a company that keeps pushing the line for what's possible."

[taxonomies]
tags = ["Tuist", "Reflection", "Craft", "AI", "Business"]
+++
I like tinkering. I like sitting with a new idea and feeling its shape, even when similar solutions already exist in the space, because I believe other nascent ideas can grow out of the fun of having played with something. There is nothing more beautiful in tech than being able to do this at such a low cost. Other industries do not have this luxury. Building a prototype car, a piece of furniture, or a kitchen appliance is a serious investment. For us, it has always been cheap, and with LLMs it has become cheaper still. The cost of exploring an idea is collapsing toward zero, and we should celebrate that.

## The two enemies

What I have learned with time is that this attitude is constantly in tension with two things: perfectionism and fear.

Perfectionism is the more seductive of the two. There will never be a perfect enough prototype to share with the world, and if you wait for one, you will end up working in a vacuum toward something far away, eventually giving up or procrastinating because the distance has grown too large. Perfectionism dressed up as care can quietly kill companies.

Fear does its part too. What if I cannot bring anything meaningful? What if no one uses it? What if people criticise it because I went my own way? What if I prove the idea was not great to begin with? These are the ingredients of companies and economies that lack innovation, stagnate, and eventually die. They get killed by their own way of operating while sleeping on their dominant positions.

For Marek and me, it became clear early on that we did not want Tuist to be that. Exploring creative solutions to problems is what brings us the most fun. Some of our prototypes will be abandoned. So what? We have a track record of pushing the right ideas all the way to valuable solutions that people pay for. That is enough.

## What Shopify taught me

This was something I appreciated a lot during my time at [Shopify](https://shopify.com). The company always strived to explore the different shapes e-commerce could take and morph into, which sometimes meant building things that went nowhere. So what?

They also did something subtler. They would come up with their working frameworks first, and then build the internal tools that reflected those frameworks. Not the other way around. That method used to be a luxury reserved for companies of Shopify's size. Today it is accessible to anyone willing to have an honest conversation with themselves about how they want to work.

## Automating the company we want

I cannot stop thinking lately about how we should operate as a company where most of our operations are automated, following our own take on how those processes should run.

Most of our lead lifecycle management is now in our [Atlas](https://pepicrft.me/blog/atlas/) platform. I have started moving all our finances there too. I am playing with a few frameworks to map infrastructure alerts and errors to a ready-to-review PR, and we will keep adding more from there. The best part is that while we have investors, we have not sold any promise that we will hire X people to achieve Y. We are optimising for how to do more with less, bringing in talent where we think it matters most inside this framework.

## The experiments around it

This extends beyond operations. We built an extra review partner, [Blick](https://github.com/tuist/blick), to bring extra eyes and give us a foundation to iterate on the model. I have also recently fallen in love with the ideas behind swamp.club as a framework where operations can be codified and shared across environments. And I am tinkering with a sort of build system or automation layer, drawing design decisions from Bazel, but designed assuming that agents are the main elements interacting with it, which changes a lot of the design.

For some of these ideas, I do not know if they will go anywhere. Many times, after I have built something and felt it, or played with the idea in my head for a while, I come to the realisation that it makes no sense. So what? We would rather have Tuist remembered as a company that tried things and pushed the line for what is possible, than a company that grew comfortable with what it once was and never had the appetite to go beyond.

Coding agents brought us the foundation to build the company we want to build with such a small team.
