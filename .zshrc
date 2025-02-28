
[[ $- != *i* ]] && return
bindkey -v

# basic environment setup
# NOTE: Since several tools are installed via cargo, cargo env must be setup first.
[ -f "${CARGO_HOME:-$HOME/.cargo}/env" ] && . "${CARGO_HOME:-$HOME/.cargo}/env"
if [ -d "$HOME/.rustup" ]; then
  export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
  export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
fi
if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env --use-on-cd --shell zsh)"
  source <(fnm completions --shell zsh)
  export FNM_NODE_DIST_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
fi
if [[ ! "$PATH" == *$HOME/.local/bin* ]] && [[ -d "$HOME/.local/bin" ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.local/bin"
fi

# zsh integration of cli tools
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -x "$(command -v direnv)" ] && eval "$(direnv hook zsh)"
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"
# export STARSHIP_CONFIG=~/.config/starship.toml

if [[ -x "$(command -v eza)" ]]; then
  alias ll='eza -al --header --icons=auto --sort=type'
  alias ls='eza --icons=auto --sort=type'
else
  alias ll='ls -al --color=auto'
  alias ls='ls --color=auto'
fi

alias b='bat'
alias v='nvim'
alias lg='lazygit'
# navigation
alias ..='cd ..'
alias ...='cd ../..'

alias sized='du -chs ./*'
alias pp="echo $PATH | tr ':' '\n'"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# NOTE: zsh-syntax-highlighting must be at the end of .zshrc file!
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
