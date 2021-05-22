FROM alpine:3.7

LABEL maintainer="bicknrown <njbrown4@buffalo.edu>"

ENV FRP_VERSION "0.36.2"

COPY makeconfig.sh .
COPY start.sh .

RUN chmod +x makeconfig.sh
RUN chmod +x start.sh

# get frp from version number (linux amd64)
RUN cd /root \
    &&  wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    &&  tar zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz  \
    &&  cd frp_${FRP_VERSION}_linux_amd64/ \
    &&  cp frpc /usr/bin/ \
    &&  mkdir -p /etc/frp \
    &&  cd /root \
    &&  rm frp_${FRP_VERSION}_linux_amd64.tar.gz \
    &&  rm -rf frp_${FRP_VERSION}_linux_amd64/

ENV CONFIG_PATH "/etc/frp/"

# server or client selection

ENV SERVER_OR_CLIENT ""

# frps specific variables

ENV BIND_ADDR ""
ENV BIND_PORT ""

# frpc speficic variables

ENV SERVER_ADDR ""
ENV SERVER_PORT ""

# common variables

ENV AUTHENTICATE_HEARTBEATS ""
ENV AUTHENTICATION_METHOD ""
ENV TOKEN ""

# protocol selection

# true/false
ENV TCP ""
ENV TCP_RANGE ""
ENV UDP ""
ENV UDP_RANGE ""

# tcp speficic variables

ENV TCP_LOCAL_IP ""
ENV TCP_LOCAL_PORT ""
ENV TCP_REMOTE_PORT ""

# udp speficic variables

ENV UDP_LOCAL_IP ""
ENV UDP_LOCAL_PORT ""
ENV UDP_REMOTE_PORT ""

# start frp

ENTRYPOINT ["./start.sh"]
