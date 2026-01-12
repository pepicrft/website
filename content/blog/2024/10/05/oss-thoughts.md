+++
title = "Licenses, governance, and trademarks in the open-source world"
description = "I reflect on the recent WordPress and WP Engine controversy and how it relates to the open-source world."
tags = ["OSS", "Free Software"]
published_at = "2024-10-05T12:00:00+00:00"
+++

You might have heard about the recent [controversy](https://www.theverge.com/2024/10/2/24260158/automattic-demand-wp-engine-revenue-wordpress-battle) between WordPress and WP Engine. As someone who has gone through a small-scale version of that, I've been reflecting a lot on the case. My conclusion is that while there are aspects we could blame on [Automattic](https://automattic.com), some of the blame, though fair, arises from misunderstandings about the open-source world. To grasp this fully, we need to talk about three key things: *licenses, trademarks, and governance.*

## Licenses

Licenses define what you can and cannot do with a piece of software. Some, like the [MIT](https://opensource.org/licenses/MIT), [Apache 2.0](https://opensource.org/licenses/Apache-2.0), or [GPL](https://opensource.org/licenses/GPL-3.0), are approved by the [Open Source Initiative](https://opensource.org/). Others, like the group of [Fair Source](https://fair.io) licenses, aren't, yet they remain equally valid and enforceable.

It's important to highlight three things:

1. A license grants you rights over the code. 2. However, it **doesn't give you the right to decide the project's direction** (often misunderstood). 3. The existence of a trademark prevents you from using the project's name freely (often overlooked).

Many conflicts stem from the mistaken belief that having rights over the software also grants rights over its direction, which is entirely incorrect. Companies and developers should remember that while disagreements over a project’s direction are inevitable, **unlike with closed-source software, open-source projects allow you the freedom to fork the project and take it in the direction you desire.** Though it's often easier to lobby maintainers to change their stance, it's not the only path. This is why companies like [Shopify](https://shopify.com) or [GitHub](https://github.com) ensure they have a voice in the direction of Ruby and Ruby on Rails or join foundations like the [Rust Foundation](https://shopify.engineering/shopify-rust-systems-programming).

The world is diverse, and different developers and companies have different visions for a project, which is perfectly fine. Expecting a single direction to please everyone is utopian. Disagreements over the project’s direction are normal and valid, and expressing them publicly is encouraged. However, depending on the project's governance model, you might have more or less entitlement to influence its direction. Let's delve into governance.

## Governance

The governance of an open-source project refers to the rules and processes that define how decisions are made. Many projects lack formal governance, often resulting in the [benevolent dictator](https://en.wikipedia.org/wiki/Benevolent_dictatorship) model, where the project’s creator or a select group of maintainers have the final say. This is the model that [Rails follows](https://rubyonrails.org/2021/5/2/rails-governance). I'm not here to debate which model is better, but I will say that the absence of governance is a problem and often the root of many conflicts.

At [Tuist](https://tuist.io), we currently lack a formal governance model, so we implicitly follow the benevolent dictator approach. We are working to change that. Bitrise could have [publicly raised](https://bitrise.io/blog/post/tuist-bitrise-build-cache-update) concerns about our lack of governance, and that would have been a fair point. Due to this lack, they wrongly assumed our intentions:

> "The maintainers are showing more interest in extracting revenue from their community than in making decisions that are best for the project and its end users." — Zach Gray, Bitrise

This is completely false. Our focus has always been on making the project sustainable. The work we've done, not only since committing the first line of code but even after that blog post, is a testament to our true incentives. We closed off some parts of the code to prevent an unsustainable imbalance they were unwilling to help us solve.

Here’s the thing: When you're just starting out, you don't spend time crafting the perfect governance model or considering the legal implications of your licenses and trademarks. But as your project grows and garners community value, you're inevitably drawn into capitalist dynamics you never wanted to be a part of. Suddenly, you need to learn and adapt to those dynamics quickly, with far fewer resources than the companies challenging you.

More democratic models are rare in open source. One exception is the Berlin-based Git forge [Codeberg](https://codeberg.org), which has a non-profit foundation backing it, with a board that makes decisions. Anyone can join the board and vote on matters. But this is unique—most projects follow the benevolent dictator model, and that’s okay. While the dictator may act democratically at times, they still have the final say.

If having a say in a project’s direction matters to you, consider this when choosing open-source software. If not, accept the risks of misalignment. You can voice your concerns publicly and try to lobby for changes, but don’t expect maintainers to comply.

To summarize:

1. Governance determines how decisions are made in a project. 2. The absence of governance usually implies a benevolent dictator model. 3. Pure democracy is rare in open source. Benevolent dictators may adopt some democratic practices, but they have the final say.

## Trademarks

Lastly, let’s talk about trademarks. Open-source projects develop a brand around their name. It’s an intangible asset that represents the project’s values and quality. **Registering it is essential to protect it from misuse.**

The creator of [Docker](https://docker.com) acknowledged the mistake of not registering the trademark earlier and took a different approach with [Dagger](https://dagger.io), registering the trademark early and publishing [guidelines](https://dagger.io/trademark-guidelines) on its use. We did the same with Tuist. The Tuist trademark is owned by Tuist GmbH, and we’ve published [guidelines](https://tuist.io/trademark-guidelines) for its usage. Without these protections, anyone could use the Tuist name to create a fork, misleading users into thinking it was the official project, potentially damaging the project's reputation and years of work.

But note this: The trademark must be registered under a legal entity or person. If there’s no company or foundation behind the project, the creator must own it. The creator of WordPress initially registered it under his name, transferred it to the WordPress Foundation, and later granted rights to Automattic for commercialization.

Problems in this area often arise from the subjectivity around trademark usage. I can somewhat understand Matt's concerns about the WordPress trademark’s use by WP Engine. Based on his comments, it seems he had been in talks with them for over a year, expressing these concerns. This reminds me of conversations we had with Bitrise about Tuist's sustainability (we didn't have a trademark at the time). They forked Tuist, directed their customers to use it, and had full freedom to do so, misleading their customers into thinking it was the official project. Naturally, customers didn’t want to rely on a fork not maintained by the original team, and Bitrise didn’t want to work with us to make the project sustainable. It's a bit of the issue between Automattic and WP Engine but a small scale. Automattic wanted a share of WP Engine's revenue or more active contributions to the project, and we only wanted to make the project sustainable. We could have reached good terms, and they'd have benefited from partnering with us, and we'd have benefited from their contributions. And since they were not only unwilling to help us, but also marketed their service as much better than ours, we had to act to protect our project.

In my opinion, having a trademark is crucial. If you maintain an open-source project, I recommend registering the trademark under a legal entity or person as soon as the project gains traction. You'll thank me later.

To summarize:

1. A trademark is an intangible asset that represents the project's values and quality. 2. Without it, misuse of the project’s name can harm its reputation. 3. The trademark owner controls its usage. 4. Guidelines for trademark use can be subjective, leading to conflicts.

## Closing Words

Licenses, trademarks, and governance models are the three pillars of open-source projects.

As **a maintainer**, you shouldn't neglect any of them. Define these aspects early, communicate them clearly (where we could have done better at Tuist), and ensure they are respected. Most importantly, iterate on them as necessary, as the environment and the needs of your project evolve.

As **a consumer of open-source software**, define what matters most to you. Choose projects that align with your values. If direction matters to you, find a way to influence it. Often, in a benevolent dictator model, contributing actively can give you that influence. If you don’t care about the direction, accept the risks and costs of potential misalignment. You can voice your disagreement, but don’t expect maintainers to change their minds. Remember, you often only have entitlement to the code, not to the direction.

Finally, open source is still better than closed source. You may disagree with the direction of an open-source project, but you can fork and maintain it yourself. You can’t say the same about closed-source software—companies providing critical services can shut down anytime, and you won’t get access to the code.

In my view, we need more open source and more education and awareness around these topics.
