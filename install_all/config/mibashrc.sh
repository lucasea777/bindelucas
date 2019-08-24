#echo "export PS1=\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
function inst() { 
    apt-get -y install "$*"; 
};
alias ccat='pygmentize -g -O style=colorful,linenos=1'
alias ccat2="~/workspace-go/bin/ccat --bg=dark"
alias keygen='node /home/luks/Downloads/gymkeygen/keygen_node.js'
alias jq-interactive='jid'
alias whoisusingthisfuckingport='sudo netstat -ltnp | grep $1'
#https://www.2daygeek.com/linux-scan-check-open-ports-using-netstat-ss-nmap/
alias nmap-all-open-ports='nmap 0.0.0.0 -p 1-65535'
function cdpymodule() {
    mydir=$(p 'import '$1'; '$1'.__file__');
    cd $(dirname $mydir);
}
function ly {
    myurl=$(imfly $@);
    mpv $myurl --no-video
}
function cless() {
    #~/workspace-go/bin/ccat --bg=dark --color always $@ | less -r
    pygmentize -g -O style=colorful,linenos=1 $@ | less -r
}
function o(){ 
ln -s $(readlink -f $1) /tmp/oklink
#okular /tmp/oklink
file /tmp/oklink
}
# Create a new directory and enter it
# function md() {
# 	mkdir -p "$@" && cd "$@"
# }
function notify() {
    if [[ $? -eq 0 ]]; then
        # no error
        notify-send '👍 Tiii!' --icon=dialog-info
        paplay /usr/sha*/soun*/fr*/st*/co*
    else
        notify-send '😨 Uppss!' --icon=dialog-error
        paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
    fi

}
function copylast() {
fc -ln 0 | tail -1 | tr '\n' ' ' | clipcopy
}

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
function update-vscode() {
    sudo echo "gratcie"&&
	wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && 
	sudo dpkg -i /tmp/code_latest_amd64.deb
}
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

function updir() {
    cd ..
    zle reset-prompt
}
function downdir() {
    cd $((pwd;dirs) | p \
        "p=input(); l=input(); \
         eu=lambda a: str(Path(a).expanduser()); \
         ([a for a in map(eu,l.split()) \
           if a.startswith(p) and len(a) > len(p)] + ['.'])[0]")
    zle reset-prompt
}
zle -N updir
zle -N downdir
bindkey '^j' updir
bindkey '^k' downdir

bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^H' backward-kill-word

zsh_wifi_signal(){
    # local signal=$(sudo /home/luks/bindelucas/openports)
    # sudo visudo
    # agregar a final: luks ALL=(ALL:ALL) NOPASSWD: /home/luks/bindelucas/openports
    echo $(sudo /home/luks/bindelucas/openports)
    # echo ""
    # local color='%F{yellow}'
    # echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
}

POWERLEVEL9K_CUSTOM_OPENPORTS="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_OPENPORTS_BACKGROUND="red"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs custom_openports vcs command_execution_time time)