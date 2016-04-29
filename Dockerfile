FROM taf7lwappqystqp4u7wjsqkdc7dquw/needlessbeta
RUN dnf update --assumeyes && dnf install --assumeyes jenkins* && dnf update --assumeyes && dnf clean all && systemctl enable jenkins.service
COPY credentials.xml /var/lib/jenkins/credentials.xml
COPY stormymoose.sh /usr/local/sbin/stormymoose
COPY stormymoose.service /usr/lib/systemd/stormymoose.service
RUN chmod 0500 /usr/local/sbin/stormymoose
RUN systemctl enable stormymoose.service
EXPOSE 8080
VOLUME /var/private
CMD ["/usr/sbin/init"]