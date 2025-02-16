
[[ $- != *i* ]] && return

# zsh integration of cli tools
[ -x "$(command -v fzf)" ] && source <(fzf --zsh)
[ -x "$(command -v direnv)" ] && eval "$(direnv hook zsh)"
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"
# export STARSHIP_CONFIG=~/.config/starship.toml

if [[ -x "$(command -v eza)" ]]; then
  alias ll='eza -al --header --icons=auto --sort=type'
  alias ls='eza --icons=auto --sort=type'
else
  alias ll='ls -al --color=auto'
  alias ll='ls --color=auto'
fi

alias v='nvim'
alias lg='lazygit'

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# NOTE: zsh-syntax-highlighting must be at the end of .zshrc file!
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
