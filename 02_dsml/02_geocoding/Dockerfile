FROM jehyunlee/02_dsml:01_dsml
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root

RUN python -m pip install pip --upgrade

#>>>>> geocoding
RUN pip install geopandas==0.5.1 \
    && pip install descartes \
    && pip install folium \
    && apt-get install -y libproj-dev proj-data proj-bin libgeos-dev \
    && pip install cython \
    && conda install -y --channel conda-forge cartopy \
    && pip install contextily \
    && jupyter labextension install @jupyterlab/geojson-extension \
    && jupyter labextension install @jupyterlab/mathjax3-extension
#<<<<<< geocoding

# Working enviroment preparation
WORKDIR /workplace
EXPOSE 8888
CMD /app/start.sh
