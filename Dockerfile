FROM ubuntu:18.04

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends supervisor && \
    mkdir -p /var/log/supervisord

RUN apt-get install -y --no-install-recommends amule amule-daemon amule-utils && \
    apt-get install -y --no-install-recommends aria2

EXPOSE 4711

ARG EC_PASSWORD=Down10adEveryth!ng
ARG ADMIN_PASSWORD=all-platform-Mule

RUN amuled; sed -i 's/AcceptExternalConnections=0/AcceptExternalConnections=1/' ~/.aMule/amule.conf && \
    echo -n ${EC_PASSWORD} | md5sum | cut -d ' ' -f 1 | xargs -I {} sed -i "s/ECPassword=/ECPassword={}/" ~/.aMule/amule.conf && \
    amuleweb --write-config --password=${EC_PASSWORD} --admin-pass=${ADMIN_PASSWORD}

ADD supervisord.conf /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord"]
