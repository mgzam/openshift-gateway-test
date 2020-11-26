FROM caapim/gateway:10.0.00_20201023

USER root

RUN yum install -y \
      socat \
	  stunnel \
      bind-utils \
	  tcpdump \
	  iputils \
      policycoreutils \
	  openssl && \
    yum clean all

RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/restman
RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/wsman
 
RUN chmod 640 /opt/SecureSpan/Gateway/runtime/lib/ext/*

RUN chmod 640 /opt/SecureSpan/Gateway/runtime/modules/lib/*

RUN chmod 750 /opt/docker/entrypoint.sh

USER ${ENTRYPOINT_UID}
