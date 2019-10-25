export DISPLAY=192.168.99.1:0.0
#set-variable -name DISPLAY -value 192.168.99.1:0.0
docker run -ti --rm --name=firefox -e DISPLAY=$DISPLAY --privileged -v //c/Arbeitplatz/16_dockerplace/:/home/jehyunlee/workplace test:03firefox /bin/bash
docker run -ti --rm --name=firefox -e DISPLAY=$DISPLAY --privileged -v //c/Arbeitplatz/16_dockerplace/:/home/jehyunlee/workplace test:03firefox jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root
