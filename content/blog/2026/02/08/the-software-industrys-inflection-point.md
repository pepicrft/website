+++
title = "The Software Industry's inflection point"
description = "Reflections on how AI is reshaping code production, why companies must rethink where value lives, and what independence means in a world of accelerating change."
tags = ["Software", "AI", "Business", "Tuist", "Infrastructure"]
published_at = "2026-02-08T10:00:00+00:00"
+++

There is a reality that we can no longer ignore: code is getting fast and cheap to produce. The barrier to creating software has collapsed in ways that would have seemed impossible a few years ago. What once required weeks of engineering work can now be achieved in hours with the right prompting and a capable model. This is not speculation. This is happening right now, and it is accelerating.

At [Tuist](https://tuist.dev), we are watching closely as AI reshapes what is possible in software development. Project generation, which has been at the core of our product, faces new pressures as AI makes it easier to generate code and project structures. While we have not yet seen widespread replication of project generation tools in the iOS space, we are seeing clear signals in adjacent industries that suggest where things are heading.

This shift forces a question that every software company must answer: if code itself is becoming a commodity, where does value actually live?

## The infrastructure problem AI cannot solve

The answer we have arrived at is infrastructure. Here is what we mean. The challenge that remains hard is not writing code. It is running it efficiently at scale. Modern hardware imposes real ceilings on what individual developers can achieve, and those ceilings become painful bottlenecks when you are working on large codebases with complex build processes.

AI can write code faster than ever, but it cannot magically make that code compile faster or run more efficiently on limited hardware. Co-located cache infrastructure, distributed compilation, optimized binary distribution, these are problems that do not dissolve just because code generation became cheap.

We built Tuist to solve these problems for teams working on large iOS projects. The value we provide comes from infrastructure expertise, from years of understanding how Xcode projects behave at scale, from building systems that make teams faster. Infrastructure is hard to build, harder to operate at scale, and genuinely valuable when it works.

## The AWS paradox

Here is where things get complicated. AWS can solve most of these infrastructure problems. EC2, EKS, Lambda, the entire AWS portfolio is essentially infrastructure as a service. For companies willing to invest the effort, it is possible to build your own dev productivity infrastructure on top of cloud primitives.

This might seem like a problem for our business. Why would anyone pay for Tuist when they could just spin up AWS resources and build their own caching layer?

The answer is that most organizations should not try. AWS provides raw infrastructure, but it does not provide the expertise, the tuning, the troubleshooting, or the guarantees that large organizations require. AWS can host your build cache, but they will not wake up at 3 AM when something goes wrong with your specific configuration. They will not help you debug why your incremental builds are not working as expected. They will not give you guidance on how to structure your project for maximum efficiency.

This is why we are thoughtful about our licensing choices. We are transitioning toward more open models because we believe that is where the industry is heading and because it aligns with our values. But we are doing so carefully because we need to ensure the business can sustain itself. Open source is our foundation, but sustainable licensing is what allows us to keep building.

## What companies actually pay for

The honest answer is that companies pay for expertise, trust, and reliability. When a large enterprise runs our software, they are paying for the accumulated knowledge of how to make Xcode projects scale, for the guarantee that someone will respond when something breaks, for the confidence that the service will perform consistently and safely.

AWS can host anything, but meeting the expectations that large enterprises have requires more than hosting. It requires understanding, support, SLAs, compliance certifications, security audits, and a relationship that goes beyond here is an API endpoint, good luck. These things are real value, and they are not easily replicated by cloud providers whose core business is serving everyone equally rather than serving anyone exceptionally.

This is where the software industry is heading. The companies that will thrive are those who provide genuine expertise and genuine service, not just software that can be copied and run elsewhere. The commodity has shifted from code to outcome.

## The workforce evolution

There is something else happening, and it is equally significant. Companies are going to need fewer people, but those people will need to be better. Not better in the sense of working longer hours or being more loyal. Better in the sense of understanding more of the stack, being more comfortable with abstraction, and embracing the model of AI assisted development with genuine curiosity rather than fear.

The era of throwing bodies at problems is ending. When code production is cheap and fast, the bottleneck shifts to understanding, to decision making, to coordination. The most valuable engineers will be those who can work independently, who can make good judgment calls without waiting for approval, and who can navigate complexity without requiring hand holding.

This is exciting. It means higher expectations, but also higher agency. Engineers who embrace this model will have more impact with less overhead. Companies that figure this out will operate with leaner teams that move faster than their competitors.

## Independence as a competitive advantage

Something I am particularly fond of is the level of independence with which we operate at Tuist. We do not have high expectations around ROI from investors. We aspire for the project to grow and succeed, but we do not have the pressure to figure something out fast or die trying.

This gives us something valuable: flexibility to iterate, to experiment, to take the time needed to build something sustainable. Most startups do not have this luxury. They are racing against burn rates and investor expectations, forced into moves that prioritize short term metrics over long term value. We have avoided that trap by staying small, staying focused, and refusing to accept funding that would change our incentives.

In a world where everything is accelerating, this slowness might seem like a disadvantage. I do not think so. The ability to think carefully about where value actually lives, to make strategic choices without immediate pressure, to build for sustainability rather than for an exit, these are advantages. They allow us to play a longer game than most companies can afford.

## The road ahead

We are living through a genuine inflection point in software. The rules that governed the industry for decades are being rewritten in real time. Code production is becoming a commodity. Infrastructure is becoming table stakes. The moats we used to rely on are filling with water.

The companies that adapt will be those who find new places to create genuine value, who build expertise that cannot be easily replicated, and who accept that the old playbooks do not work anymore. We will be one of those companies. We are building infrastructure that solves real problems for teams that care about developer productivity. We are doing it with open source at our core and sustainable licensing that allows us to keep going. We are doing it with a small team that moves fast and thinks carefully about what matters.

It is an exciting time to be building this. And we are just getting started.

Sources:
- [The AI Revolution and the Future of Software Development](https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-ai-revolution-in-software-development)
- [Developer Velocity in the Age of AI](https://newsletter.pragmaticengineer.com/p/developer-velocity-ai)
