# Koha docker images on ARM64

## great news, ktd-arm64 support has been merged into the main KTD repo with [issue 370](https://gitlab.com/koha-community/koha-testing-docker/-/issues/370)

```text
 _    _      _                             __   _  _
| | _| |_ __| |       __ _ _ __ _ __ ___  / /_ | || |
| |/ / __/ _` |_____ / _` | '__| '_ ` _ \| '_ \| || |_
|   <| || (_| |_____| (_| | |  | | | | | | (_) |__   _|
|_|\_\\__\__,_|      \__,_|_|  |_| |_| |_|\___/   |_|

```

## use the following steps to start a koha instance on arm64v8...

```shell
$ uname -a
Linux ip-172-31-X-X 5.10.0-19-cloud-arm64 #1 SMP Debian 5.10.149-2 (2022-10-21) aarch64 GNU/Linux

$ neofetch --stdout
mason@ip-172-31-X-X
--------------------
OS: Debian GNU/Linux 11 (bullseye) aarch64
Host: t4g.small
Kernel: 5.10.0-21-cloud-arm64
Uptime: 54 days, 13 hours, 32 mins
Packages: 770 (dpkg)
Shell: bash 5.1.4
CPU: (2)
Memory: 211MiB / 1868MiB

$ dpkg -l | grep docker
ii  docker-buildx-plugin              0.10.4-1~debian.11~bullseye    arm64        Docker Buildx cli plugin.
ii  docker-ce                         5:23.0.3-1~debian.11~bullseye  arm64        Docker: the open-source application container engine
ii  docker-ce-cli                     5:23.0.3-1~debian.11~bullseye  arm64        Docker CLI: the open-source application container engine
ii  docker-ce-rootless-extras         5:23.0.3-1~debian.11~bullseye  arm64        Rootless support for Docker.
ii  docker-compose-plugin             2.17.2-1~debian.11~bullseye    arm64        Docker Compose (V2) plugin for the Docker CLI.


$ docker compose version
Docker Compose version v2.12.2

$ git clone https://gitlab.com/koha-community/koha-testing-docker

$ export SYNC_REPO=/path/to/my/koha.git
$ export KTD_HOME=/path/to/my/ktd.git
$ export LOCAL_USER_ID=$(id -u)

# optional, defaults to 'master-bullseye'
$ export KOHA_IMAGE=master-bullseye

$ cd koha-testing-docker
$ cp ./env/defaults.env .env

# pull the latest image
$ ./bin/ktd down
$ ./bin/ktd pull

# start instance
$ ./bin/ktd up


# run a shell to access instance
$ ./bin/ktd --shell
kohadev-koha@kohadevbox:koha(master)$
