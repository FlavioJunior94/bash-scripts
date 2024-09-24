#!/bin/sh

mkdir /opt/localstack
mv /opt/localstack
curl --output localstack-cli-3.7.2-linux-amd64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v3.7.2/localstack-cli-3.7.2-linux-amd64-onefile.tar.gz

sudo tar xvzf localstack-cli-3.7.2-linux-*-onefile.tar.gz -C /usr/local/bin

localstack --version