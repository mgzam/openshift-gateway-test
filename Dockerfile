FROM caapim/gateway:10.0.00_20201023

USER root

COPY root/etc/yum.repos.d/mariadb.repo /etc/yum.repos.d/

RUN sed -i "/^timeout.*/d" /etc/yum.conf

RUN rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB && \	
	yum install -y \	
	MariaDB-client \
        socat \
	stunnel \
      bind-utils \
	  tcpdump \
	  iputils \
      policycoreutils \
	  openssl && \
    yum clean all
    
USER ${ENTRYPOINT_UID}
