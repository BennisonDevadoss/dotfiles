setopt HIST_IGNORE_DUPS
# Initialize Zsh completion system
autoload -U colors && colors
autoload -Uz compinit
compinit

export EDITOR='nvim'
export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages

# Alias
alias ls="eza"
alias ll="eza -l"
alias grep="grep --colour"
alias cat="bat"

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# fzf setup
source <(fzf --zsh) # allow for fzf history widget


set -o vi

# Enable Git completion script in Zsh
if command -v git &> /dev/null; then
    FPATH=$(git --exec-path)/completion:$FPATH
    autoload -Uz compinit && compinit -d ~/.zcompdump
fi

export CLICOLOR=1
export LSCOLORS="ExFxBxDxCxegedabagacad"
setopt promptsubst
PS1='%B%F{green}%n@%m %F{blue}%~%f %# '


autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST

PROMPT='%B%F{green}%n@%m %F{blue}%~ %F{red}${vcs_info_msg_0_}%f %# '


 
export UV_NATIVE_TLS=true
export PY_NATIVE_CERT=true


# alias vim="nvim"

export PATH="$PATH:/opt/homebrew/opt/postgresql@17/bin"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"

# export GOOGLE_APPLICATION_CREDENTIALS="/Users/bennisondevadoss/Office/Creds/google-credentials.json"
export GOOGLE_APPLICATION_CREDENTIALS="/Users/bennisondevadoss/Office/Creds/cifcl-kyber-ai-non-prod.json"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/bennisondevadoss/.lmstudio/bin"
# End of LM Studio CLI section

export GOOGLE_CLOUD_LOCATION="asia-south1"
# export SSL_CERT_FILE="/Users/bennisondevadoss/Office/Projects/Creds/zscaler_cert.pem"
#
export PATH="$HOME/.local/bin:$PATH"


# Added by Windsurf
export PATH="/Users/bennisondevadoss/.codeium/windsurf/bin:$PATH"
