#!/bin/bash

chown jenkins:jenkins /var/lib/jenkins/credentials.xml &&
    chmod 0644 /var/lib/jenkins/credentials.xml &&
    mkdir /var/lib/jenkins/.ssh &&
    chown jenkins:jenkins /var/lib/jenkins/.ssh &&
    chmod 0700 /var/lib/jenkins/.ssh &&
    cp /var/private/id_rsa /var/lib/jenkins/.ssh &&
    chown jenkins:jenkins /var/lib/jenkins/.ssh/id_rsa &&
    chmod 0600 /var/lib/jenkins/.ssh/id_rsa &&
    echo $(netstat -nr | grep "^0\.0\.0\.0" | awk '{print $2}') dockerhost >> /etc/hosts &&
    CLASSPATH=/usr/share/jenkins/webroot/WEB-INF/jenkins-cli.jar:/usr/share/jenkins/webroot/WEB-INF/remoting.jar:/usr/local/lib/commons-codec-1.6.jar &&
    for FILE in /usr/local/lib/slaves/*
    do
	java hudson.cli.CLI -s http://127.0.0.1:8080 add-node ${FILE} &&
	    true
    done &&
    true
