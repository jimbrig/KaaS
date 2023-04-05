# Git - Setting up GitHub Keys

*Source: [dev-notes/git-setting-up-github-keys.md at main · brotherkaif/dev-notes](https://github.com/brotherkaif/dev-notes/blob/main/git/git-setting-up-github-keys.md)*

## Resources

* [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

## Setup

Open a terminal and type this, replacing the email with **yours** (the same one you used to create your [GitHub](../3-Resources/Tools/Developer%20Tools/Version%20Control/GitHub.md) account). It will prompt for information. Just press enter until it asks for a **passphrase**:

````bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
````

**NB:** when asked for a passphrase, put something you want (and that you'll remember), it's a password to protect your private key stored on your hard drive. You'll type, nothing will show up on the screen, **that's normal**. Just type the passphrase, and when you're done, press `Enter`.

Then you need to give your **public** key to GitHub. Run:

````bash
cat ~/.ssh/id_ed25519.pub
````

It will prompt on the screen the content of the `id_ed25519.pub` file. Copy that text, then go to [github.com/settings/ssh](https://github.com/settings/ssh). 

Click on **Add SSH key**, fill in the Title with your computer name, and paste the **Key**.

Finish by clicking on the **Add key** green button.

To check that this step is completed, in the terminal run this. You will be prompted a warning, type `yes` then `Enter`.

````bash
ssh -T git@github.com
````

If you see something like this, you're done!

````bash
# Hi --------! You've successfully authenticated, but GitHub does not provide shell access
````

If it does not work, try running this before trying again the `ssh -T` command:

````bash
ssh-add ~/.ssh/id_ed25519
````

---

## Appendix: Links and References

* [2022-09-04](../2-Areas/Daily-Notes/2022/2022-09/2022-09-04.md)
* [Git](../3-Resources/Tools/Developer%20Tools/Version%20Control/Git.md)

*Backlinks:*

````dataview
list from [[Git - Setting up GitHub Keys]] AND -"Changelog"
````

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
