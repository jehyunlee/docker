FROM jehyunlee/01_anaconda:01_jlab
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN apt-get update 

#>>>>> jupyter lab extensions
RUN conda install -c conda-forge ipywidgets
RUN jupyter labextension install @jupyterlab/github \
    && jupyter labextension install @jupyterlab/latex \
    && jupyter labextension install jupyterlab-drawio \
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition \
    && conda install -c conda-forge black \
    && jupyter labextension install @ryantam626/jupyterlab_code_formatter \
    && conda install -c conda-forge jupyterlab_code_formatter \
    && jupyter serverextension enable --py jupyterlab_code_formatter \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install @jupyterlab/google-drive \
    && jupyter labextension install @jupyterlab/mathjax3-extension \
    && jupyter labextension install @jupyterlab/git \
    && pip install --upgrade jupyterlab-git \
    && jupyter lab build
#<<<<<< jupyter lab extensions

# Working enviroment preparation
WORKDIR /workplace
EXPOSE 8888
CMD /app/start.sh
