# Grant Ammons - How to Efficiently Manage Your Dotfiles

## Metadata

* Author: 
* Full Title: Grant Ammons - How to Efficiently Manage Your Dotfiles
* Category: #Type/Highlight/Article
* URL: https://grantammons.me/2017/11/26/efficiently-managing-dotfiles/

## Highlights

* It’s a good idea to store your dotfiles in Github, under the “special” name dotfiles (by convention). Most people do not actually put the dots in front of the filenames they store in the repo. So for instance, in the repo, your .vimrc would actually be stored as vimrc.
  Any personal executable scripts you have should also be stored here, in a bin folder. You can then set up your PATH to include ~/.bin to have access to those scripts.
* Installing dotfiles
  Using an automated tool to install dotfiles as symlinks is a best practice. The installation tool will create symlinks of the files in your dotfiles repo, in the correct location:
* Secret management
  Originally, I was recommending a solution based on keeping secrets stored in a ~/.secrets file with the secrets stored as environment variables. This emulates Heroku’s 12-factor approach. However, after talking with colleagues, this approach is not ideal for a desktop environment, and here’s why:
  You now have a plaintext file on your hard drive that is storing sensitive information. There are tools for handling sensitive info, so use them!
  Crash reports that get shipped off usually include environment variables. You don’t have control over where your secrets go.
  On a desktop machine, processes can easily spawn many sub-processes, each of which now has access to sensitive environment variables.
  A good alternative is to Use a password store like pass or lpass and store sensitive info as a note. You can write a quick script to decrypt and use in an environment variable as needed. It explicitly limits the scope of how far sensitive information can travel, and it keeps this info behind your passphrase.
* Using a curated set of base dotfiles
  We can go deeper! Many people (including me) use a curated set of dotfiles as a “base” to build upon. For my workflow, using Thoughtbot’s dotfiles is a perfect starting point:
  Their starting vim configuration includes vim-plug, Ag, Rails.vim, and Ctrl-P out of the box.
  Sensible defaults for using git, rspec, tmux and ag.
  When using Thoughtbot’s dotfiles, your own personal configs would go into ~/dotfiles-local.
* The benefits of using a set of base dotfiles is that someone has already culled together best practices. A drawback, however, is the cognitive load associated with actually learning what is in them, how they work, what shortcuts they provide. If you’re declaring dotfile bankruptcy (which I have, twice), or are just starting out, it’s worth considering base dotfiles that are sensible. I like Thoughtbot, and I consider their dotfiles sensible, which is why I chose them as a good base.
