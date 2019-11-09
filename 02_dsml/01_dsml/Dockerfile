FROM jehyunlee/01_anaconda:02_jlabext
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
RUN apt-get update 

#>>>>> machine learning 
RUN conda install -y tensorflow=1.14* keras \
    && conda install -y pytorch torchvision cpuonly -c pytorch \
    && pip install xgboost \
    && pip install lightgbm 

#<<<<<< machine learning

#>>>>>> data analysis
RUN conda install -c conda-forge hyperspy \
    && conda install -c conda-forge selenium
#<<<<<< data analysis

# Install the latest version of Geckodriver:
RUN BASE_URL=https://github.com/mozilla/geckodriver/releases/download \
  && VERSION=$(curl -sL \
    https://api.github.com/repos/mozilla/geckodriver/releases/latest | \
    grep tag_name | cut -d '"' -f 4) \
  && curl -sL "$BASE_URL/$VERSION/geckodriver-$VERSION-linux64.tar.gz" | \
    tar -xz -C /usr/local/bin

# Working enviroment preparation
WORKDIR /workplace

# IPython
EXPOSE 8888
# Tensorboard
EXPOSE 6006

CMD /app/start.sh
