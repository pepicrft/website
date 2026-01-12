+++
title = "Nightly builds are the wrong solution to the right problem"
description = "In this blog post I share why today nightly builds are the wrong solution to the problem, and the alternative that we are proposing."
tags = ["Previews"]
published_at = "2025-03-19T12:00:00+00:00"
+++

Nightly builds in app development are the wrong solution to the problem. We keep cargo-culting because:

1. People are familiar with the term. 2. You don't need to go back to first principles.

This happens not just in the context of app development productivity, but everywhere else. Someone uncovers a new problem or need, for which they build a solution—not necessarily the best one today, but the best one at the time, considering the constraints then. Then, you see a stream of companies jumping into the new markets. Eventually, everything commoditizes, and we get stuck with something that doesn't feel right.

Rinse and repeat.

This is how nightly builds feel to me. The sunsetting of [App Center](https://learn.microsoft.com/en-us/appcenter/retirement) and everyone's rush to profit from it with yet another solution like App Center smells fishy to me.

But what would be the alternative? If we go back to first principles, nightly builds solve testing changes and providing feedback. However, nightly builds are detached in time and space from where the changes originated, often pull requests. Pull requests are the place where conversations around changes happen. Trying to do something distant from that creates a source of friction and a foundation for even more complexity.

Feedback needs to happen in PRs.

And that requires creating builds (which in Tuist we refer to as [previews](https://docs.tuist.dev/en/guides/share/previews)) quickly, when needed, and from anywhere. Let's break that down:

1. **Fast**: You don't want to wait half an hour for a preview because, by the time you get the build, the PR might have already been merged. That's why we built [binary caching](https://docs.tuist.dev/en/guides/develop/cache), and we plan to invest in it further. 2. **When needed**: You should have control over when you want a preview and of what, because, sadly, macOS computing resources are still expensive. You don't want to depend on some pipeline being configured to get what you need. 3. **From anywhere**: By posting a comment on a PR, sending an email, asking your LLM of choice, or tapping a button in a mobile app.

We are actively working on #1, and we are building technology and infrastructure to enable #2 and #3.

Are previews nightly builds? No, they are not. They have in common that the token of exchange is an installable build. The former aligns with collaboration expectations, while the latter makes collaboration less enticing.

Does it suck from a business perspective? Oh yeah! We need to market a new concept and bring people back to the problem that originates the need for something like nightly builds. But this is the type of company we are building—one that focuses on the problems, strives to build the best solutions, and challenges the status quo, adapting as the environment changes. A lot has changed since app builds were proposed, and it's time for something different.
