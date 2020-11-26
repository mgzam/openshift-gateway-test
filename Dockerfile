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
    
USER ${ENTRYPOINT_UID}
