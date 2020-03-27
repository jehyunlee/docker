FROM jehyunlee/01_anaconda:02_jlabext
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN apt-get update 

#>>>>> machine learning 
RUN conda install -y tensorflow \
    && conda install -y pytorch torchvision cpuonly -c pytorch \
    && pip install -U imbalanced-learn \
     && pip install smote_variants imbalanced_databases \
    && pip install xgboost lightgbm 
#<<<<<< machine learning

#>>>>>> data analysis
RUN conda install -c conda-forge hyperspy \
    && conda install -c conda-forge selenium \
    && pip install matplotlib==3.1.3 plotly==4.5.4 plotly-geo==1.0.0 \
    && pip install modin[all] \
    && pip install fastapi uvicorn gunicorn \
    && pip install fastprogress \
    && pip install optuna \
    && apt-get install mc
#<<<<<< data analysis

# Install the latest version of Geckodriver:
RUN BASE_URL=https://github.com/mozilla/geckodriver/releases/download \
  && VERSION=$(curl -sL \
    https://api.github.com/repos/mozilla/geckodriver/releases/latest | \
    grep tag_name | cut -d '"' -f 4) \
  && curl -sL "$BASE_URL/$VERSION/geckodriver-$VERSION-linux64.tar.gz" | \
    tar -xz -C /usr/local/bin

# set error message in English
RUN sed -i -e "s/LANG=\"ko_KR.UTF-8\" .*/LANG=\"en_US.UTF-8\"/g"  /etc/default/locale ;\

# Working enviroment preparation
WORKDIR /workplace

# IPython
EXPOSE 8888
# Tensorboard
EXPOSE 6006

CMD ["/app/start.sh"]
CMD ["jupyter", "lab", "--no-browser"]
