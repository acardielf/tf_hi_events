#!/bin/bash

cd /root/hi.events/docker/all-in-one

docker compose up -d

echo "Finished at $(date -R)!"