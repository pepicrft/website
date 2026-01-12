+++
title = "VIPER, Looking for the perfect architecture"
description = "Talk I gave in the Redbooth HQ office for NSBarcelona with the iOS team talking about the VIPER architecture"
tags = ["redbooth", "iOS", "8fit"]
published_at = "2014-11-16T12:00:00+00:00"
+++

The past thursday I gave a talk at Redbooth Office with the iOS team about an architecture we had been working with during the past months. We didn't use any architecture until then and the code was too coupled and messy that it was hard to review, debug, detect bugs, ...

We read about VIPER the first time [here](http://www.objc.io/issue-13/viper.html) and we loved the idea of splitting reponsibilities in all those components. We took a look to the example project, analyzed it and finally we applied it to some of our ViewControllers. It was a heavy task because we had to refactor not only those components but those children too but at the end we liked the result, and what easy it was to review the code and understand the implementation.

Moreover I implemented a Ruby Gem to generate those templates automatically in Swift or Objective-C, I called it [*viper-module-generator*](https://github.com/pepicrft/viper-module-generator) and you can easily install it with `sudo gem install vipergen`. We spent a lot of time implementing the same components too many times, the naming was similar, the connections between them too, so why not making this faster?

The talk was recorded and the slides are available in speakerdeck so I would like to share with you them. If you have any doubt about it or you would like to contribute in any way, we are pleased to hear you and talk to you.
