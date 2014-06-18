FROM ubuntu:14.04
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb http://update.nzbdrone.com/repos/apt/debian master main" >> /etc/apt/sources.list

RUN apt-get -q update
RUN apt-get install -qy nzbdrone

VOLUME /config
VOLUME /data

EXPOSE 8989

ENTRYPOINT ["mono", "/usr/bin/nzbdrone"]
