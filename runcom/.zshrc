# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nhuebecker/.oh-my-zsh"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
export NODEPATH="/usr/local/bin/node/"
export PATH="$NODEPATH:$HOME/go/bin:$PATH"

# Source all bash script files from dotfiles
source "/Users/nhuebecker/.dotfiles/system/.aliases"
source "/Users/nhuebecker/.dotfiles/system/.fun"

# Make Autojump Work!
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Install Starshio
eval "$(starship init zsh)"

# GH Completion
eval "$(gh completion -s zsh)"
