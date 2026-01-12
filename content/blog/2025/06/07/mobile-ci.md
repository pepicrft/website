+++
title = "Mobile CI will have to redefine itself"
description = "This is my stream of thought on why mobile CI will have to redefine itself."
tags = ["Tuist"]
published_at = "2025-06-07T12:00:00+00:00"
+++

I've been quite vocal lately about how the CI space for mobile is about to change. It's a matter of time. This led to cutting ties with CI companies, which understandably didn't like us being vocal about that reality. But sooner or later people will realize it, so I'd rather talk about it and move us to a more innovative space than live in a bubble and pretend everything is fine. I'll be talking in this space about mobile CI, but I believe this applies to other ecosystems too.

For many years, CI companies solved the gap that Git forges like GitHub didn't solve: providing a continuous integration service. You push a commit, see in your commit status that something is happening, and on completion you get a result and access to execution metadata. We could think of their offering as two layers:

1. User-facing layer: web-based UI, pipeline editing features, ecosystem of steps... 2. Infrastructure layer: managing the runners in which jobs would run.

Most delegated 2 to third-party providers like MacStadium, and they faced the challenge that the fluid nature of CI demand and the more static nature of getting Macs—which Apple requires you to get for at least 24h—made it difficult to provide a billing model that abstracted away the rigidity of the infrastructure layer. So it was common to find concurrency limits in their models.

But GitHub, GitLab, and all the Git forges changed the game when they decided to provide the user-facing layer. And not only that, but they did so by allowing hosts to be provided not only by them, but by third-party companies.

This translated into: 1. CI companies trying to expand their offering and doubling down on vendor locking. But developers are confused because they don't expect CI to do more than just CI. Competing with a better product was and is extremely challenging because you'll never be able to provide tight UI integration or features like pipeline permissions, where you can declaratively define the scopes you want the token exposed in the pipeline to have access to. 2. We saw an emergence of companies that focused on providing those agents. I call them "CI Runners as a Service" companies.

And this makes things interesting. By talking to Tuist users, I realize that many companies in group 1 are playing the card of "but moving away from us is hard" and trying to increase the size of their contracts by doubling or even tripling their prices. Others are trying to push the margins down or add new products, but once again, people expect CI companies to deliver CI. The only company that I've seen and that in my opinion is doing excellent work at offering a better and more diverse product is Buildkite.

And 2 is also seeing more companies joining, which means competition, and it'll lead to innovation and potentially lower prices. These companies providing runners face the challenge of marketing themselves effectively, so we'll lend our hand to those who align with our values and have built a great product. And the thing is that once you are on GitHub Actions or the equivalent in GitLab, changing from one provider to another is as easy as changing one line in your pipeline yaml file:

```
runs-on: ubuntu-latest # Ubuntu
runs-on: other-provider # Other Provider
```

For some time I wrote about us potentially going to approach two, but the more I thought about it and dove into the space, the more I think it doesn't make sense for us. We don't find joy in doing infra. There are people who have been doing it for longer and do an amazing job at that. Our joy lies in being closer to the user and gluing tools and infrastructure together to provide experiences that wouldn't be possible otherwise.

So my bet is that when it comes to CI, companies will peel away that extra layer and go down to the companies that provide the runners. This means current CI companies will have to redefine themselves as something else, and my bet is that they'll join us in building an integrated platform for app developers. Bitrise started that movement with Mobile DevOps, but I don't think that went as expected. The closest to what we are trying to do is Vercel on the web, or Expo in React Native, so we are trying to bring the same experience to native Apple and Android development.

In this new space, we have a significant moat: our CLI that we've been building for over 7 years and that people use and love every day. This is our competitive advantage. We're going to compile it for Linux and Windows, making it ready for the future that we are shaping.

Pipelines and CI will continue to exist, but we want to part ways from pipelines being the center around which everything builds (release automation, nightly builds or previews, signing). I think the future of mobile is exciting, and we are going to take the lead in shaping it.
