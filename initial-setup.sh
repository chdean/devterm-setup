#!/bin/sh

# remove unneeded locales
locale-gen --purge en_US

# fix apt sources
rm -rf /etc/apt/sources.list.d/githubcli.list
apt update

# enable ssh
rm -f /etc/ssh/sshd_not_to_be_run
systemctl enable ssh
systemctl start ssh

# set hostname
hostnamectl set-hostname devterm

# set console to dvorak
sed -i 's/XKBVARIANT\=\"\"/XKBVARIANT\=\"dvorak\"/g' /etc/default/keyboard

