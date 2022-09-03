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
	# gitignore
	sudo rm -f ~/.gitignore
	ln -sf ~/dotfiles/.gitignore ~/.gitignore
	# Remove old dot files
	sudo rm -rf ~/.config
	# Create symlinks in the home folder
	ln -sf ~/dotfiles/.config ~/.config
	# Remove old bins
	sudo rm -rf /usr/local/bin/kubectl
	sudo rm -rf /usr/local/bin/kluster
	sudo rm -rf /usr/local/bin/logon
	sudo rm -rf /usr/local/bin/logonf
	sudo rm -rf /usr/local/bin/kubernikusctl
	sudo rm -rf /usr/local/bin/binding
	sudo rm -rf /usr/local/bin/hammer
	sudo rm -rf /usr/local/go/bin/k9s
	sudo rm -rf /usr/local/bin/openstack
	sudo rm -rf /usr/local/bin/openstack-swift
	sudo rm -rf /usr/local/bin/helm
	sudo rm -rf /usr/local/bin/helm2
	sudo rm -rf /usr/local/bin/fly
	sudo rm -rf /usr/local/go/bin/go
	sudo rm -rf /usr/local/bin/go
	# Symlink new bins
	sudo ln -sf ~/dotfiles/bin/kubectl /usr/local/bin/kubectl
	sudo ln -sf ~/dotfiles/bin/kluster /usr/local/bin/kluster
	sudo ln -sf ~/dotfiles/bin/logon /usr/local/bin/logon
	sudo ln -sf ~/dotfiles/bin/logonf /usr/local/bin/logonf
	sudo ln -sf ~/dotfiles/bin/kubernikusctl /usr/local/bin/kubernikusctl
	sudo ln -sf ~/dotfiles/bin/binding /usr/local/bin/binding
	sudo ln -sf ~/dotfiles/bin/hammer /usr/local/bin/hammer
	sudo ln -sf ~/dotfiles/bin/k9s /usr/local/bin/k9s
	sudo ln -sf ~/dotfiles/bin/openstack /usr/local/bin/openstack
	sudo ln -sf ~/dotfiles/bin/openstack-swift /usr/local/bin/openstack-swift
	sudo ln -sf ~/dotfiles/bin/helm /usr/local/bin/helm
	sudo ln -sf ~/dotfiles/bin/helm2 /usr/local/bin/helm2
	sudo ln -sf ~/dotfiles/bin/fly /usr/local/bin/fly
	sudo ln -sf ~/dotfiles/bin/fly /usr/local/bin/fly5
	sudo ln -sf ~/dotfiles/bin/go /usr/local/bin/go
	sudo ln -sf ~/dotfiles/bin/go /usr/local/go/bin/go
	sudo ln -sf ~/dotfiles/bin/terraform /usr/local/bin/terraform
	sudo ln -sf ~/dotfiles/bin/terragrunt /usr/local/bin/terragrunt

shell:
	# Set fish as the default shell
	chsh -s /usr/local/bin/fish
