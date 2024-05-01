Kibana Memory Profile Analyis for Kibana
========================================

This configuration is meant to study performance. Using the logging configuration in kibana.yml, operational
memory and cpu metrics can be captured from the Docker logs. 

Let's say you have done the above and captured the logs into a file called `logs.txt`. The filebeat
configuration is meant to be used to ingest those logs back into Elasticsearch like so:

```
cat logs.txt | \
ES_USERNAME=elastic \
ES_PASSWORD=changeme \
ES_CA_CERT_ROOT=/Users/tim/code/esd/config/certs \
~/bin/filebeat/filebeat -e -c filebeat.yml -d=es
```
