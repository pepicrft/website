+++
title = "A Mise formula for Swift Package development"
description = "Learn how to easily build and test your Swift packages in the host OS, macOS, and Linux."
tags = ["Mise", "DevX", "OSS"]
published_at = "2025-02-25T12:00:00+00:00"
+++

If you develop Swift packages from macOS, and support Linux, you might be interested in the following formula to easily build and test your Swift packages in the host OS, macOS, and Linux.

Whenever I create a new package, I create two [Mise tasks](https://mise.jdx.dev/tasks/), `mise/tasks/build.sh` and `mise/tasks/test.sh`. Then using [usage](https://usage.jdx.dev/cli/scripts) annotations in the scripts, I can easily add support for using `--linux` to indicate a different target OS:

```
#!/usr/bin/env bash
#MISE description="Build the project"
#USAGE flag "-l --linux"

set -eo pipefail

if [ "$usage_linux" = "true" ]; then
if command -v podman &> /dev/null; then
CONTAINER_ENGINE="podman"
else
CONTAINER_ENGINE="docker"
fi

$CONTAINER_ENGINE run --rm \
--volume "$MISE_PROJECT_ROOT:/package" \
--workdir "/package" \
swiftlang/swift:nightly-6.0-focal \
/bin/bash -c \
"swift build --build-path ./.build/linux"
else
swift build --configuration release
fi
```

And that's it. You can now do:

```
mise run build # Build in the host (macOS)
mise run build --linux # Build in Linux
```
