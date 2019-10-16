#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias ls='ls -h --color=auto'
alias df='df -h'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ~='cd ~'
alias ff='find . -type f -name '

alias clear='clear -x'

# for displaying git branch in bash prompt
parse_git_branch() {
     git branch 2>/dev/null | grep '^*' | colrm 1 2
}


PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]:\[\033[35m\]\$(parse_git_branch)\[\033[m\] -> "
set -o vi
export EDITOR=vim

# music commands for easy manipulatin of spotify
alias play='playerctl play'
alias pause='playerctl pause'
alias next='playerctl next'
alias prev='playerctl previous'

# git aliases
alias gs='git status'

# alias for backing up dotfiles
alias config='git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# alias that opens a file with the default program that is assigned to its mimetype.
alias open='xdg-open'

# aliases for owl related tasks
alias owl='ssh paul@dev'
alias vsiron='code ~/owl/owlpractice/ironman/'
alias vsclinic='code ~/owl/locals/clinicportal/'
alias vsclient='code ~/owl/owlpractice/clientportal/'
alias ysl='cd ~/owl/locals/clinicportal/ && yarn start:paul'

# Move a js file to a ts file
function mvts () { \
    [ -z $1 ] && echo 'No file supplied' exit 0; \
    git mv $1 $(echo "$1" | sed 's/.js$/.ts/'); \
}

# Move a js file to a tsx file
function mvtsx () { \
    [ -z $1 ] && echo 'No file supplied' exit 0; \
    git mv $1 $(echo "$1" | sed 's/.js$/.tsx/'); \
}

# sourcing autojump script
source /etc/profile.d/autojump.bash 

# automatically cd into directories if just a path is given
shopt -s autocd

# pacman alias for updating
alias update="sudo pikaur -Syu"

source /usr/bin/virtualenvwrapper.sh

export TERM=xterm-color

# function for opening books as a background process
background() { xdg-open "$@" &>/dev/null & }

# get first branch that matches some string
change() { 
    git checkout $(git branch | grep $@ | head -n 1)
}

# https://github.com/brianm/venv
source ~/.config/venv.bash

# display a design quote of the day. Unfortunately API has gone down.
# python ~/.config/daily-design-quotes/quotes.py

# last branches that you checked out
alias brs="git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"

# syntax highlighting for less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

alias sourcebashrc="source ~/.bashrc"
alias vimbashrc="vim ~/.bashrc"

alias branchchanges="git show master..HEAD"
alias upush="git push -u origin HEAD"

# Docker stuff
alias lzd="lazydocker"
docker-attach() {
    docker exec -it $1 /bin/bash
}


eval "$(thefuck --alias)"

runjanus() {
    docker run \
        -p 80:80 \
        -p 443:443 \
        -p 7088:7088 \
        -p 8088:8088 \
        -p 8089:8089 \
        -p 10000-10200:10000-10200 \
        p25marti/janus-gateway-bionic
}
