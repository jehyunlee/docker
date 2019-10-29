FROM jehyunlee/01anaconda:jlab_ext
MAINTAINER Jehyun Lee <jehyun.lee@gmail.com>

USER root
# RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update 

#>>>>> machine learning 
RUN conda install -y tensorflow=1.14*
RUN conda install -y keras
RUN conda install pytorch torchvision cpuonly -c pytorch
#<<<<<< machine learning

#>>>>>> data analysis
RUN conda install hyperspy -c conda-forge
RUN conda install -c conda-forge selenium
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
EXPOSE 8888
CMD /app/start.sh
