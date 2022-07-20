# Shinyproxy Toolbox
Containerized shinyproxy serving R shiny apps containers
## Features
- CI/CD workflow builds/pushes image to Docker Hub upon pull request
- Deploys shinyproxy with shiny apps (under construction)
## Shiny apps
- Balanced Design Tool
- Benchmark Exploration Tool
## Installation notes
Requires the following on host:
- ubuntu 20.04 or other Linux distro
- docker-ce
- docker-compose
- swarm manager node
- traefik stack deployed
## Deploy shinyproxy-toolbox
1. Install docker-ce on virtual server
2. Create the folder to store docker configurations
```sh
mkdir /opt/docker
```
3. Change permissions on folder
```sh
chown -R user:user /opt/drupal
chmod 775 /opt/drupal
```
&nbsp;&nbsp;&nbsp;&nbsp;Note: user member of sudo and docker groups

4. Change to the folder
```sh
cd /opt/docker
```
5. Clone the repository from github
```sh
git clone https://github.com/keramsey/shinyproxy-toolbox.git shinyproxy
```
6. Change to the shinyproxy folder
```sh
cd /opt/docker/shinyproxy
```
7. Copy the .env file to the current directory from Systems share (\Docker\Restricted\shinyproxy-toolbox). Contact the systems or website administrator to access .env file.

8. Create network for shinyproxy services
```sh
docker network create --driver=overlay sp-net
```
9. Deploy shinyproxy stack services
```sh
docker stack deploy -c<(docker-compose -f docker-compose.yml config) shinyproxy
```
10. Verify stack was deployed
```sh
docker stack ls
```
11. Verify stack services are all running
```sh
docker service ls
```
12. Open website in browser using APP_DOMAIN url stored in .env file
## SSL/HTTPS
Traefik stack is used as web proxy (ports 80,443) for the shinyproxy loadbalancer on port 8080

**Note**: See repository for source code and documentation @ https://github.com/keramsey/traefik.git
## License
MIT
