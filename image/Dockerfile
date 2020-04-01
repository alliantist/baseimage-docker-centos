FROM centos:7
MAINTAINER Roy Crombleholme <roy.crombleholme@pam-it.com>
#RUN sed -i '/override_install_langs=en_US.utf8/d' /etc/yum.conf
RUN sed -i 's/override_install_langs=en_US.utf8/override_install_langs=en_AG,en_AG.utf8,en_AU,en_AU.iso88591,en_AU.utf8,en_BW,en_BW.iso88591,en_BW.utf8,en_CA,en_CA.iso88591,en_CA.utf8,en_DK,en_DK.iso88591,en_DK.utf8,en_GB,en_GB.iso88591,en_GB.iso885915,en_GB.utf8,en_HK,en_HK.iso88591,en_HK.utf8,en_IE,en_IE.iso88591,en_IE.iso885915@euro,en_IE.utf8,en_IE@euro,en_IN,en_IN.utf8,en_NG,en_NG.utf8,en_NZ,en_NZ.iso88591,en_NZ.utf8,en_PH,en_PH.iso88591,en_PH.utf8,en_SG,en_SG.iso88591,en_SG.utf8,en_US,en_US.iso88591,en_US.iso885915,en_US.utf8,en_ZA,en_ZA.iso88591,en_ZA.utf8,en_ZM,en_ZM.utf8,en_ZW,en_ZW.iso88591,en_ZW.utf8/' /etc/yum.conf

COPY . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/utilities.sh && \
	/bd_build/cleanup.sh

ENV LANG="en_GB.UTF-8" \
    LANGUAGE="en_GB:en" \
    LC_ALL="en_GB.UTF-8"

RUN yum update -y && yum upgrade -y

CMD ["/sbin/my_init"]
