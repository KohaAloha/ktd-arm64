# Koha docker images on ARM64

these images run on apple M1 systems and AWS graviton systems.

this is a fork of https://gitlab.com/koha-community/koha-testing-docker


run the following to start a koha instance on arm64...


```shell
$ uname -a
Linux ip-172-31-9-666 5.10.0-19-cloud-arm64 #1 SMP Debian 5.10.149-2 (2022-10-21) aarch64 GNU/Linux

$ neofetch
       _,met$$$$$gg.          root@ip-172-31-X-XX
    ,g$$$$$$$$$$$$$$$P.       -------------------
  ,g$$P"     """Y$$.".        OS: Debian GNU/Linux 11 (bullseye) aarch64
 ,$$P'              `$$$.     Host: t4g.small
',$$P       ,ggs.     `$$b:   Kernel: 5.10.0-21-cloud-arm64
`d$$'     ,$P"'   .    $$$    Uptime: 40 days, 15 hours, 42 mins
 $$P      d$'     ,    $$P    Packages: 769 (dpkg)
 $$:      $$.   -    ,d$$'    Shell: bash 5.1.4
 $$;      Y$b._   _,d$P'      CPU: (2)
 Y$$.    `.`"Y$$$$P"'         Memory: 228MiB / 1868MiB
 `$$b      "-.__
  `Y$$
   `Y$$.
     `$$b.
       `Y$$b.
          `"Y$b._
              `"""

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
