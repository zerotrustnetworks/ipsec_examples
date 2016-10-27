#!/bin/sh

set -ex

cd /root/ca

openssl req -config openssl.cnf \
  -passin pass:this_is_not_secure_root_ca_pass \
  -key private/ca.key.pem \
  -new -x509 -days 7300 -sha256 -extensions v3_ca \
  -subj "/C=US/ST=California/L=San Francisco, CA/O=Zero Trust Networks/OU=ZTN Certificate Authority/CN=ZTN Root CA" \
  -out certs/ca.cert.pem

chmod 444 certs/ca.cert.pem
