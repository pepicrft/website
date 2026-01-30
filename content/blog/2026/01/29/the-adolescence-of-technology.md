+++
title = "The Adolescence of Technology: Dismantling Power Positions"
description = "What Dario Amodei's essay on AI risks teaches us about technology that challenges entrenched positions of power—and what it takes to navigate the transition."
tags = ["Technology", "Power", "Disruption", "Systems", "Change"]
published_at = "2026-01-29T21:00:00+00:00"
+++

There's a question that haunts anyone building technology that threatens established power. How do you dismantle a position of strength without simply replacing one monopoly with another?

Dario Amodei's recent essay addresses AI risks from a radically different angle. His framework offers a blueprint for anyone attempting to redistribute power in an industry. The careful navigation between doomerism and techno-utopianism. The acknowledgment of uncertainty. The insistence on surgical intervention rather than sweeping mandates.

I have been thinking about this in the context of technology that has the potential to dismantle entrenched positions of power. Not because I believe these technologies are existentially dangerous, but because they share a fundamental characteristic with powerful AI. They redistribute capabilities that were previously concentrated in the hands of a few.

## The GitHub Problem

Every developer exists within a web of dependencies that shape their choices. The social graph determines where contributions live, where reputation accumulates, where a professional network resides. The discovery graph controls how new projects and tools get found, recommended, and adopted by others. The integration graph represents the web of tools and services that connect to each other, creating compound lock-in that deepens over time. The attention graph decides who sees your work, who can benefit from it, who gets to decide what is visible in a developer's world.

In our industry, all of these graphs flow through a single company. GitHub has become the default infrastructure for how developers exist online.

This is not a conspiracy. It is the result of years of network effects, strategic acquisitions, and building what developers actually needed at the time. But it creates something that looks a lot like a power position. A developer's professional identity is hosted on their servers. A project's visibility depends on their algorithms and editorial choices. Integrations become dependencies on their ecosystem. Workflows get optimized for their platform rather than for developer needs.

GitHub did not set out to create a monopoly. They built something useful and the market rewarded them. But now we exist in a world where a resume-ready open source contribution history requires a GitHub profile. Continuous integration and deployment tools integrate most naturally with GitHub Actions. Package registries default to GitHub's infrastructure. Recruitment processes expect GitHub profile URLs as standard practice. The term GitHub star has become a de facto currency in open source projects, used to signal legitimacy and attract contributors.

This is what a dominant position looks like in practice. It is not about one feature being better than the alternatives. It is about the accumulated weight of network effects, integrations, and behavioral expectations creating switching costs that have nothing to do with the underlying value proposition of the platform itself.

## The Adolescence Moment

Amodei argues that powerful AI will arrive in what he calls a technological adolescence. This is a transitional period where humanity has been handed almost unimaginable power but may not have developed the maturity to wield it responsibly. The same dynamic applies to technology that challenges entrenched positions like the dominance GitHub has built over the past fifteen years.

There is a moment, often unexpected, where a new approach becomes capable enough to threaten established players. The incumbent still has overwhelming advantages. They have resources, users, brand recognition, talent, and in GitHub's case, years of network effects that compound daily. But the challenger has something the incumbent cannot easily replicate. A different set of incentives. A different relationship with users. A different definition of what success looks like.

Consider GitHub's position today. They have built the dominant platform through genuine value creation over more than a decade. But their incentives are now aligned with platform optimization rather than developer empowerment. They acquired npm to integrate it into their ecosystem and remove a potential competitive threat. They built GitHub Actions to increase lock-in for teams already using their platform for source code hosting. Every strategic move makes sense from their position as a public company defending its market position. But it also deepens the moat around their dominant franchise.

This is the adolescence. It is turbulent. It is uncertain. And it is precisely when the most important decisions get made.

## Lessons from Amodei's Framework

Amodei spends considerable time distinguishing legitimate risk analysis from doomerism. Doomerism is a quasi-religious belief that doom is inevitable no matter what we do. But he also rejects the opposite extreme, the belief that technology always works out for the best if we just let market forces operate.

In the context of dismantling power positions, this means acknowledging genuine challenges. Replacing a monopoly is genuinely hard. The new technology will have bugs, gaps, and limitations that the established player does not have. Pretending otherwise is self-deception that will lead to poor planning and disappointed users. It also means rejecting inevitability narratives of any kind. Neither the incumbent crushing the challenger nor the challenger inevitably winning is true. Outcomes depend on choices that people make, not on destiny or technological determinism. And it means staying empirical whenever possible. Measure what actually works. Build feedback loops into your product. Adjust based on evidence rather than ideology or hope.

Amodei is explicit about uncertainty throughout his analysis. Nothing in his analysis is certain. AI might not advance as fast as projected. Risks might not materialize in practice. Unknown risks might emerge that no one anticipated. The same intellectual honesty applies to decentralization and competition with entrenched platforms. You do not know what you do not know. The incumbent's next strategic move is unpredictable. Market dynamics are complex and often counterintuitive. Developer behavior is harder to model than you think. Plans will fail and your strategy for dismantling a power position will need revision, multiple revisions probably. The future is not written. Neither the incumbent's dominance nor the challenger's success is fated. Both outcomes remain possible until the choices are made by real people in real situations.

This is Amodei's most practical contribution to thinking about difficult transitions. Surgical interventions. Addressing AI risks requires approaches that are minimally destructive so you do not burn down the entire industry in an attempt to save it. Surgical means targeting specific problems rather than issuing sweeping mandates that affect everything at once. Reversible means that if an intervention does not work as intended, you can walk it back and try something else.

For technology challenging power positions like GitHub's dominance, this translates into concrete principles. Build incrementally and ship small changes that you can measure and reverse if they do not work. Do not bet the entire company on a single grand vision that cannot adapt to new information. Create genuine escape hatches. If your technology becomes successful, ensure users can leave. Actually leave with their data, with their relationships, with their reputation intact. And coordinate with incumbents where possible. Some transitions can be collaborative and benefit everyone. Others will be zero-sum confrontations. Know the difference and act accordingly.

## The Parallel Risks

Amodei identifies five categories of AI risk in his essay. Each has a direct parallel in the context of technology that attempts to redistribute power in software development.

### Autonomy Risks and Governance Risks

AI might pursue goals that diverge from human intentions in subtle ways that become apparent only too late. In power redistribution, the challenger might develop its own incentives that diverge from its original mission as it grows and succeeds. Success creates new pressures. New pressures create new priorities. Before you know it, you are optimizing for growth metrics instead of user value. The parallel question is how do you maintain the original mission when you have power to protect and defend. Amodei's answer for AI is Constitutional AI, training systems with high-level principles rather than specific instructions that can be gamed. For challenger technology, the answer is similar. Build principles into the foundation of the project, not just into the code. Make them visible. Hold yourself accountable.

### Misuse for Destruction and Capture by Incumbents

AI could be misused by bad actors to cause harm in ways the original builders did not intend. Similarly, technology built to challenge incumbents could be captured by them, acquired and neutralized, or simply cloned and outspending the original. Amodei's response is layered with multiple defenses. Transparency, monitoring, public disclosure of how systems work. For challenger technology, the parallel is open governance. Make the technology's incentives visible to everyone. Let users see how decisions get made. Build in public and maintain openness even as you scale.

### Seizing Power and Becoming the New Monopoly

This is the central fear that haunts anyone attempting to dismantle a power position. You set out to break a monopoly and end up becoming one. The power position is preserved, just with a different name on the letterhead and a different set of executives making the same kinds of decisions. Amodei's framework suggests two answers to this problem.

The first is to design for dispersal from the beginning. Build technology that cannot be easily centralized no matter how successful it becomes. Prefer decentralized protocols over centralized platforms. Build interoperability rather than lock-in. Ensure data portability rather than proprietary formats that trap users.

The second answer is accepting that you might fail. The honest acknowledgment that you could become the thing you set out to destroy is precisely what makes it less likely to happen. The incumbents never had this doubt about themselves. They saw themselves as providing value, earning their position fairly. That is partly why they are vulnerable to competition, and also partly why they persist in behaviors that would be unsustainable for a genuine challenger.

### Economic Disruption and Transition Costs

AI might cause mass unemployment and fundamentally disrupt labor markets. Power redistribution might cause mass disruption too. Jobs will be lost. Careers will be upended. Entire ecosystems will be transformed. Someone always pays the price of progress, and pretending otherwise helps no one. Amodei does not have a perfect answer here. He advocates for surgical interventions and acknowledges that some disruption is inevitable but should be minimized whenever possible. For technology challenging power positions, the parallel is genuine care for the transition. Help people adapt to new systems. Build in migration paths that actually work. Do not celebrate the incumbent's pain or mock their users. Remember that the humans affected by these transitions have valid concerns that deserve consideration.

### Indirect Effects and Unintended Consequences

Amodei's final category is the hardest to predict of all. These are second and third-order effects that ripple through society in ways that were not anticipated by anyone. The same applies to power redistribution in technology. You solve one problem and create three others that no one saw coming. The only real defense is humility. Stay open to feedback from unexpected sources. Watch for warning signs that your interventions are having effects you did not intend. Accept that you will not anticipate everything no matter how careful your planning.

## The National Security Framing

Amodei offers a provocative thought experiment in his essay. Imagine a country of geniuses materialized in 2027, fifty million people with Nobel-level capabilities operating ten times faster than ordinary humans. A national security advisor would call this the single most serious threat the nation has faced in a century.

Apply the same framing to GitHub's dominance. Imagine a credible alternative emerges that genuinely threatens their position. What would Microsoft's strategic response look like, knowing their entire developer ecosystem depends on this platform? What would the challenger's response to that response look like? What second-order effects would ripple through the entire software development ecosystem?

GitHub is not going anywhere tomorrow. The platform has genuine utility and genuine network effects that protect it. But they are not immune to competitive pressure either. The question is whether that pressure comes from genuine alternatives built by companies with different incentives, or from regulatory intervention that tries to mandate outcomes without understanding the dynamics, and whether the industry can evolve without catastrophic disruption that hurts everyone including the users who depend on these systems today.

This is not defeatism. It is strategic clarity. Understanding the forces at play, including the possibility that you might become the thing you set out to oppose, is a prerequisite to navigating the transition well. Ignoring these dynamics does not make them go away.

## What Success Looks Like

Amodei ends his essay with a claim of genuine optimism. He believes deeply in humanity's spirit and its nobility, but we must face the situation squarely without illusions about where we are and where we might end up.

For technology that challenges power positions, success looks like several things at once. A more distributed ecosystem where power is genuinely dispersed rather than simply transferred from one owner to another. User agency so that people can leave, choose, and adapt without losing everything they have built. Continued evolution so that the technology itself remains open to improvement and critique rather than becoming calcified. And the original mission intact at the end of the process. You did not become the thing you set out to dismantle. You genuinely changed the game.

None of this is guaranteed. But none of it is impossible either. The outcome depends on choices that are still being made.

## The Unanswered Questions

Amodei admits uncertainty about AI's trajectory throughout his essay. The same uncertainty applies to competition with established platforms. Can you decentralize without fragmenting into pieces that are too small to be useful? Is there a stable path between monopoly and chaos, or is constant disruption the new normal that we should accept? Do developers actually want agency and control over their infrastructure, or do they prefer convenience and the illusion of safety that comes from relying on a single trusted provider? What happens when the transition completes? Is there a stable end state, or is continuous disruption just the new normal for software development? Who pays for the transition? The incumbent who built the position? The challenger who wants to take it? Individual developers who just want to do their work? Society at large?

These questions do not have definitive answers yet. That is what makes this moment an adolescence. Neither childhood, which was the comfortable old order where everyone knew the rules, nor adulthood, which would be a stable new equilibrium that we could settle into. Just the uncomfortable, uncertain, necessary passage between the two that every technology goes through at some point.

## The Alien's Question

Amodei opens his essay with a scene from Carl Sagan's Contact. The astronomer is asked what question she would pose to aliens if she ever got the chance. Her answer is simple but profound. How did you do it? How did you evolve, how did you survive this technological adolescence without destroying yourselves?

We do not have the aliens answer. We are writing it ourselves, one choice at a time, through the decisions we make about what technology to build, what trade-offs to accept, and what kind of industry we want to have in ten years.

The technology that challenges power positions is neither savior nor destroyer. It is a force multiplier. For good intentions and bad. For user empowerment and vendor lock-in. For disruption and stability. For the challengers and for the incumbents.

The outcome depends on us. Not on inevitability. Not on technology's inherent properties. On the choices we make, the principles we embed in our systems, and the willingness to face the situation squarely without illusions about what we are doing and where we might end up.

That is the adolescence. And we are living in it right now.
