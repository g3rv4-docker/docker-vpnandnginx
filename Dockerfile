FROM ubuntu:14.04
MAINTAINER Gervasio Marchand <gmc@gmc.uy>
ENV build_date 2016-07-03

RUN apt-get update && \
    apt-get install -y supervisor software-properties-common openvpn && \
    apt-get install -y --reinstall ca-certificates && \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/nginx/sites-enabled", "/var/log/nginx", "/usr/vpn"]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 1194/udp
CMD ["/usr/bin/supervisord"]
