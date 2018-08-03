# command aliases
source $HOME/dotfiles/bash/alias.sh
source $HOME/dotfiles/bash/git.sh

# プロンプト
WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
PS_USER="$GREEN\u@\h"
export PS1="${PS_USER}${WHITE}:${BLUE}\w${RED}\$(__git_ps1)${WHITE}\$ "

# read man file with vim
export MANPAGER="col -b -x|nvim -R -c 'set ft=man nolist nomod noma' -"

# editor setting
export EDITOR="/usr/local/bin/nvim"
export SEARCHER="hw"

export PATH="$HOME/dotfiles/bin:$PATH" 
# press ctrl-d 3times to exit
IGNOREEOF=3

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

err() { echo "$*" >&2; exit 1; }

# brew install z
. /usr/local/etc/profile.d/z.sh

#go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

peco-select-history() {
declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = ();  } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in;  }' | peco --query "$READLINE_LINE")
READLINE_LINE="$l"
READLINE_POINT=${#l}
} 
bind -x '"\C-r": peco-select-history'

# agで検索した結果から選択し、ファイルを開く https://qiita.com/umanoda/items/d55cf51a4bbf2bda7e03
# 名前はgrep + vim でgrevにした
function grev(){
  path=$($SEARCHER $* | peco | awk -F: '{printf  $1 " +" $2}'| sed -e 's/\+$//')
  if [ -n "$path" ]; then
    echo "$EDITOR $path"
    $EDITOR $path
  fi  
}
