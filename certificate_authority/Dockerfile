FROM ubuntu:trusty

RUN sudo apt-get update && \
  apt-get install -y openssl

COPY scripts /root/scripts
RUN find . -name *.sh | xargs chmod +x

###
# Root CA
###

# Create the root pair
RUN /root/scripts/root_ca/prepare_root_ca.sh

# Copy in root CA config
COPY root-config.txt /root/ca/openssl.cnf

# Create root key
RUN /root/scripts/root_ca/create_root_key.sh

# Create root certificate
RUN /root/scripts/root_ca/create_root_cert.sh

# Verify root certificate
RUN /root/scripts/root_ca/verify_root_cert.sh

###
# Intermediate CA
###

# Prepare the intermediary CA
RUN /root/scripts/intermediate_ca/prepare_intermediate_ca.sh

# Copy in intermediate CA config
COPY intermediate-config.txt /root/ca/intermediate/openssl.cnf

# Create intermediate key
RUN /root/scripts/intermediate_ca/create_intermediate_key.sh

# Create intermediate certificate
RUN /root/scripts/intermediate_ca/create_intermediate_cert.sh

# Verify intermediate certificate
RUN /root/scripts/intermediate_ca/verify_intermediate_cert.sh

# Create certificate chain file
RUN /root/scripts/intermediate_ca/create_ca_chain_cert.sh
