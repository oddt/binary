FROM centos:6
MAINTAINER Maciej Wójcikowski <maciek@wojcikowski.pl>
RUN yum update -y && \
    yum install -y mc nano wget gcc gcc-c++ gcc-gfortran git patch

RUN wget -O miniconda.sh https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash miniconda.sh -b -p /opt/miniconda && \
    rm miniconda.sh && \
    PATH=/opt/miniconda/bin:$PATH && \
    conda update --all --yes && \
    conda install --yes conda-build


ENV PATH /opt/miniconda/bin:$PATH

CMD [ "/bin/bash" ]
