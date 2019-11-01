FROM ubuntu:16.04
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    curl grep sed dpkg wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion \
    libgtk2.0-0 apt-utils ssh ftp

RUN apt-get update && \
    apt-get install --no-install-recommends -y firefox dbus-x11 vim

# Locale: Korean
RUN apt-get update && apt-get install --no-install-recommends -y \
    language-pack-ko \
    fonts-nanum \
    fonts-nanum-coding uim uim-byeoru

RUN locale-gen ko_KR.UTF-8
#ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

RUN echo 'export XIM=uim' > ~root/.bashrc \
    && echo 'export XMODIFIERS=@im=uim' >> ~root/.bashrc \
    && echo 'export GTK_IM_MODULE=uim' >> ~root/.bashrc \
    && echo 'export QT_IM_MODULE=uim' >> ~root/.bashrc \
    && echo 'if [ $SHLVL -eq 1 ]; then' >> ~root/.bashrc \
    && echo 'uim-xim &' >> ~root/.bashrc \ 
    && echo 'fi' >> ~root/.bashrc  

# TimeZone
ENV TZ Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone




