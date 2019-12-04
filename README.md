
# Exercise: make

## Prerequisites

* gpg: `brew install gpg`

## Problem

You have following directory structure.

```
manifests/
    secret.yaml.template
    pod.yaml
secrets/
    dev/
        db-password.txt.enc
        some-apikey.txt.enc
    prod/
        db-password.txt.enc
        some-apikey.txt.enc
```

Write a Makefile that produce `build/my-app.yaml` with following command:

```sh
export GPG_PASSPHRASE=pass-dev
export ENV_NAME=dev
```

```sh
make build/my-app.yaml
```

Expected yaml file is available as a test 👍

```sh
$ make test
diff expected-my-app.yaml build/my-app.yaml
Passed! 👍
```

### Additional information

* Encryption password for prod secrets is `pass-prod`.
* Secrets are encrypted with `gpg` and they can be decrypted with

    ```sh
    gpg --passphrase "$GPG_PASSPHRASE" < my-secret.txt.enc -o my-secret.txt
    ```

* You have two utility scripts under `tools` directory:

  `create-secret.sh`:

    ```sh
    $ create-secret.sh secret.yaml.template secret-1.txt secret-2.txt ...
    ```

  `join-yamls.sh`:

    ```sh
    $ join-yamls.sh yaml-1.yaml yaml-2.yaml ...
    ```

* You may produce following intermediate files under `build` directory

    ```
    build/
        my-app.yaml     # <- final output
        manifests/
            secret.yaml
            pod.yaml
        secrets/
            db-password.txt
            some-apikey.txt
    ```
