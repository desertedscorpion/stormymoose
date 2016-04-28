FROM taf7lwappqystqp4u7wjsqkdc7dquw/needlessbeta
RUN dnf update --assumeyes && dnf install --assumeyes jenkins* && dnf update --assumeyes && dnf clean all && systemctl enable jenkins.service
EXPOSE 8080
CMD ["/usr/sbin/init"]