export DISPLAY=192.168.99.1:0.0
#set-variable -name DISPLAY -value 192.168.99.1:0.0
docker run -ti --rm --name=firefox -e DISPLAY=$DISPLAY --privileged -v //c/Arbeitplatz/16_dockerplace/:/home/jehyunlee/workplace test:03firefox /bin/bash
