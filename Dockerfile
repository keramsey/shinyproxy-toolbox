FROM landscapedatacommons/shinyproxy:2.6.1
# configure shinyproxy applications
COPY application.yml /opt/shinyproxy/application.yml