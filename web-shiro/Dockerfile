FROM openjdk:8-slim-bullseye

RUN sed -i 's@//.*deb.debian.org@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@//.*security.debian.org@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y python3 net-tools curl wget

RUN mkdir /app

COPY ./src/shirodemo-1.0-SNAPSHOT.jar /app

CMD [ "java","-jar","/app/shirodemo-1.0-SNAPSHOT.jar" ]