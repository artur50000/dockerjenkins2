FROM ubuntu:16.04
RUN apt-get update && apt-get -y install default-jdk && \
apt-get -y install git && apt-get -y install maven && \
apt-get -y install docker.io 
ADD files/Dockerfile /home/ubuntu/
