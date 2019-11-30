# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
# In agnoster, default username is omitted from prompt
DEFAULT_USER=`whoami` 

# Set options

# case-insensitive globbing
NO_CASE_GLOB="true"

# add more data to history (timestamp, elapsed time)
EXTENDED_HISTORY="true"

# share history across multiple zsh sessions
SHARE_HISTORY="true"

# append to history
APPEND_HISTORY="true"

# adds commands as they are typed, not at shell exit
INC_APPEND_HISTORY="true"

#ignore duplicates when searching
HIST_FIND_NO_DUPS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# You enable zsh correction with these options
CORRECT="true"
CORRECT_ALL="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm sudo z)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nano'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias hs="http-server"
alias ip="/sbin/ifconfig en0 | grep 'inet '"
alias zsh-config="nano ~/terminal-setup/dotfiles/zshrc.sh"
alias zsh-read="less ~/terminal-setup/dotfiles/zshrc.sh"
alias zsh-reload="source ~/.zshrc"
alias marked="open -a 'Marked 2'"
alias hideon="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias hideoff="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias which-alias="zsh -ixc : 2>&1 | grep -iE"
alias npmlsg="npm ls -g --depth 0"
# alias ff="find . -name '*\!{*}*' -ls"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
path=($path ~/bin)
