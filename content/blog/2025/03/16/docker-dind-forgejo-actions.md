+++
title = "Setting up Docker DinD in Forgejo Actions"
description = "Learn how to use Docker from your Forgejo Actions pipeline."
tags = ["Git"]
published_at = "2025-03-16T12:00:00+00:00"
+++

I spent a fair amount of time today trying to get Docker DinD working in Forgejo Actions, so I thought I'd share the steps for my future self or anyone running into a similar need.

If you want to build a Docker image from Forgejo Actions when using Docker as a runner, you'll have to use [Docker-in-Docker](https://www.docker.com/resources/docker-in-docker-containerized-ci-workflows-dockercon-2023/).

## Steps

1. The first thing you'll need to do is enable `privileged` mode when launching task containers. This is done by setting the attribute `container.privileged` to `true` in your runner's `config.yml` file.

**Note:** This has security implications, so use it with caution. Before running actions for external contributions, ensure that they are not malicious.

2. Once you've made this change, restart the runner.
3. The next step is configuring your pipeline to start a sidecar service with Docker DinD:

```
name: MyProject
on:
 push:
 branches:
 - main
 pull_request: {}
jobs:
 build-image:
 name: Build image
 runs-on: debian-latest
 container:
 image: node:20-bookworm
 options: >-
 --privileged
 env:
 DOCKER_HOST: "tcp://docker:2375"
 DOCKER_TLS_CERTDIR: ""
 services:
 docker:
 image: docker:24.0.5-dind
 options: >-
 --privileged
 env:
 DOCKER_TLS_CERTDIR: ""
 steps:
 - uses: actions/checkout@v3
 - name: Install Docker
 run: |
 apt-get update
 apt-get install -y ca-certificates curl gnupg
 install -m 0755 -d /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
 chmod a+r /etc/apt/keyrings/docker.asc
 # Add the repository to Apt sources:
 echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
 $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
 tee /etc/apt/sources.list.d/docker.list > /dev/null
 apt-get update
 apt-get install -y docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 - name: Build image
 run: |
 docker build -t my-project .
```

**Note:** The above pipeline is designed for Debian as the OS, so you might need to tweak it according to your specific requirements.

That's all you need. The `--privileged` flag is one of the most important elements - without it, things simply won't work.
