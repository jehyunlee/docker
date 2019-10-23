FROM ubuntu:16.04
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

RUN apt-get update

RUN useradd -ms /bin/bash jehyunlee
USER jehyunlee
WORKDIR /home/jehyunlee

RUN mkdir -p /home/jehyunlee/workplace
VOLUME [ "/home/jehyunlee/", "home/jehyunlee/workplace" ]

