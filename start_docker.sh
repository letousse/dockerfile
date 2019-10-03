#!/bin/bash


sudo docker stop $(docker ps -a -q)
sudo docker rm $(docker ps -a -q)
sudo docker system prune -a 

sudo docker build -t yupi_v1 .

xhost +local:docker

sudo docker run -ti --rm        -e DISPLAY=$DISPLAY        -v /tmp/.X11-unix:/tmp/.X11-unix  -v  /home:/new     yupi_v1

