#!/bin/bash -ue

cp kubernetes/*.yaml secret/

for secret in $(find secret | grep yaml) ; do
    sops --decrypt --in-place ${secret}
done
