+++
title = "Set up a Woodpecker CI in Hetzner server for your Codeberg account"
description = "A guide to setting up a self-managed Woodpecker CI on a Hetzner server for continuous deployment of a website hosted on Codeberg."
tags = ["Hetzner", "CI", "Codeberg"]
published_at = "2024-11-05T12:00:00+00:00"
+++

Lately, I've been reducing my reliance on closed-source platforms and replacing them with open-source alternatives. One of those platforms is GitHub, which I've used for years. While GitHub will remain the home for projects like Tuist—since we’ve built a community there—I don’t really need it for my personal projects, which at this point mainly include my website, the one you're reading right now.

So, I thought, why not move it to an open-source Git forge backed by a non-profit organization? That's exactly what I did. The website is now hosted on Codeberg.

Unfortunately, as you might expect, these transitions come with some costs. Platforms like GitHub have invested heavily in providing a high level of convenience and free services, such as CI for open-source repositories. Losing those perks is frustrating, right?

On Codeberg, I have issues, pull requests, and a file explorer—but no CI. So, how am I going to continuously deploy my website on every commit to main? #shade

So my nerdy self couldn't resist and explored what a self-managed CI solution integrated with Codeberg would look like. This blog post is a documentation of the setup I came up with, which I expect to be useful to my future self, and also to anyone else who might be in the same boat.

## Woodpecker CI

One of the best aspects of open-source is that there are powerful alternatives for nearly everything. Codeberg recommends [Woodpecker CI](https://woodpecker-ci.org), a robust CI solution written in Go. Sure, the UI might not be its strongest feature, but it gets the job done incredibly well. It even includes advanced features like auto-scaling, which might interest more experienced users.

Our setup will involve a publicly accessible server running the Woodpecker server, the Woodpecker agent, and CI workflows within Docker containers. Additionally, we’ll configure a reverse proxy to handle TLS termination with Let’s Encrypt certificates.

## Installing Docker on the Host

Having obtained a server that's accessible via SSH, which in my case is one of the cheapest options from Hetzner with the x86\_64 architecture and Ubuntu pre-installed, you can install Docker by following the [official documentation](https://docs.docker.com/engine/install/ubuntu/). To verify that Docker is up and running, you can run the command:

```
sudo docker run hello-world
```

The success of the command will indicate a successful installation.

> Note about the connection: You'll need to have SSH access to the server. In my case, I use VSCode's SSH capabilities not only to open a terminal session but also to edit files directly on the remote server.

## Creating a Docker Compose File

To orchestrate the launching of all the services, we are going to use Docker Compose. Create a file at `/opt/woodpecker/docker-compose.yml` and add the following content:

```
services:
 traefik:
 image: "traefik:v3.1"
 container_name: "traefik"
 command:
 - "--log.level=TRACE"
 - "--api.insecure=true"
 - "--providers.docker=true"
 - "--providers.docker.exposedbydefault=true"
 - "--entryPoints.web.address=:80"
 - "--entryPoints.websecure.address=:443"
 - "--certificatesresolvers.ci.acme.httpchallenge=true"
 - "--certificatesresolvers.ci.acme.httpchallenge.entrypoint=web"
 - "--certificatesresolvers.ci.acme.email=postmaster@pepicrft.me"
 - "--certificatesresolvers.ci.acme.storage=/letsencrypt/acme.json"
 ports:
 - "443:443"
 - "80:80"
 volumes:
 - "./letsencrypt:/letsencrypt"

 woodpecker-server:
 image: woodpeckerci/woodpecker-server:v2.7.1
 container_name: woodpecker-server
 ports:
 - 8000:8000
 labels:
 # Web secure
 - "traefik.http.routers.woodpecker-secure.rule=Host(`ci.pepicrft.me`)"
 - "traefik.http.routers.woodpecker-secure.entrypoints=websecure"
 - "traefik.http.routers.woodpecker-secure.tls.certresolver=ci"
 - "traefik.http.routers.woodpecker-secure.tls=true"
 - "traefik.http.services.woodpecker-secure.loadbalancer.server.port=8000"
 # Web
 - "traefik.http.routers.woodpecker-http.rule=Host(`ci.pepicrft.me`)"
 - "traefik.http.routers.woodpecker-http.entrypoints=web"
 - "traefik.http.routers.woodpecker-http.middlewares=redirect-to-https"
 # Redirect middleware
 - "traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https"
 volumes:
 - woodpecker-server-data:/var/lib/woodpecker/
 environment:
 - WOODPECKER_ADMIN=pepicrft
 - WOODPECKER_OPEN=true
 - WOODPECKER_HOST=https://ci.pepicrft.me
 - WOODPECKER_FORGEJO=true
 - WOODPECKER_FORGEJO_URL=https://codeberg.org
 - WOODPECKER_FORGEJO_CLIENT=client_id
 - WOODPECKER_FORGEJO_SECRET=secret
 - WOODPECKER_AGENT_SECRET=agent_secret
 - WOODPECKER_SERVER_ADDR=:8000

 woodpecker-agent:
 image: woodpeckerci/woodpecker-agent:latest
 command: agent
 restart: always
 depends_on:
 - woodpecker-server
 volumes:
 - woodpecker-agent-config:/etc/woodpecker
 - /var/run/docker.sock:/var/run/docker.sock
 environment:
 - WOODPECKER_SERVER=woodpecker-server:9000
 - WOODPECKER_AGENT_SECRET=agent_secret
 - WOODPECKER_MAX_WORKFLOWS=8
volumes:
 woodpecker-server-data:
 woodpecker-agent-config:
```

Now that we have three services, Traefik, Woodpecker Server, and Woodpecker Agent. Traefik acts as a reverse proxy and a TLS terminator for Woodpecker Server. One cool thing about Traefik is that the configuration can be passed through CLI arguments or Docker labels, which makes it super easy to manage the configuration of the services. Note that we are mounting the `/opt/woodpecker/letsencrypt` directory to store the Let's Encrypt certificates and reuse them across runs.

The second service is the Woodpecker Server. This one starts the HTTP service that orchestrates the CI/CD pipelines and provides a web interface to manage the workflows. In my case, I'm using Codeberg, which uses the Forgejo Git forge, but you can use GitLab, GitHub, and the handful of others available out there. To authenticate, you'll need to create an OAuth application in your Git forge account and use the client ID and secret in the `WOODPECKER_FORGEJO_CLIENT` and `WOODPECKER_FORGEJO_SECRET` environment variables. Or the respective ones for the other Git forges.

You'll also need to create an agent secret and use it in the `WOODPECKER_AGENT_SECRET` environment variable. You can do so by running the following command:

```
openssl rand -base64 32
```

And last but not least, you'll need the agent service, which is the one that will run the CI/CD pipelines. Note in the environment variables that we are setting `WOODPECKER_SERVER` to instruct the agent to connect to the server we just started. And `WOODPECKER_MAX_WORKFLOWS` to limit the number of workflows that can run concurrently.

One thing that's important to call out is the following volume that we mount:

```
- /var/run/docker.sock:/var/run/docker.sock
```

If your workflows don't need Docker, you can skip this volume. However, if you plan to use Docker from your workflows, you'll need to mount the Docker socket. In my case, I need it for the deployment pipelines because I'm deploying the website using OCI images built using Docker.

**Note** that with that line you are escalating the permissions of the `woodpecker-agent` service to have access to the Docker socket, which runs on the host machine. So I'd recommend that you configure the workflows from branches opened by external contributors to require approval from maintainers before running the workflows.

## Systemd Service

To run the services we just created, we can create a Systemd service. Create a file at `/etc/systemd/system/docker-compose@.service` and add the following content:

```
[Unit]
Description=%i service with docker compose
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=true
WorkingDirectory=/opt/%i
ExecStart=/usr/bin/docker compose up -d --remove-orphans
ExecStop=/usr/bin/docker compose down

[Install]
WantedBy=default.target
```

The service will start the Docker Compose file we created at `/opt/%i/docker-compose.yml` and remove the containers when the service is stopped. Note that the systemd service is generic, which means you can use it with other Docker Compose files by just changing the directory.

To start the service, run the following command:

```
sudo systemctl start docker-compose@woodpecker
```

And voilà! You should now have a fully functional CI/CD service running on your server.

## DNS

Remember to point a DNS A record to the Hetzner server's public IP address. In my case, that was `ci.pepicrft.me`.
