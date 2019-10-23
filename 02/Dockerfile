FROM ubuntu:16.04
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install --no-install-recommends -y \
curl grep sed dpkg wget bzip2 ca-certificates \
libglib2.0-0 libxext6 libsm6 libxrender1 \
git mercurial subversion \
libgtk2.0-0 

RUN useradd -ms /bin/bash jehyunlee
WORKDIR /home/jehyunlee/

RUN echo 'export PATH=/home/jehyunlee/anaconda3/bin:$PATH' > /home/jehyunlee/.bashrc \
&& ANACONDA_INSTALL_SCRIPT='Anaconda3-2019.10-Linux-x86_64.sh' \
&& wget --quiet https://repo.continuum.io/archive/$ANACONDA_INSTALL_SCRIPT -O ~/anaconda.sh \
&& /bin/bash ~/anaconda.sh -b -p /home/jehyunlee/anaconda3 \
&& rm ~/anaconda.sh \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*



