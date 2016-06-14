FROM ubuntu:15.04

RUN mkdir /node-tmp \
 && cd /node-tmp \
 && apt-get update \
 && apt-get install -y curl xz-utils \
 && curl -O 'https://nodejs.org/dist/v4.4.5/node-v4.4.5-linux-x64.tar.xz' \
 && tar xf node-v4.4.5-linux-x64.tar.xz \
 && mv node-v4.4.5-linux-x64 /opt/node \
 && rm -rf /node-tmp
ENV PATH /opt/node/bin:$PATH

RUN apt-get install -y netbase \
 && npm install -g elm \
 && elm make --yes

EXPOSE 8000

CMD /bin/bash