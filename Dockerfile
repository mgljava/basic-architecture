FROM openjdk:8u171-jre-alpine3.7

ARG TIMEZONE=${TIMEZONE:-Asia/Shanghai}

RUN set -x \
  && echo "http://mirrors.ustc.edu.cn/alpine/v3.3/main/" > /etc/apk/repositories \
  && apk add --update curl bash tzdata \
  && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
  && echo ${TIMEZONE} > /etc/timezone \
  && apk del --no-cache tzdata \
  && apk del curl \
  && rm /var/cache/apk/*

COPY build/libs/basic-architecture-*.jar /opt/app.jar
COPY config/docker/startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

EXPOSE 8080
CMD /opt/startup.sh