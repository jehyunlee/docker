# `docker` 

## 1. Docker on Windows 10 home
* [personal history of struggling](https://github.com/jehyunlee/docker/blob/master/Win10Home/text.md)

## 2. Docker run script
01. Run by `docker run` command  
    * options: [[Link](https://github.com/jehyunlee/docker/blob/master/Win10Home/text.md#step-4-%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88-%EC%83%9D%EC%84%B1--%EC%8B%A4%ED%96%89)]
    ```bash
    docker run -it --name=geo -e DISPLAY=$DISPLAY -v //c/Arbeitplatz/:/workplace -p 8888:8888 --shm-size 4g jehyunlee/02_dsml:02_geocoding
    ```  
02. Run by `script`  
    * script download [[Link](https://github.com/jehyunlee/docker/blob/master/scripts/run)]
    ```bash
    $ run
    ```
    
## 3. Dockerfiles
01. [jehyunlee/00_base](https://github.com/jehyunlee/docker/blob/master/00_base)  
    * [:kr](https://github.com/jehyunlee/docker/blob/master/00_base/kr/Dockerfile)
      * [ubuntu] `ubuntu 16.04`
      * [browser] `firefox`, `dbus-x11` 
      * [language] `fonts-nanum` `vim` `uim` `uim-byeoru`
      * [locale] `ko_KR.UTF-8`
02. [jehyunlee/01_anaconda](https://github.com/jehyunlee/docker/blob/master/01_anaconda)  
    * [:01_jlab](https://github.com/jehyunlee/docker/blob/master/01_anaconda/01_jlab/Dockerfile)
      * [DEV] `anaconda3`, `nodejs`, `pydot`, `graphviz`
      * [ENV] `alias`, `jupyter-notebook-config`, `PYTHONPATH`
    * [:02_jlabext](https://github.com/jehyunlee/docker/blob/master/01_anaconda/02_jlabext/Dockerfile)
      * [ENV] `jupyter lab` extensions
        - [`ipywidget`](https://ipywidgets.readthedocs.io/en/latest/), [`github`](https://github.com/jupyterlab/jupyterlab-github), [`latex`](https://github.com/jupyterlab/jupyterlab-latex), [`drawio`](https://github.com/QuantStack/jupyterlab-drawio), [`go_to_definition`](https://github.com/krassowski/jupyterlab-go-to-definition), [`code_formatter`](https://github.com/ryantam626/jupyterlab_code_formatter), [`toc`](https://github.com/jupyterlab/jupyterlab-toc), [`google-drive`](https://github.com/jupyterlab/jupyterlab-google-drive), [`git`](https://github.com/jupyterlab/jupyterlab-git), [`mathjax3`](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference), [`graphviz`](https://github.com/deathbeds/jupyterlab_graphviz)
03. [jehyunlee/02_dsml](https://github.com/jehyunlee/docker/blob/master/02_dsml)  
    * [:01_dsml](https://github.com/jehyunlee/docker/blob/master/02_dsml/01_dsml/Dockerfile)
      * [DEV] `tensorflow 1.14`, `keras 2.2.4`, `pytorch 1.3.0`, `lightgbm 2.3.0`, `xgboost 0.90`, `hyperspy`, `selenium`, `geckodriver`
    * [:02_geocoding](https://github.com/jehyunlee/docker/blob/master/02_dsml/02_geocoding/Dockerfile)
      * [DEV] [`shapely`](https://shapely.readthedocs.io/en/stable/manual.html), [`geopandas`](https://datascienceschool.net/view-notebook/ef921dc25e01437b9b5c532ba3b89b02/), [`descartes`](https://pypi.org/project/descartes/), [`folium`](https://github.com/python-visualization/folium) 
      * [ENV] `jupyter lab` extensions
        - [`geojson`](https://www.npmjs.com/package/@jupyterlab/geojson-extension)
        
