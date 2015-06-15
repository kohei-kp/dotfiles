# 言語設定
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export LANGUAGE=$LANG
export TZ=JST-9

path=( # システム用
    /usr/local/opt/coreutils/libexec/gnubin(N-/)
    /usr/local/bin(N-/)
    /bin(N-/)
    # 自分用
    /$HOME/bin(N-/)
    /$HOME/python(N-/)
    # システム用
    /usr/bin(N-)
    /usr/sbin(N-)
    /sbin(N-/))

typeset -U path
