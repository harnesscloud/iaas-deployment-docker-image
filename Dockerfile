FROM harnesscloud/iaas-deployment-docker-image-base:latest

MAINTAINER Gabriel Figueiredo <gabriel.figueiredo@imperial.ac.uk>

WORKDIR /harness

RUN git clone -b v1.0 https://github.com/harnesscloud/crs.git && \
    git clone -b v1.0 https://github.com/harnesscloud/irm-nova.git && \
    git clone https://github.com/harnesscloud/irm-shepard.git

COPY cfg/* cfg/
COPY supervisord.conf ./
COPY start_harness_iaas ./
COPY bootstrap ./

RUN rm -f /harness/irm-nova/compute_list && \
    ln -sf /etc/harness-iaas/compute_list /harness/irm-nova/compute_list 
RUN rm -f /harness/crs/crs.constraints && \
    ln -sf /etc/harness-iaas/crs.constraints /harness/crs/crs.constraints

VOLUME /etc/harness-iaas

EXPOSE 8888 56789

CMD ./start_harness_iaas
