FROM alpine:3.6

MAINTAINER soymilk9521 <soymilk9521@gmail.com>

ARG version=1.14.69

RUN apk -v --update add jq  python  py-pip  ca-certificates  \
    && pip install awscli==${version} \
    && apk -v --purge del py-pip \ 
    &&  rm -rf /var/cache/apk/* 

ADD aws-s3-deploy.sh /bin

CMD ["/bin/sh"]