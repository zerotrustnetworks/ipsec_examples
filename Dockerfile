FROM ubuntu:trusty

RUN apt-get update && \
  apt-get install -y strongswan
