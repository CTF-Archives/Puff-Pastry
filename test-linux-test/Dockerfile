FROM ubuntu:22.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && \
    sed -i "s/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g" /etc/apt/sources.list

RUN apt-get update && \ 
    apt-get -y install openssh-server net-tools curl

CMD [ "tail","-f","/dev/null" ]