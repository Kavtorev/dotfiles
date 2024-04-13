# AUTOCOMPLETION
# initialize autocompletion
autoload -U compinit && compinit
    
# enables the completion menu (allows TAB and arrow keys navigation between suggested commands)
zstyle ':completion:*' menu select

# Turn off the beep/bell sound in zsh
unsetopt BEEP

# History settings
export HISTFILE=~/.zsh_history

HISTSIZE=5000
HISTFILESIZE=10000
SAVEHIST=5000

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS

# --------- History settings

# Install zplug
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

# Initialize plugins
source ~/.zplug/init.zsh

# Declare plugins
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme, at:v4.6.0

zplug "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

zplug "plugins/git", from:oh-my-zsh

zplug "plugins/autojump", from:oh-my-zsh
# makes autojump functional
[ -f /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"

# Install and load plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load


SPACESHIP_GIT_EMAIL_COLOR="${SPACESHIP_GIT_EMAIL_COLOR="white"}"

spaceship_git_email() {
  spaceship::is_git || return

  local email

  email="$(git config user.email)"

  if [[ -n $email ]]; then
    spaceship::section::v4 \
      --color "$SPACESHIP_GIT_EMAIL_COLOR" \
      "$email"
  fi
}

SPACESHIP_RPROMPT_ORDER=(
    git_email
)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
