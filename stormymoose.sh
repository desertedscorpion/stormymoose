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
    true
