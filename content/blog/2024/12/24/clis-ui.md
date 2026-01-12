+++
title = "Learnings from logging in a Swift CLI"
description = "Some thoughts on how to treat logging and UI in a Swift CLI."
tags = ["Product", "CLIs"]
published_at = "2024-12-24T12:00:00+00:00"
+++

When building CLIs, it’s common to conflate UI and logging. That’s something we did at [Tuist](https://tuist.dev), most likely because in both cases, text is taken as input. So it’s natural to think that they should be the same thing or that UI is a subset of logging. However, as we worked towards improving the developer experience of the CLI, we realized that it’s better to treat both as separate elements, even though they both work with text and there might be some overlap.

**Logging is useful to debug the execution of the program**, especially in situations where an invocation didn’t yield the expected result. Although often those logs are forwarded through the standard pipelines, they don’t need to be. They can be forwarded to [OSLog](https://developer.apple.com/documentation/os/oslog) or to a file in the file system. Apple’s Swift Log package is designed with this in mind and allows setting up what they call logging backends or handlers.

At Tuist, we dynamically plug one backend at runtime based on the user preferences at invocation time. The preferences are modeled based on two variables: how quiet or verbose they want logs to be, and where they want things to be logged.

This leads to the following scenario. The default logging configuration pipes out logs (except the verbose ones) through the standard pipelines, so developers have a sense of progress without too much noise. The problem? If things fail, developers need to run the command again, opting into verbosity with `--verbose`. But what if the issue is not easily reproducible, and that was the only opportunity to capture what happened? Well, the opportunity is gone. Plus, having to run the same command again just to see it fail with more detailed logs is not the best experience.

I think we should approach this differently. The default is right. You want to see a concise output that indicates how things are progressing throughout the execution. However, we should also have a second handler/backend that forwards the most verbose version of the logs to `oslog` and to a file in the file system. Why? Because on completion, you can point people to the logs, and they can use filtering tools provided by the Console app to get what they need. By doing that, once it completes, if you need the logs for anything—for example, to debug a failure—you have the link to the file right there, so you don’t need to run it again.

Is that enough? I don’t think so. I started the blog post mentioning that we conflate logging and UI, but that they should be different things. **When I think of logs, I think of traces that tell a story of how things are being executed.** But where does an interactive prompt fit into it? It’s not a trace. You use the terminal capabilities with cursors to make it feel interactive, but from the logging perspective, you are only interested in two things: something is being prompted, and the user responded to the prompt. So in non-interactive CLIs, you might just merge UI into logging, but in more interactive CLIs like Tuist’s, I think it’s better to treat it as something independent.

UIs are for developers using the tool. Logs are usually for developers debugging the tool. The needs are different. When you design the text to be an output for the user, there are traits like formatting and spacing that are very important. These traits are not relevant in the context of logs. All you care about in logs is understanding the sequence of events. Therefore, separating the two things forces you to think more deeply about the presentation layer of your CLI. I like to say that text output is the UI layer of CLIs—SwiftUI, if you will. The UI is something you might also be interested in testing with snapshot testing techniques, in the same way you do with your SwiftUI views. It’s tightly connected to the DX, and you don’t want it to be an afterthought.

So at Tuist, we are correcting the course. We are drawing a line between logging and UI, plugging our verbose logs to `oslog`, and revisiting the UI of every component to ensure the experience of each command from the UI standpoint is the most consistent and beautiful that we can ship.
