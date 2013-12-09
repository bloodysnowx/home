bindkey -e # emacs key bind
export LANG=ja_JP.UTF-8
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

if [ -f ~/.zsh_func ] ; then
. ~/.zsh_func
fi
