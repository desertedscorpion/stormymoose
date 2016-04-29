To build

`cd $(mktemp -d) && git init && git remote add origin https://github.com/desertedscorpion/stormymoose.git && docker build -t taf7lwappqystqp4u7wjsqkdc7dquw/stormymoose .`

To run

`docker run --privileged -it --volume /sys/fs/cgroup/:/sys/fs/cgroup:ro --volume ${HOME}/.private:/var/private:ro -p 8080:8080 taf7lwappqystqp4u7wjsqkdc7dquw/stormymoose'