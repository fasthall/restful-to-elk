#!/bin/sh

sed -i "s|RESTFUL_URL|$URL|g" /opt/http_poller.conf
echo 'elasticsearch.url: "http://localhost:9200"' >> /opt/kibana-4.4.1-linux-x64/config/kibana.yml
/opt/elasticsearch-2.2.0/bin/elasticsearch -Des.insecure.allow.root=true > /dev/NULL &
/opt/kibana-4.4.1-linux-x64/bin/kibana > /dev/NULL &
/opt/logstash-2.2.2/bin/logstash agent -f /opt/http_poller.conf > /dev/NULL &
sleep 5
tail -f /opt/elasticsearch-2.2.0/logs/elasticsearch.log