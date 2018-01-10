#!/usr/bin/env bash

mkdir -p ~/.ssh && touch ~/.ssh/config
echo -e "Host tofuconf.club\n\tStrictHostKeyChecking no\n\tIdentityFile ~/.ssh/id_rsa\n\tPort 22001\n" >> ~/.ssh/config
openssl aes-256-cbc -K ${encrypted_e8f8f0f19301_key} -iv ${encrypted_e8f8f0f19301_iv} -in ./.travis/id_rsa.enc -out ./.travis/id_rsa -d
chmod 600 ./.travis/id_rsa
cp ./.travis/id_rsa ~/.ssh/
