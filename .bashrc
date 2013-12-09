alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1="[\W]\$ "
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias ruby='/opt/local/bin/ruby1.9'
export SVN_EDITOR=emacs.bak
export PATH=$PATH:~/bin:/opt/local/bin
export JSTESTDRIVER_HOME=~/bin

if [ "$TERM" = "screen" ]; then
    # ディレクトリ名を表示する場合 
    # PS1='\033k\W\033\134[\[\033[33m\]Screen\[\033[0m\]][\u@\[\033[36m\]\h\[\033[0m\] \W]\\$ '
    PS1='\033k\W\033\134[\[\033[33m\]Screen\[\033[0m\]][\W]\\$ '
else
    # 通常のプロンプト
    PROMPT_COMMAND='echo -ne "\033]0;KTerm on ${USER}@${HOSTNAME%%.*} :${PWD/#$HOME/~}\007"'
    PS1='[\W]\$ '
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# eval "$(rbenv init -)"
