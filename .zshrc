# Created by Guest4242.xml for 5.9

# check for uhhhhhhhhhhhhh root access so in case if it is itll do # instead of $
if [[ $EUID -eq 0 ]]; then
    PS1='[%n@%m %1~]# '
else
    PS1='[%n@%m %1~]$ '
fi
# random welcome msg
WELCOME_MSGS=(
	"howdy, $USER"
	"welcome back to zsh, $USER.\nwhat are we gonna do today?"
	"sup"
	"ULTIMATE H4XX0R SHELL V0.1\nKNOCK KNOCK, NEO.\nTHE MATRIX HAS YOU."
	"TECHNOBLADE NEVER DIES"
	"'zsh is better than bash' - Guest4242.xml"
	"i use arch btw"
	"what"
	"'THERE IS NO FREE ENERGY' - ElectroBOOM"
	"hello, $USER"
	"zsh $ZSH_VERSION (x86_64-unknown-linux-gnu)\nRunning on kernel $(uname -r)\nModifications: cooler-zshrc by Guest4242.xml"
	"WELCOME TO THE MATRIX"
)
RANDOM_INDEX=$((RANDOM % ${#WELCOME_MSGS[@]}))
echo -e "${WELCOME_MSGS[$RANDOM_INDEX]}"
echo " "
# custom commands..maybe
alias ll='ls -la'
alias gs='git status'
alias gp='git pull'
alias gd='git diff'
alias gc='git commit -m'
alias gco='git checkout'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias path='echo -e ${PATH//:/\\n}'
# colored output for ls
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
fi
# some interesting tweaks
setopt autocd             # cd into directories without typing cd
setopt correct           # autocorrect typos in commands
setopt hist_ignore_dups  # ignore duplicate commands in history
setopt hist_ignore_all_dups # ignore all duplicates in history
setopt share_history     # share history across all sessions
setopt extended_glob     # enable extended globbing
setopt prompt_subst      # enable prompt substitution
setopt auto_pushd        # automatically pushd when using cd
setopt pushd_ignore_dups # ignore duplicates in the directory stack
setopt no_beep           # disable terminal beep
# enable command auto-suggestions based on history
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# enable syntax highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# set history file and size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# load nvm if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# pipx will now become as pip in case if youre tired from doing stuff like pacman -S python-mylibrarylol
if command -v pipx &> /dev/null; then
    export PATH="$HOME/.local/bin:$PATH"
    alias pip='pipx'
fi
# more useful tweaks
# enable bracketed paste mode to avoid messing up the terminal when pasting
if [[ "$TERM" != "dumb" ]]; then
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
fi

# whoa, youve made it to the end of this file, cool
# i made this because regular zshrc is boring, it just has nothing in it except that comment in the first line
# have a nice day dude :D
# - Guest4242.xml
