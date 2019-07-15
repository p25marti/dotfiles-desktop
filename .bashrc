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
alias ...="cd ../../.."
alias ...="cd ../../../.."

alias ~='cd ~'
alias ff='find . -type f -name '

# for displaying git branch in bash prompt
parse_git_branch() {
     git branch 2>/dev/null | grep '^*' | colrm 1 2
}


PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]:\[\033[35m\]\$(parse_git_branch)\[\033[m\]\$ "
set -o vi

export EDITOR=vim

# music commands for easy manipulatin of spotify
alias play='playerctl play'
alias pause='playerctl pause'
alias next='playerctl next'
alias prev='playerctl previous'

# git aliases
alias gs='git status'

# iex alias for mix projets (elixir tool)
alias iexs='iex -S mix'
alias mixc='mix compile'

# alias for backing up dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

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

# https://github.com/brianm/venv
source ~/.config/venv.bash
