FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix timezone
RUN ln -sf /usr/share/zoneinfo/CST6CDT /etc/localtime

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody

# Mono 3.2 is in Debian/Experimental
RUN echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list

# Configure nzbdrone's apt repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb http://update.nzbdrone.com/repos/apt/debian master main" >> /etc/apt/sources.list

RUN apt-get update -q
RUN apt-get install -qy libmono-cil-dev -t experimental
RUN apt-get install -qy nzbdrone

VOLUME /config
VOLUME /downloads
VOLUME /tv

EXPOSE 8989

# Do not run daemons as root
USER nobody
ENTRYPOINT ["mono", "/opt/NzbDrone/NzbDrone.exe", "-nobrowswer", "-data=/config"]
