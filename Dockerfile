FROM centos:7

RUN yum clean all
RUN yum -y update
RUN yum -y install centos-release-scl
RUN yum -y install devtoolset-8-gcc-c++ devtoolset-8-gcc-gfortran
RUN yum -y install autoconf automake curl git libtool make python27 which
RUN yum clean all

RUN echo PATH=/opt/rh/devtoolset-8/root/usr/bin/:\$PATH >> /etc/bashrc

RUN cd /tmp && \
    curl -f -s -S -R -L -O https://github.com/Kitware/CMake/releases/download/v3.16.5/cmake-3.16.5-Linux-x86_64.tar.gz && \
    mkdir -p /usr/local/cmake && \
    tar zxvf cmake-3.16.5-Linux-x86_64.tar.gz -C /usr/local/cmake --strip-components=1 && \
    rm cmake-3.16.5-Linux-x86_64.tar.gz && \
    echo export PATH=/usr/local/cmake/bin:\$PATH >> /etc/bashrc

CMD ["/bin/bash"]
