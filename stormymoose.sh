#!/bin/bash

chown jenkins:jenkins /var/lib/jenkins/credentials.xml &&
    chmod 0644 /var/lib/jenkins/credentials.xml &&
    if [ ! -d /var/lib/jenkins/.ssh ]
    then
	mkdir /var/lib/jenkins/.ssh &&
	    chown jenkins:jenkins /var/lib/jenkins/.ssh &&
	    chmod 0700 /var/lib/jenkins/.ssh &&
	    true
    fi &&
    if [ -f /var/lib/jenkins/.ssh/id_rsa ]
    then
	cp /var/private/id_rsa /var/lib/jenkins/.ssh &&
	    chown jenkins:jenkins /var/lib/jenkins/.ssh/id_rsa &&
	    chmod 0600 /var/lib/jenkins/.ssh/id_rsa &&
	    true
    fi &&
    DOCKERHOST=$(netstat -nr | grep "^0\.0\.0\.0" | awk '{print $2}') &&
    (
	(grep dockerhost /etc/hosts && sed -i "s#^.*\s*dockerhost\$#${DOCKERHOST}\tlocalhost.localdomain localhost#" /etc/hosts ) ||
	    echo -e ${DOCKERHOST}\tdockerhost >> /etc/hosts
    ) &&
    CLASSPATH=/usr/share/jenkins/webroot/WEB-INF/jenkins-cli.jar:/usr/share/jenkins/webroot/WEB-INF/remoting.jar:/usr/local/lib/commons-codec-1.6.jar &&
    for FILE in /usr/local/lib/slaves/*
    do
	java hudson.cli.CLI -s http://127.0.0.1:8080 add-node ${FILE} &&
	    sleep 10s &&
	    true
    done &&
    for FILE in /usr/local/lib/jobs/*
    do
	java hudson.cli.CLI -s http://127.0.0.1:8080 add-job ${FILE} &&
	    sleep 10s &&
	    true
    done &&
    true
