export LANG=en_US.UTF-8
# sources source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export TERM=xterm-256color
export ZSH="/home/lidor/.oh-my-zsh"
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:~/.local/bin/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# laziness
inst() {
    distro=$(grep ^ID= /etc/os-release | cut -f2 -d=)

    case "$distro" in
        "arch") sudo pacman -S "$@";;
        "debian" | "ubuntu") sudo apt install "$@" ;;
    esac
}

uninst() {
    distro=$(grep ^ID= /etc/os-release | cut -f2 -d=)

    case "$distro" in
        "arch") sudo pacman -Rsn "$@" ;;
        "debian" | "ubuntu") sudo apt uninstall "$@" ;;
    esac
}

update() {
    distro=$(grep ^ID= /etc/os-release | cut -f2 -d=)

    case "$distro" in
        "arch") sudo pacman -Syu "$@";;
        "debian" | "ubuntu") sudo apt update && sudo apt upgrade ;;
    esac
}

alias fk='sudo $(fc -ln -1)'
alias fuck='sudo $(fc -ln -1)'
alias please='sudo $(fc -ln -1)'

# ls
alias ls="$(test -f /bin/lsd && echo lsd || echo ls)"
alias l='ls -l --color=always | grep -vi "c\?make[^lists.txt]"'
alias lf='ls -la --color=auto'
alias ll='ls -la --color=auto'

# Git
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gf='git fetch'
alias gr='git fetch && git rebase'

# Bash aliases
alias vim="$(test -f /usr/bin/nvim && echo nvim || echo vim)"
export EDITOR=nvim
alias bashrc="$EDITOR ~/.bashrc"
alias zshrc="$EDITOR ~/.zshrc"
alias i3config="$EDITOR ~/.config/i3/config"

# Random stuff
alias view="$EDITOR -M"                       # Use vim (-M stands for nomodifiable) for view
alias xclip='xclip -selection clipboard'  # Use clipboard in xclip
alias watch='watch '                      # So it will support custom aliases in watch
export LESS='-R -F'                       # -F makes less not open in a pager if the text can fit in one screen
alias neofetch='neofetch --ascii ~/.config/neofetch/shrekscii --ascii_colors 2 5 6 1'  # Display shrekscii in neofetch

# my common typos
alias clear='clear && ls -l --color=always | grep -viE "c?make"'
alias clera='\clear && ls -l --color=always | grep -viE "c?make"'
alias claer='\clear && ls -l --color=always | grep -viE "c?make"'
alias cler='\clear && ls -l --color=always | grep -viE "c?make"'

mcdir() {
    mkdir -p "$1" && cd "$1"
}

# Common mistakes related to cd (e.g typing 'cd.` (aka `cd. .`))
alias cd..='cd ..'
cd.() { cd .. }

# alias ls='l --color=auto'
alias diff='diff --color -y --suppress-common-lines'
alias cp='cp -i' # Ask for confirmation before overwriting

# start bicon for Biderctional text
# alias exit='kill -9 $(ps -p $PPID -o ppid=)'
# if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
    # bicon.bin
# fi

# SSH PAGAYA VM'S
vm() {
    if [ "$#" -lt 2 ]; then
        echo "Give at least two arguments"
        return 1
    else
        VM=research-$2
        GROUP=${3:-"research-remote"}
        case "$1" in
            "start") az vm start -g $GROUP -n $VM ;;
            "stop") az vm deallocate -g $GROUP -n $VM ;;
        esac
    fi
}

alias start="vm start"
alias stop="vm stop"
alias list_vms="az vm list -g research-remote --query '[].name' --output tsv | sort -V"
alias list_active_vms="az vm list -g research-remote -d --query \"[?powerState == 'VM running'].name\" --output tsv | sort -V"
alias list_inactive_vms="az vm list -g research-remote -d --query \"[?powerState != 'VM running'].name\" --output tsv | sort -V"
alias list_unattached_disks="az disk list -g research-remote --query \"[?diskState == 'Unattached'].name\" --output tsv | sort -V"

alias activate=". $(test -d './.venv' && echo './.venv' || echo './venv')/bin/activate"

if [ -d ~/Work/GitHub/ ]; then
    cd ~/Work/GitHub/
    mkdir /tmp/bash_aliases_init &> /dev/null
    FILE=$(mktemp -p /tmp/bash_aliases_init/)
    echo "test" > $FILE

    { echo -e "alias github='cd ~/Work/GitHub/'" && echo "github_path=~/Work/GitHub/" && echo; } > $FILE && \
    for dir in * ; do
        if [ -d "$dir" ]; then
            echo "alias $dir='cd ~/Work/GitHub/$dir && activate 2> /dev/null'"
            echo "${dir}_path=~/Work/GitHub/$dir"
            echo
        fi
    done >> $FILE && \
    . $FILE &> /dev/null

    FILE=""
    rm -r /tmp/bash_aliases_init &> /dev/null 
    popd
fi > /dev/null

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

fatties() {
    ps axo rss,comm,pid \
        | awk '{ proc_list[$2]++; proc_list[$2 "," 1] += $1; } \
    END { for (proc in proc_list) { printf("%d\t%s\n", \
        proc_list[proc "," 1],proc); }}' | sort -n | tail -n 10 | sort -rn \
        | awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
}

alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

colors() {
    for i in {0..255} ; do
        printf "${i}:\t\x1b[38;5;${i}mHello, World!\033[0m\n"
    done
}

shellcodes() {
    objdump -d $1 -M intel | grep '[0-9a-f]:' | grep -v 'file' | cut -f2 -d: | cut -f1-6 -d \  | sed 's/\(^\s\+\|\s\+$\)//g' | sed 's/\s\+/ /g' | paste -d ' ' -s | sed 's/\(^\| \)/\\x/g' | tr -d '\n'
}

# eval `ssh-agent -s` &> /dev/null && ssh-add ~/.ssh/github &> /dev/null

disas_func() {
    objdump -d $1 -M intel | awk -F'\n' -v RS='\n\n' "/<$2>:/"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias reboot='sudo /home/lidor/daemons/fast_reboot.sh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
