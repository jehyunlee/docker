FROM jehyunlee/01anaconda:jlab
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
# RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update 

#>>>>> jupyter lab extensions
RUN conda install -c conda-forge ipywidgets
RUN jupyter labextension install @jupyterlab/github
RUN jupyter labextension install @jupyterlab/latex
RUN jupyter labextension install jupyterlab-drawio
RUN jupyter labextension install @krassowski/jupyterlab_go_to_definition

RUN conda install -c conda-forge black
RUN jupyter labextension install @ryantam626/jupyterlab_code_formatter
RUN conda install -c conda-forge jupyterlab_code_formatter
RUN jupyter serverextension enable --py jupyterlab_code_formatter

RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @jupyterlab/google-drive


RUN pip install --upgrade jupyterlab-git
RUN jupyter lab build
#<<<<<< jupyter lab extensions

# Working enviroment preparation
WORKDIR /workplace
EXPOSE 8888
CMD /app/start.sh
