#!/bin/bash

set -x 

HOST='https://elastic:changeme@localhost:19200'
CONTENT_TYPE='Content-Type: application/json'

send_request () {
  curl -X POST -H "${CONTENT_TYPE}" "${HOST}$1" -d "${2}"
  echo
}


# roles
send_request /_security/role/ilm '
{"cluster":["manage_ilm"],"indices":[{"names":["ilm-*","shrink-ilm-*","apm-*","metricbeat-*","filebeat-*"],"privileges":["create_index","manage","write","manage_ilm"]}]}
'

send_request /_security/role/metricbeat_writer '
{"cluster":["manage_ingest_pipelines","manage_index_templates","monitor"],"indices":[{"names":["apm-*","filebeat-*","metricbeat-*"],"privileges":["write","create_index"]}]}
'

send_request /_security/role/data_user '
{"applications":[{"application":"kibana-.kibana","privileges":["space_read"],"resources":["space:default"]}],"cluster":[],"indices":[
    {
      "allow_restricted_indices": false,
      "field_security": { "except": [], "grant": [ "*" ] },
      "names": [ "kibana_sample_data*", "ecommerce*", "test*" ],
      "privileges": [ "all" ]
    }
  ],"metadata":{},"run_as":[],"transient_metadata":{"enabled":true}}
'

send_request /_security/role/tvgameshowhost '{"cluster":[]}'

send_request /_security/role/dev_reporting_user '
{"applications":[{"application":"kibana-.kibana","privileges":["feature_discover.minimal_read","feature_discover.generate_report","feature_dashboard.minimal_read","feature_dashboard.generate_report","feature_dashboard.download_csv_report","feature_canvas.read","feature_visualize.minimal_read","feature_visualize.generate_report"],"resources":["*"]}],"cluster":[],"indices":[],"metadata":{},"run_as":[],"transient_metadata":{"enabled":true}}
'


# useres
send_request /_security/user/kibana_system/_password '
{"password":"changeme"}
'

send_request /_security/user/metricbeat_writer '
{"full_name":"Internal Metricbeat User","password":"changeme","roles":["metricbeat_writer","ilm"]}
'

send_request /_security/user/beats_system/_password '
{"password":"changeme"}
'

send_request /_security/user/test_user '
{"email":"test@example.com","enabled":true,"full_name":"Test T. User","metadata":{},"password":"changeme","roles":["data_user","dev_reporting_user"]}
'
