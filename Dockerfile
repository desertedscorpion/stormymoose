FROM taf7lwappqystqp4u7wjsqkdc7dquw/needlessbeta
RUN dnf update --assumeyes && dnf install --assumeyes jenkins* git && dnf update --assumeyes && dnf clean all && systemctl enable jenkins.service
VOLUME /var/private
EXPOSE 8080
CMD ["/usr/sbin/init"]