# docker
Docker Files and Images, under self-training.

01. [jehyunlee/00base](https://github.com/jehyunlee/docker/blob/master/00_base)  
    * :latest
      * [ubuntu] `ubuntu 16.04`
      * [browser] `firefox`, `dbus-x11` 
      * [language] `fonts-nanum` `vim` `uim` `uim-byeoru`
      * [locale] `ko_KR.UTF-8`
02. [jehyunlee/01anaconda](https://github.com/jehyunlee/docker/blob/master/01_anaconda)  
    * :jlab
      * [DEV] `anaconda3`, `nodejs`
      * [ENV] `alias`
    * :jlab_ext
      * [ENV] `jupyter lab` extensions
        - `ipywidget`, `github`, `latex`, `drawio`, `go_to_definition`, `code_formatter`, `toc`, `google-drive`, `git`
03. [jehyunlee/01anaconda](https://github.com/jehyunlee/docker/blob/master/01_anaconda)  
    * :basic
      * [DEV] `tensorflow`, `keras`, `pytorch`, `hyperspy`, `selenium`, `geckodriver`
    * :basic_geo
      * [DEV] `shapely`, `geopandas`, `descartes`, `folium`
      * [ENV] `jupyter lab` extensions
        - `geojson`, `mathjax3`
        
