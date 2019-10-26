FROM jehyunlee/jehyun_jupyter
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

# RUN sed -i 's/kr.archive.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list

# Locale: Korean
RUN apt-get update & apt-get install -y \
    language-pack-ko \
    fonts-nanum \
    fonts-nanum-coding

RUN locale-gen ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# TimeZone
ENV TZ Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

