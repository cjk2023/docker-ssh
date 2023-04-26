FROM ubuntu:focal

USER root

COPY install_docker.sh ./install_docker.sh 
RUN chmod +x /install_docker.sh 
RUN /install_docker.sh 

RUN setfacl -Rm d:g:docker:rwx,g:docker:rwx /var/run/ 

RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"] 
