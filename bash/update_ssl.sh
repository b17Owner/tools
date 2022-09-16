#!/bin/bash

VERSION='1.1.1q'

cd ~
mkdir -p src && cd src

wget --no-check-certificate https://www.openssl.org/source/openssl-${VERSION}.tar.gz
mkdir /opt/openssl
tar xfvz openssl-${VERSION}.tar.gz --directory /opt/openssl
export LD_LIBRARY_PATH=/opt/openssl/lib
cd /opt/openssl/openssl-${VERSION}/
./config --prefix=/opt/openssl --openssldir=/opt/openssl/ssl
make
make test
make install

touch /etc/profile.d/openssl.sh

cat > /etc/profile.d/openssl.sh <<<'
#!/bin/sh
export PATH=/opt/openssl/bin:${PATH}
export LD_LIBRARY_PATH=/opt/openssl/lib:${LD_LIBRARY_PATH}
'

chmod +x /etc/profile.d/openssl.sh
source /etc/profile.d/openssl.sh
