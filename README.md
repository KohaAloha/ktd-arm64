# Koha docker images on ARM64

these images run on apple M1 systems and AWS graviton systems.

this is a fork of https://gitlab.com/koha-community/koha-testing-docker


run the following to start a koha instance on arm64...


```shell
export SYNC_REPO=/path/to/my/koha.git
export LOCAL_USER_ID=$(id -u)
export KOHA_IMAGE=master-bullseye

git clone https://gitlab.com/mjames/ktd-arm64
cd ktd-arm64

cp ./env/defaults.env .env

# Pull the latest image
docker-compose down
docker-compose -p koha down
docker-compose -f docker-compose.yml pull

# start instance
docker-compose -f docker-compose.yml -p koha up --abort-on-container-exit --no-color --force-recreate

# run a shell to access instance
docker exec -it koha_koha_1 bash
```
