## Build toolbox image
1. Change to container folder
```sh
cd /opt/docker/landscapedatacommons/toolbox
```
2. Build image
```sh
docker build --no-cache -t landscapedatacommons/toolbox:2.6.1 .
```
## Push toolbox image to Docker Hub
1. Change to container folder
```sh
cd /opt/docker/landscapedatacommons/toolbox
```
2. Push image to Docker Hub
```sh
docker login
docker push landscapedatacommons/toolbox:2.6.1
```
## Deploy toolbox image (shinyproxy)
1. Change to container folder
```sh
cd /opt/docker/landscapedatacommons/toolbox
```
2. Create network
```sh
docker network create --driver=overlay --attachable shiny-net
```
4. Deploy stack
```sh
TOOLBOX_DOMAIN=toolbox.jornada-stack.nmsu.edu docker stack deploy -c toolbox.yml toolbox
```