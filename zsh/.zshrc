# History settings
export HISTFILE=~/.zsh_history

HISTSIZE=5000
HISTFILESIZE=10000

# Handling duplicate commands
setopt HIST_IGNORE_ALL_DUPS

# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# --------- History settings

# Install zplug
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

# Initialize plugins
source ~/.zplug/init.zsh

# Declare plugins
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/git", from:oh-my-zsh
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
