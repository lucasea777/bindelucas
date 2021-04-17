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
alias o="xdg-open"
alias gds='git diff --staged'
alias gap='git add -p'
alias grp='git reset -p'
alias gd='git diff'
alias gl='git log'
alias gs='git status'
alias gsh='git show'
alias gc='git commit'
alias gcm='git commit -m'
alias bn='git rev-parse --abbrev-ref HEAD'
alias ga="git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git add"
alias awsoff="mv ~/.aws/credentials ~/.aws/credentials.off"
alias awson="mv ~/.aws/credentials.off ~/.aws/credentials"
alias smv="mv -nv"
# https://spin.atomicobject.com/2018/04/05/fuzzy-find-git-add/
function n() {
    if [[ $? -eq 0 ]]; then
        /usr/bin/ffplay -nodisp -autoexit $HOME/Music/tuturu_1.mp3 >/dev/null 2>&1
    else
        /usr/bin/paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
    fi
}
namingthingsishard () { echo; ls -halt; zle redisplay;}
zle -N namingthingsishard
bindkey '^l' namingthingsishard
function ipa() {
    curl https://api.dictionaryapi.dev/api/v1/entries/en/$1 -s -o - | jq -r '.[0].phonetics[].text'
}
function cdpymodule() {
    mydir=$(p 'import '$1'; '$1'.__file__');
    cd $(dirname $mydir);
}
function ofzf() {
    local mypath=$(find $@ | fzf --preview 'bat --style=numbers --color=always {}');
    echo $mypath;
    o $mypath > /dev/null 2>&1;
}
function sudop() {
    sudo -S --prompt ' ' <<< `cat $HOME/binprivate/db/miqueridacontraes` $@
}
function ly {
    myurl=$(imfly $@);
    mpv $myurl --no-video
}
function lyv {
    myurl=$(imfly $@);
    mpv $myurl
}
function adbwifi {
    adb tcpip 5555 && adb connect `getip g4`:5555;
}
function sshliv {
    sshpass -f $HOME/binprivate/db/miqueridacontraes ssh edu@`getip living_eth` "$@"
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
function mdcd() {
	mkdir -p "$@" && cd "$@"
}
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
# https://stackoverflow.com/questions/44258585/how-to-insert-text-into-input-prompt-using-zsh-zle
addText () {
    # text_to_add="textGoesHere"
    # RBUFFER=${text_to_add}${RBUFFER}
    eval `python3 $HOME/bindelucas/install_all/config/instantsnippets.py`
}
# https://unix.stackexchange.com/questions/373795/bindkey-to-execute-command-zsh
bindkey -s "^[l" 'ls^M'
bindkey -s "^[L" 'ls -halt ^M'
zle -N addText
bindkey '^a' addText
zle -N updir
zle -N downdir
bindkey '^j' updir
bindkey '^k' downdir

# bindkey -M emacs '^[[3;5~' kill-word
# bindkey -M emacs '^H' backward-kill-word

zsh_wifi_signal(){
    # local signal=$(sudo /home/luks/bindelucas/openports)
    # sudo visudo
    # agregar a final: luks ALL=(ALL:ALL) NOPASSWD: /home/luks/bindelucas/openports
    echo $(sudo /home/luks/bindelucas/openports)
    # echo ""
    # local color='%F{yellow}'
    # echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
}

POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true
POWERLEVEL9K_CUSTOM_OPENPORTS="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_OPENPORTS_BACKGROUND="red"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv background_jobs custom_openports vcs command_execution_time time)

## pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
