HISTFILE=~/.cache/zsh_history
HISTSIZE=1000
SAVEHIST=1000


alias e='nvim'

export MANPAGER='nvim +Man!'

autoload -U colors compinit
zstyle ':completion:*' menu select
zstyle ':completion:*'  list-colors '=*=96'
colors
compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=30'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/prompt.zsh



