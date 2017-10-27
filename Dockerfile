FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g create-react-app
RUN mkdir /.npm /.config
RUN chmod 777 /.npm /.config
RUN apt-get install -y make
RUN apt-get install -y ruby-full
RUN apt-get install -y gcc
RUN gem install MuranoCLI
RUN mkdir /.murano
RUN chmod 777 /.murano
RUN npm install -g yo
COPY ./usr/local/bin/new /usr/local/bin/new 
# RUN npm install -g generator-generator

# RUN apt-get clean
