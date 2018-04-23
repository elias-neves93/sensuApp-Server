FROM ubuntu
MAINTAINER Elias Neves <elias-neves93@hotmail.com>
WORKDIR /etc/sensu

RUN apt-get update && apt-get install -y wget && wget http://sensu.global.ssl.fastly.net/apt/pool/trusty/main/s/sensu/sensu_1.3.3-1_amd64.deb && dpkg -i sensu*  && apt-get clean

ADD . /etc/sensu
LABEL Description="Sensu App Monitoring - Ubuntu - v0.1"
EXPOSE 3000

CMD echo "Finish!"
