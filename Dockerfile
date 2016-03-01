FROM harnesscloud/iaas-deployment-base:latest

MAINTAINER Gabriel Figueiredo <gabriel.figueiredo@imperial.ac.uk>

WORKDIR /harness

RUN git clone https://github.com/harnesscloud/crs.git
RUN git clone https://github.com/harnesscloud/harness-resource-manager.git
RUN git clone https://github.com/harnesscloud/irm-nova.git
RUN git clone https://github.com/harnesscloud/irm-neutron.git
RUN git clone https://github.com/harnesscloud/irm-net.git --branch tcrules

# add insecure private key, for any future development we should generate a key
# and push it through nova once irm-nova implements this functionality
RUN mkdir -p -m 0700 /root/.ssh
ADD harness_insecure-id_rsa /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/id_rsa
ADD harness_insecure-id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0644 /root/.ssh/authorized_keys
ADD ssh_config /root/.ssh/config
RUN chmod 644 /root/.ssh/config

COPY cfg/* cfg/
COPY supervisord.conf ./
COPY start_harness_iaas ./
COPY bootstrap ./

EXPOSE 56789 8889 7779 9999

CMD ./start_harness_iaas
