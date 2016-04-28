FROM ubuntu:14.04
MAINTAINER Owen Ouyang <owen.ouyang@live.com>

ENV SHELL=/bin/bash

RUN apt-get install -y software-properties-common
RUN add-apt-repository "deb http://archive.canonical.com/ trusty partner"
RUN add-apt-repository ppa:webupd8team/java
RUN dpkg --add-architecture i386
RUN apt-get update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
RUN apt-get install -y oracle-java8-installer firefox ttf-wqy-microhei wget pcscd libccid pcsc-tools
RUN update-java-alternatives -s java-8-oracle
RUN update-java-alternatives -s java-8-oracle

RUN mkdir -p $HOME/.mozilla/plugins $HOME/Downloads
RUN ln -s /usr/lib/jvm/jre*/lib/i386/libnpjp2.so $HOME/.mozilla/plugins/
RUN wget https://pfiles.tax.nat.gov.tw/ibxpdf/include/npHiPKIClient-linux.xpi $HOME/Downloads/linux.xpi