FROM centos:7
MAINTAINER Roy Crombleholme <roy.crombleholme@pam-it.com>

COPY . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/utilities.sh && \
	/bd_build/cleanup.sh

ENV LANG="en_GB.UTF-8" \
    LANGUAGE="en_GB:en" \
    LC_ALL="en_GB.UTF-8"

CMD ["/sbin/my_init"]
