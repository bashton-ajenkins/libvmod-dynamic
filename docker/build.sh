#!/bin/bash
set -euo pipefail

# build
# ./autogen.sh
# ./configure
# make

# # Test build works
# echo "127.0.0.1 www.localhost img.localhost" >> /etc/hosts
# make check

# Make package
VERSION=$(date +%s)
cd /src/pkg/rpm
mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
mkdir -p /tmp/pkg
cp -R /src/ "/tmp/pkg/vmod-dynamic-${VERSION}"
tar cvzf "/root/rpmbuild/SOURCES/vmod-dynamic-${VERSION}.tar.gz" -C /tmp/pkg/ .
rpmbuild -ba -D "dist .1" \
         -D "_version ${VERSION}" \
         -D "_release 1" \
         ./vmod-dynamic.spec

# Move package files to output path
mv /root/rpmbuild/SRPMS/vmod-dynamic-$VERSION-1.1.src.rpm /output/
mv /root/rpmbuild/RPMS/x86_64/vmod-dynamic-$VERSION-1.1.x86_64.rpm /output/
mv /root/rpmbuild/RPMS/x86_64/vmod-dynamic-debuginfo-$VERSION-1.1.x86_64.rpm /output/
