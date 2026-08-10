# Git aliases
unalias grh 2>/dev/null
grh() {
    git reset --hard "${1:-HEAD}"
}
alias gfp='gf -p'
alias gcod='gco $DEVELOP_BRANCH'
alias gcom='gco $MASTER_BRANCH'
alias grhd='grh origin/$DEVELOP_BRANCH'
alias grhm='grh origin/$MASTER_BRANCH'
alias gred='g rebase origin/$DEVELOP_BRANCH'
alias grem='g rebase origin/$MASTER_BRANCH'
alias gpo='g push -f origin $(gb --show-current)'
alias wip='g add . && g commit -m "$(gb --show-current): wip"'
#alias bat=batcat
#alias fd=fdfind
