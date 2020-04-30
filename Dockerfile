FROM ubuntu:16.04
USER root
RUN apt-get update && apt-get -y install default-jdk && \
apt-get -y install git && apt-get -y install maven && \
apt-get -y install docker.io && apt-get -y install sudo
RUN sudo adduser -u 111 jenkins &&  sudo usermod -aG docker jenkins
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
ADD files/Dockerfile /home/ubuntu/
