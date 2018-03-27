FROM python:3.6.4-alpine

ENV CURATOR_VERSION 5.5.2

RUN apk --update add python py-pip bash
RUN pip install --upgrade elasticsearch-curator==$CURATOR_VERSION

ADD docker-entrypoint.sh /
ADD tasks/optimize-indices.sh /etc/periodic/
ADD tasks/delete-indices.sh /etc/periodic/

RUN printf "\n*/5\t*\t*\t*\t*\t/etc/periodic/delete-indices.sh" >> /etc/crontabs/root
RUN printf "\n*/5\t*\t*\t*\t*\t/etc/periodic/optimize-indices.sh" >> /etc/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["crond", "-f", "-l", "8"]
