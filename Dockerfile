FROM ubuntu

RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN apt-get -y install git


RUN useradd -m ronald && echo "ronald:dev" | chpasswd && adduser ronald sudo
# RUN usermod -aG sudo ronald
USER ronald
WORKDIR /home/ronald
CMD /bin/bash








#RUN adduser --disabled-password --gecos '' ronald


## needed to compile native deps: gcc, g++, python
## need for better xargs (required for dibslint): findutils
## handy to have: bash, git
#RUN apk add --no-cache \
#    make \
#    gcc \
#    g++ \
#    python \
#    bash \
#    git \
#    findutils
#
#RUN mkdir -p /opt/app
#WORKDIR /opt/app
#
## some repos require a config file being copied here
#RUN mkdir -p /dibs/settings
#
## install npm@3
#RUN npm install -g npm@latest
#
## copy .npmrc to ensure private registry
#ONBUILD COPY package.json .npmrc /opt/app/
#
## install deps
#ONBUILD RUN npm install && npm cache clean
#
## copy source
#ONBUILD COPY . /opt/app
#
## start the app -- override if your project doesn't use `nmp start`
#CMD ["npm", "start"]
