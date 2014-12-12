FROM debian:wheezy
MAINTAINER David Gageot <david@gageot.net>

RUN apt-get update && apt-get install -y \
	logrotate \
	python \
	wget

RUN (wget -q -O - http://www.aerospike.com/artifacts/aerospike-server-community/3.3.26/aerospike-server-community-3.3.26-debian7.tgz | tar xzf - -C /) \
	&& cd /aerospike-server-community-3.3.26-debian7 \
	&& ./asinstall \
	&& rm -Rf /aerospike-server-community-3.3.26-debian7

VOLUME ["/opt/aerospike/data"]
EXPOSE 3000 3001 3002 3003
ENTRYPOINT ["/usr/bin/asd", "--foreground"]

#ADD aerospike.conf /etc/aerospike/aerospike.conf
