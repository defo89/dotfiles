.PHONY: brew iterm symlink shell

brew:
	brew bundle

iterm:
	# source: http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
	# Specify the preferences directory
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2-profile"
	# Tell iTerm2 to use the custom preferences in the directory
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

symlink:
	# Remove old dot files
	sudo rm -rf ~/.config
	# Create symlinks in the home folder
	ln -sf ~/dotfiles/.config ~/.config
	# Remove old bins
	sudo rm -rf /usr/local/bin/kubectl
	sudo rm -rf /usr/local/bin/openstack
	sudo rm -rf /usr/local/bin/helm
	sudo rm -rf /usr/local/bin/terraform
	# Symlink new bins
	ln -sf ~/dotfiles/bin/kubectl /usr/local/bin/kubectl
	ln -sf ~/dotfiles/bin/openstack /usr/local/bin/openstack
	ln -sf ~/dotfiles/bin/helm /usr/local/bin/helm
	ln -sf ~/dotfiles/bin/terraform /usr/local/bin/terraform

shell:
	# Set fish as the default shell
	chsh -s /usr/local/bin/fish
