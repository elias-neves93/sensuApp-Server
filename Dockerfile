FROM ubuntu
MAINTAINER Elias Neves <elias-neves93@hotmail.com>
WORKIR /conf.d
ADD .

RUN apt-get update && apt-get install wget && wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add - && CODENAME=`. /etc/os-release && echo $VERSION` && echo "deb https://sensu.global.ssl.fastly.net/apt $CODENAME main" | tee /etc/apt/sources.list.d/sensu.list && apt-get update && apt-get install sensu  && apt-get clean

LABEL Description="Sensu App Monitoring - Ubuntu - v0.1"
EXPOSE 3000

CMD echo "Finish!"
