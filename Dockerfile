FROM taf7lwappqystqp4u7wjsqkdc7dquw/needlessbeta
RUN dnf update --assumeyes && dnf install --assumeyes jenkins* git && dnf update --assumeyes && dnf clean all && systemctl enable jenkins.service
VOLUME /var/private
COPY credentials.xml /var/lib/jenkins/credentials.xml
RUN chown jenkins:jenkins /var/lib/jenkins/credentials.xml && chmod 0644 /var/lib/jenkins/credentials.xml
EXPOSE 8080
CMD ["/usr/sbin/init"]