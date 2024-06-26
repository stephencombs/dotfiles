#!/bin/bash
. "$HOME"/.local/share/chezmoi/dot_config/scripts/spinner.sh

start_spinner "Updating apt registries"
{
	sudo apt-get update -y
	sudo apt-get upgrade -y
} >"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing build-essential"
{
	sudo apt-get install -y build-essential
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing unzip"
{
	sudo apt-get install -y unzip
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing git"
{
	sudo apt-get install -y git
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing zsh"
{
	sudo apt-get install -y zsh
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

# Set zsh as default shell
chsh -s "$(which zsh)"

start_spinner "Installing zsh-autosuggestions"
{
	echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/Raspbian_9.0/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
	curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/Raspbian_9.0/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg >/dev/null
	sudo apt update -y
	sudo apt install -y zsh-autosuggestions
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing zsh-autocomplete"
{
	cd /usr/bin/ || exit
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing oh-my-zsh/posh"
{
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	yes | curl -s https://ohmyposh.dev/install.sh | sudo bash -s
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing lazygit"
{
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing bat"
{
	sudo apt-get install -y bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing bottom"
{
	curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_arm64.deb
	sudo dpkg -i bottom_0.9.6_arm64.deb
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing fnm"
{
	curl -fsSL https://fnm.vercel.app/install | bash
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing bun"
{
	curl -fsSL https://bun.sh/install | bash
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing cargo"
{
	curl https://sh.rustup.rs -sSf | sh -s -- -y
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing zoxide"
{
	yes | curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing zellij"
{
	cargo install --locked zellij
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

start_spinner "Installing remaining packages"
{
	sudo apt-get install -y \
		bat \
		brotli \
		cmake \
		fd-find \
		fzf \
		gcc \
		gh \
		git-flow \
		git-lfs \
		jp \
		jq \
		lsd \
		neovim \
		perl \
		python3 \
		ripgrep \
		rustup \
		yq
} >>"$HOME"/install-packages.log 2>&1
stop_spinner

echo "Environment setup complete. (logs in $HOME/install-packages.log)"
echo "Please run 'source ~/.zshrc' to apply changes."
