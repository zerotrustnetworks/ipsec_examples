#!/bin/sh

set -ex

cd /root/ca

openssl genrsa -aes256 \
  -passout pass:this_is_not_secure_root_ca_pass \
  -out private/ca.key.pem 4096

chmod 400 private/ca.key.pem
