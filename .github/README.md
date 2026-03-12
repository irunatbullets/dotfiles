I have to remember to install

```
sudo apt install grim sway autotiling brightnessctl firefox-esr xwayland fuzzel vim unzip

```

To set this up on a freshly installed  machine:

`rm -fr ~/.bash*`

```bash
git clone --bare git@github.com:irunatbullets/dotfiles.git ~/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot checkout
dot push --set-upstream origin main
```

IMPORTANT: Relog to make sure you're using the new dotfiles.

It is better to add files explicitly rather than lazily adding the whole folder. You could end up with a bunch of useless stuff you didn't really want!

```
dot add path/to/file.ext

```

When commiting, I have been using this workflow.

```
dot status
dot add -u
dot status
dot commit -m "comment"
dot push

```

Heavily borrowed from https://github.com/andersix/dotfiles/tree/main

