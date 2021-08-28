#!/usr/bin/env bash

# @author sinarf
#
# This script automate installation of neuron notes taking application
# ref : https://neuron.zettel.page/install

echo "Install nix..."
paru -Syu nix archlinux-nix
echo "Setting up nix..."
sudo archlinux-nix setup-build-group
sudo archlinux-nix bootstrap
#echo " - enable and start daemon..."
#sudo systemctl enable nix-daemon.service
#sudo systemctl start nix-daemon.service
#echo " - add current user to the nix-users group..."
#sudo gpasswd -a $USER nix-users
echo " - add a channel and update it."
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
sudo nix-channel --update
sudo nix-env -u
source /etc/profile.d/nix{,-daemon}.sh
sudo nix-env -if https://github.com/srid/neuron/archive/master.tar.gz

# successor of neuron
#sudo nix-env -if https://github.com/srid/emanote/archive/refs/heads/master.tar.gz
