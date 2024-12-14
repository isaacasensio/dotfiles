if [[ -f "/usr/local/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/usr/local/bin/brew shellenv)"
fi

TERM="xterm-256color"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catppuccin_mocha.omp.json)"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Customizations
[[ ! -f ~/.aliases ]] || source ~/.aliases
[[ ! -f ~/.dockerfunc ]] || source ~/.dockerfunc
[[ ! -f ~/.functions ]] || source ~/.functions
[[ ! -f ~/.vagrantfunc ]] || source ~/.vagrantfunc

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export EDITOR="nvim"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# sketchybar
# This will update the brew package count after running a brew upgrade, brew
# update or brew outdated command
# Personally I added "list" and "install", and everything that is after but
# that's just a personal preference.
# That way sketchybar updates when I run those commands as well
if command -v sketchybar &>/dev/null; then

  # When the zshrc file is ran, reload sketchybar, in case the theme was
  # switched
  sketchybar --reload

  # Define a custom 'brew' function to wrap the Homebrew command.
  function brew() {
    # Execute the original Homebrew command with all passed arguments.
    command brew "$@"
    # Check if the command includes "upgrade", "update", or "outdated".
    if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]] || [[ $* =~ "list" ]] || [[ $* =~ "install" ]] || [[ $* =~ "uninstall" ]] || [[ $* =~ "bundle" ]] || [[ $* =~ "doctor" ]] || [[ $* =~ "info" ]] || [[ $* =~ "cleanup" ]]; then
      # If so, notify SketchyBar to trigger a custom action.
      sketchybar --trigger brew_update
    fi
  }
fi