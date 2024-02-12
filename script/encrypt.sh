#!/bin/bash -ue

secret=$1

if [[ ! -e kubernetes/${secret}.yaml ]]; then echo "kubernetes/${secret}.yaml not exists"; exit 1; fi

yq -i "(del.sops)" ./kubernetes/${secret}.yaml

yq -i ".data.${secret}=\"$(cat kubernetes/${secret}.in.txt | base64)\"" kubernetes/${secret}.yaml

sops --encrypt \
  --age ${PUBLIC_KEY} \
  --encrypted-regex '^(data|stringData)$$' \
  --in-place \
  kubernetes/${secret}.yaml

yamlfmt kubernetes/${secret}.yaml
