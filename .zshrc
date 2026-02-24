# ── Shell behaviour ────────────────────────────────────────────────
set -o vi
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE   # replaces HISTCONTROL=ignoreboth (that's bash-only)
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY       # share history across sessions
HISTSIZE=10000
SAVEHIST=10000

# ── Colors & Completion ────────────────────────────────────────────
autoload -U colors && colors
autoload -Uz compinit
compinit -d ~/.zcompdump   # one compinit call is enough

# ── Git completion ─────────────────────────────────────────────────
if command -v git &>/dev/null; then
    FPATH=$(git --exec-path)/completion:$FPATH
fi

# ── Prompt ─────────────────────────────────────────────────────────
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '(%b) '
setopt PROMPT_SUBST
precmd() { vcs_info }
PROMPT='%B%F{green}%n@%m %F{blue}%~ %F{red}${vcs_info_msg_0_}%f$ %b'

# ── Environment ────────────────────────────────────────────────────
export EDITOR='vim'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export GRPC_DNS_RESOLVER=native

# ── Aliases ────────────────────────────────────────────────────────
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias grep='grep --colour'
alias history='history -50'
# alias cat='bat'

# ── Key bindings ───────────────────────────────────────────────────
bindkey '^R' history-incremental-search-backward

# ── fzf ───────────────────────────────────────────────────────────
source <(fzf --zsh)

# ── PATH ───────────────────────────────────────────────────────────
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/Users/$USER/.codeium/windsurf/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# ── NVM ────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ── uv & env ───────────────────────────────────────────────────────
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"
