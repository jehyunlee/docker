FROM jehyunlee/02dsml:basic
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
# RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update 

#>>>>> geocoding
RUN conda install -y -c conda-forge shapely
RUN conda install -y -c conda-forge geopandas
RUN conda install -y -c conda-forge descartes
RUN conda install -y -c conda-forge folium
RUN jupyter labextension install @jupyterlab/geojson-extension
RUN jupyter labextension install @jupyterlab/mathjax3-extension
#<<<<<< geocoding

# Working enviroment preparation
WORKDIR /workplace
EXPOSE 8888
CMD /app/start.sh
