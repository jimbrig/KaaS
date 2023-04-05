# GPG Key Management and Encryption

*Source: [dev-notes/git-setting-up-github-keys.md at main · brotherkaif/dev-notes](https://github.com/brotherkaif/dev-notes/blob/main/gpg/gpg-key-management.md)*

## Contents

* [Import Keys](GPG%20Key%20Management%20and%20Encryption.md#import-keys)
* [List Keys](GPG%20Key%20Management%20and%20Encryption.md#list-keys)
* [Trust Keys](GPG%20Key%20Management%20and%20Encryption.md#trust-keys)
* [Export Keys](GPG%20Key%20Management%20and%20Encryption.md#export-keys)
* [Delete Keys](GPG%20Key%20Management%20and%20Encryption.md#delete-keys)
* [Encrypt](GPG%20Key%20Management%20and%20Encryption.md#encrypt)
* [Decrypt](GPG%20Key%20Management%20and%20Encryption.md#decrypt)
* [Verify](GPG%20Key%20Management%20and%20Encryption.md#verify)
* [Appendix: Links and References](GPG%20Key%20Management%20and%20Encryption.md#appendix-links-and-references)

## Generate Keys

````bash
gpg --full-generate-key
gpg --full-gen-key
````

Generate a new key pair with dialog for all options.  This is an extended version of `--generate-key`.

## Import Keys

````bash
gpg --import KEY_FILE
````

Import/merge keys. This adds the given keys to the *keyring*. The fast version is currently just a synonym.

## List Keys

````bash
gpg --list-keys
gpg --list-secret-keys
gpg -k
````

List the specified public/private keys.  If no keys are specified, then all keys from the configured public keyrings are listed.

## Trust Keys

````bash
gpg --edit-key KEY_ID
gpg> trust
````

Present a menu which enables you to do most of the key management related tasks.  It expects the specification of a key on the command line.

## Export Keys

````bash
gpg --export -armor KEY_ID > KEY.pub.asc
gpg --export-secret-keys -armor KEY_ID > KEY.asc
````

Either export all keys from all keyrings (default keyrings and those registered via option `--keyring`), or if at least one name is given, those of the given name. The exported keys are written to STDOUT or to the file given with option `--output`.  Use together with `--armor` to mail those keys.

## Delete Keys

````bash
gpg --delete-keys KEY_ID
gpg --delete-secret-keys KEY_ID
````

Allows you to delete keys from your system.

## Encrypt

````bash
gpg --encrypt --armor --recipient KEY_ID INPUT_FILE
gpg -ear KEY_ID INPUT_FILE
````

Encrypt data to one or more public keys. This command may be combined with:

* `--sign`: To sign and encrypt a message
* `--symmetric`: To encrypt a message that can decrypted using a secret key or a passphrase
* `--sign` and `--symmetric`: For a signed message that can be decrypted using a secret key or a passphrase
* `--recipient` and related options: specify which public keys to use for encryption

## Decrypt

````bash
# with a file
gpg --decrypt INPUT_FILE > OUTPUT_FILE
````

Decrypt the file given on the command line (or STDIN if no file is specified) and write it to STDOUT (or the file specified with `--output`). If the decrypted file is signed, the signature is also verified. This command differs from the default operation, as it never writes to the filename which is included in the file and it rejects files that don't begin with an encrypted message.

## Verify

````bash
# with a file
gpg --verify INPUT_FILE

# with a "here" file
gpg --verify << EOF
[content]
EOF
````

Will verify the signature of the message provided against a key on your system.

---

## Appendix: Links and References

* [2022-09-04](../2-Areas/Daily-Notes/2022/2022-09/2022-09-04.md)
* [Git](../3-Resources/Tools/Developer%20Tools/Version%20Control/Git.md)
* *GPG*
* [GitHub](../3-Resources/Tools/Developer%20Tools/Version%20Control/GitHub.md)

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022

*Backlinks:*

````dataview
list from [[GPG Key Management and Encryption]] AND -"Changelog"
````
