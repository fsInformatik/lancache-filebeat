envsubst '$LOGSTASH_HOST $CACHE_LOGS_DIRECTORY' < "my-configs/filebeat.yml.tmpl" > "filebeat.yml"

/usr/local/bin/docker-entrypoint -e