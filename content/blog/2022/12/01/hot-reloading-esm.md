+++
title = "Hot-reloading and ESM"
description = "While building Gestalt , I realized that many web frameworks don’t move away from CommonJS because their usage of modules in ESM would lead to a slower hot-reloading experience. This is primarily due to how module graphs are loaded with ESM…"
tags = ["esm", "js", "modules"]
published_at = "2022-12-01T12:00:00+00:00"
+++

While building [Gestalt](https://github.com/gestaltjs), I realized that many web frameworks don’t move away from [CommonJS](https://en.wikipedia.org/wiki/CommonJS) because their usage of modules in [ESM](https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/) would lead to a slower hot-reloading experience. This is primarily due to how module graphs are loaded with ESM – the entire graph needs to be fully loaded before the code starts executing. Imagine how slow hot-reloading would be if that had to happen every time we changed a file. Solving it would be doing **dynamic imports** in development or static ones in production. This can be achieved through a build process that is environment-aware.

```
// Static ESM imports
import { loadRoutes } from "gestaltjs/routes"

// Dynamic ESM imports
function doSomething() {
 const { loadRoutes } = await import("gestaltjs/routes")
}
```
