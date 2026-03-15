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

# Niri

Okay, for Debian do:

```
echo "deb http://download.opensuse.org/repositories/home:/AvengeMedia:/danklinux/Debian_13/ /" | sudo tee /etc/apt/sources.list.d/danklinux.list

curl -fsSL https://download.opensuse.org/repositories/home:AvengeMedia:danklinux/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_AvengeMedia_danklinux.gpg > /dev/null
```
followed by:

```
sudo apt update
sudo apt install --no-install-recommends niri


```
Enjoy!

# Flatpaks/bazaar!

Ensure we have xdg-desktop-portal-gtk stuff, install flatpak, add the flathub repository, and!

```
sudo apt install --no-install-recommends xdg-desktop-portal xdg-desktop-portal-gtk
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

Relog/or reboot, even if you think it's all good, just do it. Then you should be able to:

```
flatpak install flathub io.github.kolunmi.Bazaar

```

Bazaar _should_ now be available in fuzzel, but if not you can run it with the follow command **ATTENTION: This first load is will take minutes (especially on raspberry pi)**:

```
flatpak install flathub io.github.kolunmi.Bazaar

```

You should now be able to install things and have them show up in fuzzel, if they're still not showing up make sure to logout completely and then back in!


# Raspberry pi note:

In `/boot/firmware/config.txt` add:

```
usbcore.autosuspend=-1
hdmi_force_hotplug=1
gpu_mem=256
```

and in `/boot/firmward/cmdline.txt` add

```
video=HDMI-A-1:1920x1080@60

```


Heavily borrowed from https://github.com/andersix/dotfiles/tree/main


