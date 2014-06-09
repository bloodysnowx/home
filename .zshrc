fpath=( ${fpath})
bindkey -e # emacs key bind
export LANG=ja_JP.UTF-8
export ANDROID_HOME=/Applications/Android\ Studio.app/sdk
export ANDROID_NDK_ROOT=/usr/ndk
PATH=/usr/activator:/usr/scala/bin:/usr/play:/usr/ndk:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH:~/src/mosquitto-1.2.3/client
autoload -U compinit # auto complete
compinit
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed

autoload predict-on
# predict-on

alias gitlogcount='git log --date=short --pretty=format:'\''%cd %an'\'' |uniq -c'
alias ls='ls -G'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
export PATH=$PATH:~/bin:/opt/local/bin
export JSTESTDRIVER_HOME=~/bin

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s gz=gzcat
alias -s tbz=bzcat
alias -s bz2=bzcat

# alias emacs="open -a Emacs"
alias -s java=emacs
alias -s c=emacs
alias -s h=emacs
alias -s C=emacs
alias -s cpp=emacs
# alias -s sh=emacs
alias -s txt=emacs
alias -s xml=emacs

alias firefox="open -a Firefox"
alias -s html=firefox
alias -s xhtml=firefox

alias safari="open -a Safari"
alias preview="open -a Preview"
alias -s gif=preview
alias -s jpg=preview
alias -s jpeg=preview
alias -s png=preview
alias -s bmp=preview

alias -s exe=mono

if [ -f ~/.zsh_func ] ; then
. ~/.zsh_func
fi

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
    local name st color gitdir action
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
    if [[ -z $name ]]; then
        return
    fi
 
    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
 
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=%F{green}
    elif [[ -n `echo "$st" | grep "^no changes added"` ]]; then
        color=%F{yellow}
    elif [[ -n `echo "$st" | grep "^# Changes to be committed"` ]]; then
        color=%B%F{red}
    else
        color=%F{red}
    fi
 
    echo "$color$name$action%f%b "
}

# PCRE 互換の正規表現を使う
# setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`%~]'

alias gst='git status -s -b'
