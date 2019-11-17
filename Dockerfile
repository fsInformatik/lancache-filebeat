FROM docker.elastic.co/beats/filebeat:7.4.2

ENV CACHE_LOGS_DIRECTORY "/data/logs"
ENV LOGSTASH_HOST "localhost:5044"

USER root
RUN yum install -y gettext

WORKDIR /usr/share/filebeat/
COPY --chown=root:filebeat configs/* /usr/share/filebeat/my-configs/

COPY run.sh .

CMD ["sh", "run.sh"]