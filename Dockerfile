FROM ubuntu:18.04

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends amule amule-daemon amule-utils && \
    apt-get install -y --no-install-recommends aria2
