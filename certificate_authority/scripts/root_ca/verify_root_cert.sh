#!/bin/sh

set -ex

cd /root/ca

openssl x509 -noout -text -in certs/ca.cert.pem
