#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/lidor/bin

source '/home/lidor/lib/azure-cli/az.completion'
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
