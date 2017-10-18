# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kohei"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH=$PATH:"/usr/local/Cellar/httpd/2.2.26/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"
#export PATH=/usr/local/Cellar/httpd/2.2.26/sbin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

export PATH="$(brew --prefix)/bin:$PATH"
export PATH=$PATH:/Users/kohei/phalcon-tools
export PTOOLSPATH=/Users/kohei/phalcon-tools
#node.js用環境変数
#export PATH=$PATH:/usr/local/share/npm/bin
#export NODE_PATH=/usr/local/lib/node_modules

#vi,vimコマンド時に、$HOMEの.vimrcを読み込む
#alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi=vim
#alias vimdiff=/Applications/MacVim.app/Contents/MacOS/vimdiff
#alias view=/Applications/MacVim.app/Contents/MacOS/view

#php55
PATH="/usr/local/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)bin:$PATH"

# pythonコマンド時にpython3に
alias python=/usr/local/bin/python3

#補完
autoload -U compinit
compinit

#プロンプトカラー表示を有効
autoload -U colors
colors

#履歴
## ヒストリを保存するファイル
HISTFILE=~/.zsh_history
## メモリ上のヒストリ数。
## 大きな数を指定してすべてのヒストリを保存するようにしている。
HISTSIZE=10000000
## 保存するヒストリ数
SAVEHIST=100000000
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups

## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
setopt no_flow_control
## ヒストリに追加されるコマンド行が古いモノと同じなら古いモノを削除
setopt hist_ignore_all_dups

# viキーバインド
bindkey -e

#ディレクトリ名でcd
setopt auto_cd

#cdで移動してもpushdと同じようにディレクトリスタックに追加
setopt auto_pushd
#カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
#移動先を検索するリスト
cdpath=(~)
#ディレクトリが変わったらディレクトリスタックを表示
chpwd_functions=($chpwd_functions dirs)

setopt ignore_eof

alias ll="ls -lh"
alias la="ls -al"

## グローバルエイリアス
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'
alias -g C='| pdcopy'
alias -g P='| pbpaste'

## ファイル操作を確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## 完全削除
alias rr='command rm -rf'

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$HOME/.rbenv/shims:$PATH"
export PATH=/Users/mizobata/.nodebrew/current/bin:/usr/local/opt/php55bin:/usr/local/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/mizobata/go/bin://Users/mizobata/bin
export PATH="/usr/local/sbin:$PATH"

source $HOME/.phpbrew/bashrc
