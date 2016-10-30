#!/bin/sh

set -ex

cd /root/ca

### Verify cert contents
openssl x509 -noout -text \
  -in intermediate/certs/intermediate.cert.pem

### Verify cert against root CA
openssl verify -CAfile certs/ca.cert.pem \
  intermediate/certs/intermediate.cert.pem
