FROM taf7lwappqystqp4u7wjsqkdc7dquw/needlessbeta
COPY stormymoose.sh /usr/local/sbin/stormymoose
COPY stormymoose.service /usr/lib/systemd/system/stormymoose.service
COPY credentials.xml /var/lib/jenkins/credentials.xml
RUN dnf update --assumeyes && dnf install --assumeyes jenkins* openssh-clients net-tools && dnf update --assumeyes && dnf clean all && systemctl enable jenkins.service && chmod 0500 /usr/local/sbin/stormymoose && systemctl enable stormymoose.service && chown jenkins:jenkins /var/lib/jenkins/credentials.xml && mkdir /usr/local/lib/slaves && mkdir /usr/local/lib/nodes
ADD http://central.maven.org/maven2/commons-codec/commons-codec/1.6/commons-codec-1.6.jar /usr/local/lib
COPY slaves/dockerhost.xml /usr/local/lib/slaves
EXPOSE 8080
VOLUME /var/private
CMD ["/usr/sbin/init"]