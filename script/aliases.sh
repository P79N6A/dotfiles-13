########################  alias  ##############################
# oh-my-zsh plugin common-aliases.zsh

alias j=z

alias zrc="vi $HOME/.zshrc"

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lAFh'    # size,show type,human readable
alias la='ls -lAFh'   # long list,show almost all,show type,human readable
alias lr='ls -tRFh'   # sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
alias ll='ls -l'      # long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

# http://www.lostsaloon.com/technology/how-to-sort-du-command-output-by-size-in-linux/
alias dudir="du -ahd1 | sort -h"

alias hexogd="hexo clean && hexo g -d && hexo clean"

alias py3="python3"
alias py2="python2"

alias shl="ssh hl"
alias slf="ssh lf"
alias ste="ssh ten"
alias sal="ssh ali"

alias rmff="rm -rf"

alias ping='ping -c 5'
alias path='print -l $path'
alias mkdir='mkdir -pv'
alias chx='chmod +x'

alias t='tail -f'

if [[ "$(uname)" == "Darwin" ]]; then
    alias rm='rmtrash'
fi
