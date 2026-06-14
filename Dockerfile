FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    vim \
    nano \
    net-tools \
    procps \
    tar \
    gzip \
    && apt-get clean

RUN mkdir -p /app/fitness/treinos \
    /app/fitness/usuarios \
    /app/fitness/programas \
    /app/fitness/logs \
    /app/fitness/backups

COPY scripts/ /app/scripts/
COPY source/ /app/source/

RUN chmod +x /app/scripts/*.sh

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
