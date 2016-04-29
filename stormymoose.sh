#!/bin/bash

chown jenkins:jenkins /var/lib/jenkins/credentials.xml &&
    chmod 0644 /var/lib/jenkins/credentials.xml &&
    mkdir /var/lib/jenkins/.ssh &&
    chmod 0700 /var/lib/jenkins/.ssh &&
    cp /var/private/id_rsa /var/lib/jenkins/.ssh &&
    chmod 0600 /var/lib/jenkins/.ssh &&
    true
