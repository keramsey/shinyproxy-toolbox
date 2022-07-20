# Shinyproxy Toolbox
Containerized shinyproxy that serves Landscape Toolbox shiny apps written in R language
## Shiny apps
- Balanced Design Tool
- Benchmark Exploration Tool
## Installation
Note: Requires the following be installed on host:
          ubuntu 20.04 or other Linux distro
          docker-ce
          docker-compose
          swarm manager node
          traefik stack deployed

The following instructions describe how to install and deploy shinyproxy-toolbox and its tools:
1. Install docker-ce on virtual server
2. Create the folder to store docker configurations
```sh
mkdir /opt/docker
```
3. Change permissions on folder
```sh
chown -R <username>:<username> /opt/drupal
chmod 775 /opt/drupal
```
Note: Substitute <username> with sudo enabled user account name
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
7. Copy the following files and folders to the current directory
     .env

     Note: The file (s) are on the Systems CIFS share at the following location:
       Systems:\Docker\Restricted\shinyproxy-toolbox\

     Contact: Systems or website administrator
8. Create network for shinyproxy services
```sh
docker network create --driver=overlay sp-net
```
9. Deploy shinyproxy stack services
```sh
docker stack deploy -c<() shinyproxy
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
Traefik stack is used as proxy for shinyproxy loadbalancer on port 8080

Note: See traefik repository for source code and documentation at https://github.com/keramsey/traefik.git

## License
MIT
