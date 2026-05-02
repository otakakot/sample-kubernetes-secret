#!/bin/bash -ue

secret=$1

if [[ ! -e kubernetes/${secret}.yaml ]]; then echo "kubernetes/${secret}.yaml not exists"; exit 1; fi

sops --decrypt kubernetes/${secret}.yaml > kubernetes/${secret}.tmp.yaml

touch kubernetes/${secret}.in.txt

yq ".data.${secret}" kubernetes/${secret}.tmp.yaml | base64 -D > kubernetes/${secret}.out.txt

rm kubernetes/${secret}.tmp.yaml
