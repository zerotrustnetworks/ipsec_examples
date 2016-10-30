#!/bin/sh

set -ex

cd /root/ca

### Create intermediate CSR
openssl req -config intermediate/openssl.cnf -new -sha256 \
  -passin pass:this_is_not_secure_intermediate_ca_pass \
  -subj "/C=US/ST=California/L=San Francisco, CA/O=Zero Trust Networks/OU=ZTN Certificate Authority/CN=ZTN Intermediate CA" \
  -key intermediate/private/intermediate.key.pem \
  -out intermediate/csr/intermediate.csr.pem

### Sign CSR with Root CA
openssl ca -config openssl.cnf -extensions v3_intermediate_ca \
  -passin pass:this_is_not_secure_root_ca_pass \
  -batch \
  -days 3650 -notext -md sha256 \
  -in intermediate/csr/intermediate.csr.pem \
  -out intermediate/certs/intermediate.cert.pem
