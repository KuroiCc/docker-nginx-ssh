FROM nginx:1.25
LABEL org.opencontainers.image.authors="Igor Shishkin <me@teran.ru>, Kuroi_Cc"

EXPOSE 22 80

RUN apt-get update && \
  apt-get install -y --no-install-suggests --no-install-recommends \
  openssh-server \
  supervisor && \
  apt-get clean && \
  rm -rvf /var/lib/apt/lists/* && \
  rm -vf /etc/ssh/ssh_host_*

RUN useradd -s /bin/sh publisher -d /home/publisher -m && \
  mkdir -p /run/sshd /home/publisher/.ssh && \
  chown publisher:publisher /home/publisher/.ssh /usr/share/nginx/html

RUN sed -i '$ d' /docker-entrypoint.sh

ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
