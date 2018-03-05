#echo "export PS1=\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
function inst() { 
    apt-get -y install "$*"; 
};
alias ccat='pygmentize -g -O style=colorful,linenos=1'

function onceinfile() { # eg: onceinfile 'LINE' 'ID' 'FILE'
    cat "$3" | grep -q "$2"
        if [[ ! $? -eq 0 ]]; then
        echo >> "$3"
        echo "$1"' '"$2" >> "$3"
    fi
}

# https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
# Color       #define       Value       RGB
# black     COLOR_BLACK       0     0, 0, 0
# red       COLOR_RED         1     max,0,0
# green     COLOR_GREEN       2     0,max,0
# yellow    COLOR_YELLOW      3     max,max,0
# blue      COLOR_BLUE        4     0,0,max
# magenta   COLOR_MAGENTA     5     max,0,max
# cyan      COLOR_CYAN        6     0,max,max
# white     COLOR_WHITE       7     max,max,max

function red() {
    echo "$(tput setaf 1)$(tput setab 7)$1$(tput sgr 0)"
}
function color() {
    #echo "$(tput setaf $1)$(tput setab 7)$2$(tput sgr 0)"
    echo "$(tput setaf $1)$2$(tput sgr 0)"
}
function ok() {
    color 3 "$1"
}

function err() {
    #color 1 "$1"
    echo "$(tput setaf 7)$(tput setab 1)$1$(tput sgr 0)"
}

function inf() {
    color 2 "$1"
}

function inline() {
    printf "$(tput setaf 2)$1$(tput sgr 0)"
}

function upd() {
    inf "updating...  "
    #apt-get update $1 &> /dev/null
    # https://unix.stackexchange.com/questions/175146/apt-get-update-exit-status
    if ! { sudo apt-get update $1 2>&1 || echo E: update failed; } | grep -q '^[WE]:'; then
        ok "update success"
    else
        err "error updating"
        exit
    fi
}

function addrepo() {
    inf "adding repo... "$1
    add-apt-repository -y $1 &> /dev/null #usar log?
    if [ ! $? -eq 0 ]; then
        err "error adding repo "$1
    fi
    inf "repo added"
}
