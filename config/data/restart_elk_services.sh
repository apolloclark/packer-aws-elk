#!/bin/bash -eux

sleep 30s
service elasticsearch restart
sleep 45s
service elastalert restart
service kibana restart
service zookeeper restart
service kafka restart
sleep 15s
service logstash restart
sleep 15s
service auditbeat restart
service filebeat restart
service metricbeat restart
service heartbeat-elastic restart
service packetbeat restart

service osqueryd stop
rm -rf /var/osquery/osquery.db/*
service osqueryd restart
