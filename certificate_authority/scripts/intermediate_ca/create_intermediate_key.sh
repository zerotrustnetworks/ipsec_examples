#!/bin/sh

set -ex

cd /root/ca
openssl genrsa -aes256 \
  -passout pass:this_is_not_secure_intermediate_ca_pass \
  -out intermediate/private/intermediate.key.pem 4096

chmod 400 intermediate/private/intermediate.key.pem
