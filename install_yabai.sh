#!/bin/bash

# Install Yabai
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
# install the scripting addition
sudo yabai --install-sa
# start yabai
brew services start yabai
brew services start skhd

# load the scripting addition
killall Dock

# stop, upgrade, start yabai
brew services stop yabai
brew services stop skhd
brew upgrade yabai
brew upgrade skhd
brew services start yabai
brew services start skhd

# reinstall the scripting addition
sudo yabai --uninstall-sa
sudo yabai --install-sa

# load the scripting addition
killall Dock