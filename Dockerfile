FROM phusion/baseimage:0.9.11
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

# Mono 3.2 is in Debian/Experimental
#RUN echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list

# Configure nzbdrone's apt repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb http://update.nzbdrone.com/repos/apt/debian master main" >> /etc/apt/sources.list

RUN apt-get update -q
RUN apt-get install -qy libmono-cil-dev nzbdrone
#RUN apt-get install -qy nzbdrone

VOLUME /config
VOLUME /downloads
VOLUME /tv

EXPOSE 8989

# Add nzbdrone to runit
RUN mkdir /etc/service/nzbdrone
ADD nzbdrone.sh /etc/service/nzbdrone/run
RUN chmod +x /etc/service/nzbdrone/run
