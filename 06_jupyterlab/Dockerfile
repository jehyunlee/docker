FROM ubuntu:16.04
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list

RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install --no-install-recommends -y \
curl grep sed dpkg wget bzip2 ca-certificates \
libglib2.0-0 libxext6 libsm6 libxrender1 \
git mercurial subversion \
libgtk2.0-0 

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
&& ANACONDA_INSTALL_SCRIPT='Anaconda3-2019.10-Linux-x86_64.sh' \
&& wget --quiet https://repo.continuum.io/archive/$ANACONDA_INSTALL_SCRIPT -O ~/anaconda.sh \
&& /bin/bash ~/anaconda.sh -b -p /home/jehyunlee/anaconda3 \
&& rm ~/anaconda.sh \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install sudo
RUN adduser jehyunlee sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get install -y firefox fonts-nanum* dbus-x11 vim

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

RUN conda install -y nodejs -c conda-forge
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install @jupyterlab/github \
    && jupyter labextension install @jupyterlab/google-drive \
    && jupyter labextension install jupyterlab-favorites \
    && jupyter labextension install jupyterlab-recents \
    && jupyter labextension install @lckr/jupyterlab_variableinspector \
    && jupyter labextension install jupyterlab-drawio \
    && jupyter labextension install @jupyterlab/git

RUN pip install jupyter_contrib_nbextensions && jupyter contrib nbextension install
RUN pip install autopep8
RUN jupyter labextension install @lckr/jupyterlab_variableinspector
RUN jupyter lab build

# user
# RUN useradd -ms /bin/bash jehyunlee
# WORKDIR /home/jehyunlee/

# RUN mkdir /home/jehyunlee/workplace
# RUN cp /home/jehyunlee/.bashrc /home/jehyunlee/workplace/

# jupyter lab execute
EXPOSE 8888
CMD jupyter lab --ip=0.0.0.0 --port=8888 --allow-root



