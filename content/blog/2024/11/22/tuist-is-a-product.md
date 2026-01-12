+++
title = "Tuist is a product"
description = "How I choose the technology I use"
tags = ["Business", "open-source"]
published_at = "2024-11-22T12:00:00+00:00"
+++

I listened to a [podcast interview](https://www.emilyomier.com/podcast/applying-the-lessons-from-docker-with-solomon-hykes) with [Solomon Hykes](https://fr.wikipedia.org/wiki/Solomon_Hykes), and I liked it a lot. Many of the points he touched on are things we’ve experienced or discussed in shaping the Tuist product. It was great to hear and learn from the experiences of someone else.

Solomon Hykes, the founder of Docker and now Dagger, shares our love for building developer products. Both Docker and Dagger are open-source businesses, meaning their core revolves around open source, community, and open discussions—even when those discussions lean more toward the business side of things. I believe this is how the best and most enduring companies are built. However, as he points out, achieving this is not easy. Why is that?

He differentiates between **products and components**. Components are open-source, standardized pieces that become industry commodities. They often evolve from a product once they’ve matured. It makes sense for such components to belong to a foundation once they’ve reached critical mass. Examples of components include Kubernetes and containerd. Typically, their licenses and trademarks, which are usually managed by foundations, are permissive. This allows businesses to use them as enablers or even integrate them as part of their offerings.

However, [Dagger](https://dagger.io/) and [Docker](https://www.docker.com/) are not components—they are products. What’s the distinction? Products are fully integrated developer experiences that deliver value, often have ecosystems around them, and monetize certain features to fund further development. This funding often extends to investments in components. Solomon emphasizes this distinction as critical for building great developer tools, and we agree.

Some organizations may dislike this approach because it prevents them from leveraging communities and streams of capital to outcompete you and extract value from the community. They often argue, “You’re not open enough,” as Bitrise did when they suggested that Tuist should be part of the [Mobile Native Foundation](https://github.com/MobileNativeFoundation). It was amusing to see them use the same tactics that cloud providers once used against Docker. We don’t have anything against the foundation; in fact, we’re considering extracting Tuist’s generation logic into a component. However, Tuist itself is not a commodity—it’s a product, most of which is open source. This distinction is subtle but important.

Since Tuist is a product, it has features like the `login` command to authenticate with Tuist itself, the vendor behind the product. We see being a product as a critical distinction with significant implications. For example, it’s the reason we’re gradually transforming Tuist into an integrated extension of Apple’s tooling. This evolution wouldn’t have been possible if Tuist were a commodity, which would have led to stagnation. Simply put, we don’t want Tuist to stagnate.

We expect some organizations to dislike this model, and that’s fine. But there are many others who understand the need for this approach—especially from a financial perspective—and are eager to participate in shaping Tuist and its community. Like Docker in its early days, this is where our focus should be. Only by focusing here can we create a truly great product.
