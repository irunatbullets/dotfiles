To set this up on a fresh machine:

`rm -fr ~/.bash*`

```bash
git clone --bare git@github.com:irunatbullets/dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles' --work-tree=$HOME'
dotfiles checkout
dotfiles push --set-upstream origin main
```

IMPORTANT: Relog to make sure you're using the new dotfiles.

Add something new explicitly

```
dotfiles add path/to/file.ext

```

When commiting

```
dotfiles status
dotfiles add -u
dotfiles commit -m "comment"
dotfiles push

```

Heavily borrowed from https://github.com/andersix/dotfiles/tree/main

