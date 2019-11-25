FROM centos:7
LABEL maintainer="alan.jenkins@claranet.uk"

RUN yum update -y && \
    yum groupinstall -y 'Development Tools'

RUN yum install -y epel-release && \
    yum install -y getdns

ADD varnish.repo /etc/yum/repos.d/varnish.repo

RUN yum install -y pygpgme yum-utils
RUN yum install -y varnish-devel varnish-libs-devel
RUN yum install -y python-docutils
ADD build.sh /usr/bin/build.sh
RUN chmod +x /usr/bin/build.sh
