#!/bin/bash

docker run -d --name=nginx-proxy-manager \
  -p 80:80 -p 443:443 -p 81:81 \
  -v /root/nginx-proxy-manager/data:/data \
  -v /root/nginx-proxy-manager/letsencrypt:/etc/letsencrypt \
  jc21/nginx-proxy-manager