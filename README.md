# `docker` 

## 1. Docker on Windows 10 home
* [personal history of struggling](https://github.com/jehyunlee/docker/blob/master/Win10Home/text.md)

## 2. Docker run script
```bash
docker run -it --name=geo -e DISPLAY=$DISPLAY -v //c/Arbeitplatz/:/workplace -p 8888:8888 --shm-size 2g jehyunlee/02dsml:basic_geo
```

## 3. Dockerfiles
01. [jehyunlee/00base](https://github.com/jehyunlee/docker/blob/master/00_base)  
    * [:latest](https://github.com/jehyunlee/docker/blob/master/00_base/Dockerfile)
      * [ubuntu] `ubuntu 16.04`
      * [browser] `firefox`, `dbus-x11` 
      * [language] `fonts-nanum` `vim` `uim` `uim-byeoru`
      * [locale] `ko_KR.UTF-8`
02. [jehyunlee/01anaconda](https://github.com/jehyunlee/docker/blob/master/01_anaconda)  
    * [:jlab](https://github.com/jehyunlee/docker/blob/master/01_anaconda/jlab/Dockerfile)
      * [DEV] `anaconda3`, `nodejs`
      * [ENV] `alias`
    * [:jlab_ext](https://github.com/jehyunlee/docker/blob/master/01_anaconda/jlab_ext/Dockerfile)
      * [ENV] `jupyter lab` extensions
        - `ipywidget`, `github`, `latex`, `drawio`, `go_to_definition`, `code_formatter`, `toc`, `google-drive`, `git`
03. [jehyunlee/02dsml](https://github.com/jehyunlee/docker/blob/master/02_dsml)  
    * [:basic](https://github.com/jehyunlee/docker/blob/master/02_dsml/basic/Dockerfile)
      * [DEV] `tensorflow`, `keras`, `pytorch`, `hyperspy`, `selenium`, `geckodriver`
    * [:basic_geo](https://github.com/jehyunlee/docker/blob/master/02_dsml/basic_geo/Dockerfile)
      * [DEV] `shapely`, `geopandas`, `descartes`, `folium`
      * [ENV] `jupyter lab` extensions
        - `geojson`, `mathjax3`
        
