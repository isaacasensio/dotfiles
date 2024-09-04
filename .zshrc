# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.dotfiles/.aliases ]] || source ~/.dotfiles/.aliases
[[ ! -f ~/.dotfiles/.dockerfunc ]] || source ~/.dotfiles/.dockerfunc
[[ ! -f ~/.dotfiles/.functions ]] || source ~/.dotfiles/.functions
[[ ! -f ~/.dotfiles/.vagrantfunc ]] || source ~/.dotfiles/.vagrantfunc

export PATH=/Users/isaac/Library/Python/3.11/bin:$PATH
export PATH="$PATH:/Users/isaac/.local/bin:/usr/local/bin"
echo $PATH
export EDITOR="nvim"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh