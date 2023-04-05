# SSH Key Best Practices

## Metadata

* Author: *dev.to*
* Full Title: SSH Key Best Practices
* Category: #Type/Highlight/Article
* URL: https://dev.to/paulmicheli/ssh-key-best-practices-2cb7

## Highlights

* Ensure SSH Keys Are Associated With a Single Services ([View Highlight](https://instapaper.com/read/1439398212/17289748))
* Tie SSH keys back to an individual services, rather than just a generic key that is associated with multiple services github / acquia /aws etc . This will provide an effective SSH audit trail and more direct oversight. ([View Highlight](https://instapaper.com/read/1439398212/17289752))
* Use a separate key per client you SSH from ([View Highlight](https://instapaper.com/read/1439398212/17289754))
* So don’t copy the private key from your laptop to another laptop for use in parallel. Each client system should have only one key, so in case a key leaks, you know which client system was compromised. If you stop using your old laptop and start using a new one it is naturally another case and then you can copy the key. ([View Highlight](https://instapaper.com/read/1439398212/17289758))
* Adding comments to keys can allow you to organize your keys more easily. The comments are stored in end of the public key file and can be viewed in clear text. For example:
  cat ~/.ssh/{keyservice}\_rsa.pub
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDG..........qiaWxRUdk0UKU0c5ZqQYHRCw== username@hostname ([View Highlight](https://instapaper.com/read/1439398212/17289761))
