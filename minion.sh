#!/usr/bin/env bash
echo "Installing confd and setting it up..."
CONFD_VERSION=0.11.0
CONFD_DIR=/opt/confd-${CONFD_VERSION}
mkdir -p ${CONFD_DIR}
curl -L https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -o ${CONFD_DIR}/confd-${CONFD_VERSION}-linux-amd64
chmod +x ${CONFD_DIR}/confd-${CONFD_VERSION}-linux-amd64
ln -sf ${CONFD_DIR}/confd-${CONFD_VERSION}-linux-amd64 /usr/local/bin/confd
