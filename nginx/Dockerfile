FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install curl nginx

RUN curl -o /usr/bin/confd -L https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64

RUN chmod +x /usr/bin/confd

RUN mkdir -p /etc/confd/{conf.d,templates}
COPY nginx.toml /etc/confd/conf.d/nginx.toml
COPY nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl

COPY confd-watch /usr/local/bin/confd-watch
RUN chmod +x /usr/local/bin/confd-watch
RUN rm /etc/nginx/sites-enabled/default

ENV HOST_IP=${COREOS_PUBLIC_IPV4}
