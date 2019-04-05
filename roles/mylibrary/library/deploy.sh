#!/bin/bash
[ -f "$1" ] && source $1

if [ -z "${tomcat}" ]; then
    printf '{"failed": true, "tomcat": "Missing required arguments: tomcat server IP"}'
    exit 1
elif [[ -z "${Build_number}" ]]; then
	printf '{"failed": true, "Build_number": "Missing required arguments: Build_number_artifact"}'
    exit 1
elif [[ -z "${author}" ]]; then
	printf '{"failed": true, "author": "Missing required arguments: Set your name"}'
    exit 1
else
	curl -T /tmp/atsyuliou/helloworld-ws/target/helloworld-ws.war http://lexx:123456@192.168.56.30:8080/manager/text/deploy?path=/atsyuliou&update=true
	printf "msg": "%s"
	cat << EOF
	{
	    "deployed": yes,
	    "message": Success,
	    "version": lattest
	}
EOF

	exit 0
fi