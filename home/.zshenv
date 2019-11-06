# 言語設定
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export LANGUAGE=$LANG
export TZ=JST-9
export GOPATH=$HOME/go
export EDITOR=vim
path=( # システム用
    /usr/local/opt/coreutils/libexec/gnubin(N-/)
    /usr/local/bin(N-/)
    /bin(N-/)
    $GOPATH/bin(N-/)
    /usr/local/Cellar/httpd/2.2.27/sbin(N-/)
    # 自分用
    /$HOME/bin(N-/)
    /$HOME/python(N-/)
    /$HOME/.nodebrew/current/bin(N-/)
    # システム用
    /usr/bin(N-)
    /usr/sbin(N-)
    /sbin(N-/))

typeset -U path
