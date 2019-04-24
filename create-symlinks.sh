#!/bin/bash

# Remove old dot files
sudo rm -rf ~/.config > /dev/null 2>&1

# Create symlinks in the home folder
ln -sf ~/dotfiles/.config ~/.config

# Remove old bins
sudo rm -rf /usr/local/bin/kubectl > /dev/null 2>&1
sudo rm -rf /usr/local/bin/openstack > /dev/null 2>&1

# Symlink new bins
ln -sf ~/dotfiles/bin/kubectl /usr/local/bin/kubectl
ln -sf ~/dotfiles/bin/openstack /usr/local/bin/openstack

# Set fish as the default shell
chsh -s /usr/local/bin/fish

# done!
echo -e "\n== Done!! ==\n"
