# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias ls='ls -h --color=auto'
alias df='df -h'
alias ff='find . -type f -name '

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias clear='clear -x'

alias play='playerctl play'
alias pause='playerctl pause'
alias next='playerctl next'
alias prev='playerctl previous'

alias open='xdg-open'
alias weather='curl wttr.in/toronto'

alias update="sudo pacman -Syu"

alias config='git --git-dir=$HOME/.myconf/ --work-tree=$HOME' # alias for backing up dotfiles
alias gs='git status'
alias brs="git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
alias changes="git show master..HEAD"
alias upush="git push -u origin HEAD"

alias owl='ssh owl'
alias flayer='ssh flayer'
alias vsiron='code ~/owl/owlpractice/ironman/'
alias vsclinic='code ~/owl/locals/clinicportal/'
alias vsclient='code ~/owl/owlpractice/clientportal/'
alias ysl='cd ~/owl/locals/clinicportal/ && yarn start:paul'
alias book='yarn workspace frontend start:storybook'
alias startvideo='ANNOUNCE_IP=99.252.206.33 WEBSOCKET_ENDPOINT=wss://api-video-paul.owlpractice.ca API_ENDPOINT=https://api-video-paul.owlpractice.ca yarn start:all'

set -o vi
export EDITOR=vim
export TERM=xterm-color

source /etc/profile.d/autojump.bash # sourcing autojump script
source ~/.config/venv.bash # https://github.com/brianm/venv
source /usr/share/nvm/init-nvm.sh # source nvm

# function for opening books as a background process
background() { xdg-open "$@" &>/dev/null & }

# get first branch that matches some string
change() { 
    git checkout $(git branch | grep $@ | head -n 1)
}

notify() {
    eval $@; dunstify -u critical "Task is done" "$*"
}

parse_git_branch() {
     git branch 2>/dev/null | grep '^*' | colrm 1 2
}

sync() {
    while true; do
        rsync \
            -avz \
            -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /home/chance/.ssh/id_rsa_temp" \
            --progress \
            --exclude 'node_modules' \
            --exclude 'frontend/node_modules' \
            --exclude 'backend/node_modules' \
            /home/chance/git/videoexchangeserver \
            paul@dev:/home/paul/git/videoexchangeserver-sync;
        sleep 1;
    done
}

phew () {
    echo "dunstify -u critical 'Phew!' '$1'" | at ${@:2}
}

PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]:\[\033[35m\]\$(parse_git_branch)\[\033[m\] -> "

