# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# Settings from original .zshrc
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git pow brew rvm node pow lol)
source $ZSH/oh-my-zsh.sh

# recommended by brew doctor
export PATH='/usr/local/bin:/usr/bin/local:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/Cellar/postgresql/9.1.2 # Workaround for PG gem install

# Setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export AWS_RDS_HOME=~/.ec2/rds
export AWS_ELB_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin:$AWS_RDS_HOME/bin
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export AWS_IAM_HOME=~/.iamcli
export PATH=$PATH:$AWS_IAM_HOME/bin
export EC2_PRIVATE_KEY=`ls ~/.ec2/devops/pk-*.pem`
export EC2_CERT=`ls ~/.ec2/devops/cert-*.pem`
