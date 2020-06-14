FROM jehyunlee/00_base:kr
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN apt-get update 

# Anaconda install
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
&& ANACONDA_INSTALL_SCRIPT='Anaconda3-2020.02-Linux-x86_64.sh' \
&& wget --quiet https://repo.continuum.io/archive/$ANACONDA_INSTALL_SCRIPT -O ~/anaconda.sh \
&& /bin/bash ~/anaconda.sh -b -p /opt/conda \
&& rm ~/anaconda.sh \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' >> ~root/.bashrc \
    && echo 'export PATH=/app/:$PATH' >> ~root/.bashrc 
ENV PATH="/opt/conda/bin:${PATH}"
RUN conda install -y nodejs -c conda-forge \
    && conda install -y pydot graphviz

RUN set -ex ;\
    jupyter notebook --generate-config --allow-root ;\
    sed -i -e "s/#c.NotebookApp.ip .*/c.NotebookApp.ip = '0.0.0.0'/g"  /root/.jupyter/jupyter_notebook_config.py ;\
    sed -i -e "s/#c.NotebookApp.port .*/c.NotebookApp.port = 8888/g"  /root/.jupyter/jupyter_notebook_config.py ;\
    sed -i -e "s/#c.NotebookApp.allow_root .*/c.NotebookApp.allow_root = True/g"  /root/.jupyter/jupyter_notebook_config.py ;\
    sed -i -e "s/#c.NotebookApp.token .*/c.NotebookApp.token = ''/g"  /root/.jupyter/jupyter_notebook_config.py

# Working enviroment preparation
RUN mkdir -p /app \
    && echo "bash -c 'source ~root/.bashrc'" > /app/start.sh \
    && echo "/bin/bash" > /app/start.sh \
    && chmod +x /app/start.sh \
    && mkdir -p /app/python

RUN echo "alias jlab='jupyter lab --no-browser '" >> ~root/.bashrc \
    && echo "alias untar='tar -zxvf '" >> ~root/.bashrc \
    && echo "alias wget='wget -c '" >> ~root/.bashrc \
    && echo "alias c='clear'" >> ~root/.bashrc \
    && echo "alias ls='ls --color=auto' " >> ~root/.bashrc \
    && echo "alias ll='ls -la'" >> ~root/.bashrc \
    && echo "alias l.='ls -d .* --color=auto'" >> ~root/.bashrc \
    && echo "alias grep='grep --color=auto'" >> ~root/.bashrc \
    && echo 'PYTHONPATH="/app/python:${PYTHONPATH}"' >> ~root/.bashrc \
    && mkdir /workplace \
    && apt-get update \
    && apt-get install -y python-pydot python-pydot-ng graphviz
    
WORKDIR /workplace
EXPOSE 8888
EXPOSE 6006
CMD /app/start.sh
