FROM ubuntu:trusty

RUN sudo apt-get update && \
  apt-get install -y openssl

COPY scripts /root/scripts
RUN chmod +x /root/scripts/*.sh

# Create the root pair
RUN /root/scripts/prepare_root_ca.sh

# Copy in root CA config
COPY root-config.txt /root/ca/openssl.cnf

# Create root key
RUN /root/scripts/create_root_key.sh

# Create root certificate
RUN /root/scripts/create_root_cert.sh

# Verify root certificate
RUN /root/scripts/verify_root_cert.sh
