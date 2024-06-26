# dotfiles

Welcome to my dotfiles! The entirety of my development environment. Follow the steps below to try it out on your machine.

## OS Support
- macOS
- Linux (Debian-based)

## What's included?

- [Alacritty](https://alacritty.org/index.html#Installation) (Terminal emulator)
- [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md) (Text editor/IDE)
- [zellij](https://github.com/zellij-org/zellij/blob/main/docs/THIRD_PARTY_INSTALL.md) (Terminal multiplexer)
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) (Shell)
- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) (Prompt theme)
- [fzf](https://github.com/junegunn/fzf/blob/master/INSTALL.md) (Fuzzy finder)
- [zoxide](https://github.com/ajeetdsouza/zoxide/blob/master/INSTALL.md) (Supercharged cd)
- [fnm](https://github.com/Schniz/fnm) (Fast and simple node version manager)
- [lazygit](https://github.com/jesseduffield/lazygit/blob/master/INSTALL.md) (Git GUI)
- [lsd](https://github.com/Peltoche/lsd/blob/master/INSTALL.md) (Better ls)
- [bat](https://github.com/sharkdp/bat/blob/master/INSTALL.md) (Better cat)
- [delta](https://github.com/dandavison/delta/blob/master/INSTALL.md) (Better diff viewer)

## Installation

1. Install [age](https://github.com/FiloSottile/age?tab=readme-ov-file#installation) to decrypt secure files 
```bash
brew install age # macOS
# or
sudo apt install -y age # Debian
```

2. Run this command to download and apply the environment using [chezmoi](https://www.chezmoi.io/)
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply stephencombs
```

3. Source the [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) configuration
```bash
source ~/.zshrc
```

3. That's it! Enjoy the time you just saved not needing to set everything up manually 🏖😎

> [!NOTE] 
> Want to try it out before applying it to your machine?
> Well, just spin up a virtual machine and follow the same steps. That is what's so great about [chezmoi](https://www.chezmoi.io/)!
