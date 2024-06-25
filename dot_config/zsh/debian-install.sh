#!/bin/bash
. "$HOME"/.local/share/chezmoi/dot_config/scripts/spinner.sh

nix-channel --update >"$HOME"/install-packages.log 2>&1

start_spinner "Installing packages"
{
	nix-env -iA --quiet \
    nixpkgs.bat \
		nixpkgs.bottom \
		nixpkgs.brotli \
		nixpkgs.bun \
		nixpkgs.cmake \
		nixpkgs.fnm \
		nixpkgs.fd \
		nixpkgs.fzf \
		nixpkgs.gcc \
		nixpkgs.gh \
		nixpkgs.git \
		nixpkgs.gitflow \
		nixpkgs.git-lfs \
		nixpkgs.jp \
		nixpkgs.jq \
		nixpkgs.lazygit \
		nixpkgs.lsd \
		nixpkgs.mysql \
		nixpkgs.neovim \
		nixpkgs.oh-my-posh \
		nixpkgs.oh-my-zsh \
		nixpkgs.perl \
		nixpkgs.python3 \
		nixpkgs.ripgrep \
		nixpkgs.rustup \
		nixpkgs.sqlite \
		nixpkgs.terraform \
		nixpkgs.yq \
		nixpkgs.zellij \
		nixpkgs.zoxide \
		nixpkgs.zsh \
		nixpkgs.zsh-autocomplete \
		nixpkgs.zsh-completions
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

echo "Environment setup complete. (logs in $HOME/install-packages.log)"
echo "Please run 'source ~/.zshrc' to apply changes."
