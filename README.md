# Shinyproxy Toolbox
Containerized shinyproxy that serves Landscape Toolbox shiny apps written in R language
## Shiny apps
- Balanced Design Tool
- Benchmark Exploration Tool
## Installation
The following instructions describe how to install and deploy shinyproxy-toolbox and its tools

Note: Requires docker-ce and docker-compose be installed and traefik stack deployed in swarm
(see @ https://github.com/keramsey/traefik.git for traefik source code and README.md)

1. Install docker-ce on virtual server
2. Create the folder to store docker configurations
     mkdir /opt/docker
3. Change permissions on folder
     chown -R <username>:<username> /opt/drupal
     chmod 775 /opt/drupal

     Note: substitute <username> with sudo user account name
4. Change to the folder
     cd /opt/docker
5. Clone the repository from github
     git clone https://github.com/keramsey/shinyproxy-toolbox.git shinyproxy
6. Change to the shinyproxy folder
     cd /opt/docker/shinyproxy
7. Copy the following files and folders to the current directory
     .env

     Note: The file (s) are on the Systems CIFS share at the following location:
       Systems:\Docker\Restricted\shinyproxy-toolbox\

     Contact: Systems or website administrator
8. Create network for shinyproxy services
     docker network create --driver=overlay sp-net
9. Deploy shinyproxy stack services
     docker stack deploy -c<() shinyproxy
10. Verify stack was deployed
      docker stack ls
11. Verify stack services are all running
      docker service ls
12. Open website in browser using APP_DOMAIN url stored in .env file

## License
MIT
