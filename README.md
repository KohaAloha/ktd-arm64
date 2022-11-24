# Koha docker images on ARM64

these images run on apple M1 systems and AWS graviton systems.

this is a fork of https://gitlab.com/koha-community/koha-testing-docker


run the following to start a koha instance on arm64...


```shell
$ uname -a
Linux ip-172-31-9-666 5.10.0-19-cloud-arm64 #1 SMP Debian 5.10.149-2 (2022-10-21) aarch64 GNU/Linux

$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 11 (bullseye)
Release:        11
Codename:       bullseye

$ dpkg -l | grep docker
ii  docker-ce                         5:20.10.21~3-0~debian-bullseye arm64        Docker: the open-source application container engine
ii  docker-ce-cli                     5:20.10.21~3-0~debian-bullseye arm64        Docker CLI: the open-source application container engine
ii  docker-ce-rootless-extras         5:20.10.21~3-0~debian-bullseye arm64        Rootless support for Docker.
ii  docker-compose-plugin             2.12.2~debian-bullseye         arm64        Docker Compose (V2) plugin for the Docker CLI.

$ docker compose version
Docker Compose version v2.12.2


$ export SYNC_REPO=/path/to/my/koha.git
$ export LOCAL_USER_ID=$(id -u)
$ export KOHA_IMAGE=master-bullseye

$ git clone https://gitlab.com/mjames/ktd-arm64
$ cd ktd-arm64

$ cp ./env/defaults.env .env

# pull the latest image
$ docker compose down
$ docker compose -p koha down
$ docker compose -f docker-compose.yml pull

# start instance
$ docker compose -f docker-compose.yml -p koha up --abort-on-container-exit --no-color --force-recreate

# run a shell to access instance
$ docker exec -it koha_koha_1 bash
```
