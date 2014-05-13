FROM debian:stable
MAINTAINER Hideki Saito <hideki@hidekisaito.com>
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openssh-server
EXPOSE 8080
EXPOSE 22
RUN mkdir /syncthing
ADD syncthing/syncthing /syncthing/syncthing
ADD syncthing/README.md /syncthing/README.md
ADD syncthing/LICENSE /syncthing/LICENSE
RUN mkdir -p /var/run/sshd
RUN echo root:changeme | chpasswd
ADD files/startup.sh /startup.sh
ADD files/sshd-key-gen.sh /sshd-key-gen.sh
RUN chmod +x /startup.sh /sshd-key-gen.sh
ENTRYPOINT /startup.sh
