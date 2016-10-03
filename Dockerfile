FROM ubuntu

RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get -y install curl 
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get -y install nodejs
RUN apt-get -y install git
RUN apt-get -y install vim 

COPY . src/
RUN chmod 755 src/git-setup.sh

RUN useradd -m ronald && echo "ronald:dev" | chpasswd && adduser ronald sudo
USER ronald
WORKDIR /home/ronald
RUN mkdir ./projects
RUN ln -s /src/git-setup.sh 
CMD /bin/bash
