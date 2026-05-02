#!/bin/bash -ue

secret=$1

if [[ -z "${secret}" ]]; then echo "please specify secret"; exit 1; fi

cat << EOF > kubernetes/${secret}.yaml
apiVersion: v1
kind: Secret
metadata:
  name: ${secret}
type: Opaque
data:
  ${secret}: ""
EOF

touch kubernetes/${secret}.in.txt

touch kubernetes/${secret}.out.txt
