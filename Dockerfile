FROM docker.elastic.co/beats/filebeat:7.4.2

ENV CACHE_LOGS_DIRECTORY "/data/logs"
ENV LOGSTASH_HOST "localhost"

USER root
RUN yum install -y gettext

WORKDIR /usr/share/filebeat/
COPY --chown=root:filebeat configs/* /usr/share/filebeat/my-configs/
RUN envsubst '$LOGSTASH_HOST $CACHE_LOGS_DIRECTORY' < "my-configs/filebeat.yml.tmpl" > "filebeat.yml"
USER filebeat