# Path to your oh-my-zsh installation.
export ZSH=/Users/benne/.oh-my-zsh

# PATH
export PATH="$PATH:`yarn global bin`"

export TERM="xterm-256color"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
# POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web_search)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/zsh_includes/tmuxinator.zsh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# aliases
alias vim="nvim"
export EDITOR=vim

alias vimconfig="vim ~/dotfiles/vimrc"
alias zshconfig="vim ~/dotfiles/zshrc"
alias ll="ls -als"
alias proj="cd /Users/benne/projects"
alias deluxe="cd /Users/benne/projects/deluxeondemand/poirot"




# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
