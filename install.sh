#!/bin/bash
# INSTALL SETUP
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

function log {
  printf "${PURPLE}${1}${NC}\n"
}

# Install brew
log "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

# Brew Install Mac Apps
# This pulls from the macapps.txt file
log "Installing Brew"
while read p; do
  log "- Installing $p"
  brew install $p
done <mactools.txt

# Brew Install Mac Apps
# This pulls from the macapps.txt file
log "Installing Casks"
while read p; do
  log "- Installing $p"
  brew cask install $p
done <maccasks.txt

# Install oh-my-zsh
log "Install OhMyZsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Yabai
log "Install Yabai"
sh install_yabai.sh

# Move Folders
log "Move Folders"

# Remove and Link .yabairc
log "- Move .yabairc"
rm -rf ~/.yabairc
ln -sv ~/.dotfiles/runcom/.yabairc ~

# Remove and Link .skhd
log "- Move .skhd"
rm -rf ~/.skhdrc
ln -sv ~/.dotfiles/runcom/.skhdrc ~

# Remove and Link .tmux.conf
log "- Move .tmux.conf"
rm -rf ~/.tmux.conf
ln -sv ~/.dotfiles/runcom/.tmux.conf

# Remove and Link Hyper
log "- Move .hyper.js"
rm -rf ~/.hyper.js
ln -sv ~/.dotfiles/runcom/.hyper.js ~

# Remove and Link ZSH
log "- Move .zshrc"
rm -rf ~/.zshrc
ln -sv ~/.dotfiles/runcom/.zshrc ~

source ~/.zshrc

# Clone Plugin Repos
log "Install ZSH Plugins"
log "- Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
log "- Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ~/.zshrc
