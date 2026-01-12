+++
title = "Setting up a Forgejo runner in Hetzner"
description = "Learn how to configure a Hetzner server as a Forgejo runner to run CI/CD jobs for your projects hosted on Codeberg."
tags = ["CI/CD", "open-source"]
published_at = "2024-11-24T12:00:00+00:00"
+++

Weeks ago, I [wrote](__GHOST_URL__/blog/2024/11/05/woodpecker-ci-for-codeberg) about configuring a Hetzner server with Woodpecker to run CI jobs. At the time, I was not aware of the existence of [Forgejo actions](https://forgejo.org/docs/latest/user/actions/), which are integrated right into the open source Git forge that powers Codeberg, where I'm currently hosting my personal website and code crafts. After giving it a try, I decided to switch to Forgejo actions for my CI/CD needs. This blog post is the counterpart to the previous one, where I'll show you how to set up a Forgejo runner in Hetzner. Let's dive in!

The first thing that you'll need is a Hetzner server. It can be a server from any other provider, which provides you with a Linux machine and SSH access to it. In my case I selected the x86 (Intel/AMD) CX22 machine in Germany with Ubuntu 24.04. Note that the steps that follow assume Ubuntu as the operating system.

Once the machine is up and running, SSH into it using its IP address and the root user. Once in, [install Docker](https://docs.docker.com/engine/install/ubuntu/), which Forgejo runner can use to virtualize the execution of CI/CD pipelines:

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
 $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

You can verify that Docker is installed correctly by running:

```
sudo docker run hello-world
```

Then run the following command to ensure the engine starts on boot:

```
systemctl enable docker
```

## Install the Forgejo runner

The next step is installing the Forgejo runner.

```
sudo apt-get install -y curl jq wget
RUNNER_VERSION=$(curl -s https://code.forgejo.org/api/v1/repos/forgejo/runner/releases/latest | jq -r '.tag_name' | cut -c 2-)
wget -O /usr/local/bin/forgejo-runner "https://code.forgejo.org/forgejo/runner/releases/download/v$RUNNER_VERSION/forgejo-runner-$RUNNER_VERSION-linux-amd64"
chmod +x /usr/local/bin/forgejo-runner
```

Once the runner is installed, you'll have to register it. To do so, you'll need a registration token, which you can get from your user or organization's settings on Codeberg under the "Actions" tab. Then you can run `/usr/local/bin/forgejo-runner register`, which will guide you through the registration process.

```
INFO Enter the Forgejo instance URL (for example, https://next.forgejo.org/):
https://codeberg.org
INFO Enter the runner token:
xxxxxxxxxx
INFO Enter the runner name (if set empty, use hostname: ci):
ci
INFO Enter the runner labels, leave blank to use the default labels (comma-separated, for example, ubuntu-20.04:docker://node:20-bookworm,ubuntu-18.04:docker://node:20-bookworm):
ubuntu-22.04:docker://node:20-bullseye
INFO Registering runner, name=ci, instance=https://codeberg.org, labels=[docker:docker://ubuntu:22.04].
DEBU Successfully pinged the Forgejo instance server
INFO Runner registered successfully.
```

The registration will create a `.runner` file in the current working directory, which if you haven't changed it, will be `/root`. The file will contain the runner's integration configuration.

You can then run the following command to create a configuration file to configure the runner's runtime behavior:

```
/usr/local/bin/forgejo-runner generate-config > config.yml
```

You might want to modify the `runner.capacity` attribute from the configuration file to specify the maximum number of jobs the runner can handle concurrently.

The last step is to configure the runner as a systemd service, which allows it to start automatically when the machine boots up. You'll have to create the following file at `/etc/systemd/system/forgejo-runner.service`:

```
[Unit]
Description=Forgejo Runner
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/bin/forgejo-runner daemon --config /root/config.yml
Restart=always

[Install]
WantedBy=multi-user.target
```

Once the file is created, you can enable and start the service by running:

```
systemctl daemon-reload
systemctl enable forgejo-runner
systemctl start forgejo-runner
```

After completing all the above steps, you should see the runner showing up in the "Runners" tab of your Codeberg organization or user's "Actions" settings.
