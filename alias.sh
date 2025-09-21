# Git aliases
unalias grh 2>/dev/null
grh() {
    git reset --hard "$1"
}
alias gcod='gco develop'
alias gcom='gco main'
alias grhd='grh origin/develop'
alias grhm='grh origin/main'

alias bat=batcat
alias fd=fdfind
