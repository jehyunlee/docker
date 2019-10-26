FROM jehyunlee/jehyun_jupyter
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list

RUN chown -R jehyunlee.jehyunlee anaconda3
RUN chown -R jehyunlee.jehyunlee workplace

# nodejs
RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs npm

# jupyter lab extension
USER jehyunlee
WORKDIR /home/jehyunlee/
ENV PATH="/home/jehyunlee/anaconda3/bin:${PATH}"

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

# jupyter lab execute


EXPOSE 8888
CMD jupyter lab --ip=0.0.0.0 --port=8888 --allow-root

