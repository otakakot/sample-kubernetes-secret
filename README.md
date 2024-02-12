# sample-kubernetes-secret

1. Generate key pair

```shell
make key
```

2. Set key

`.secret.env`

```.env
SOPS_AGE_KEY=AGE-SECRET-KEY-xxxxx
PUBLIC_KEY=xxxxx
```

3. Create secret

```shell
make secret secret=${xxx}
```

4. Set secret

```shell
echo xxx > ./kubernetes/${xxx}.in.txt
```

5. Encrypt secret

```shell
make encrypt secret=${xxx}
```

6. Generate manifest

```shell
make sops secret=${xxx}
```

※ If you use it in production, please .gitignore the secret manifest.

7. Decrypt secret

```shell
make decrypt secret=${xxx}
```
