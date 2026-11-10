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

cdw() {
    if [ $# -ne 1 ]; then
        echo "Usage: cd_worktree <branch>" >&2
        return 1
    fi
    local worktree_path
    worktree_path="$(git worktree list | grep -F "$1" | awk '{print $1}')"
    if [ -n "$worktree_path" ]; then
        cd "$worktree_path"
    else
        echo "Cannot find path for branch '$1'" >&2
        return 1
    fi
}
if [ -n "${ZSH_VERSION:-}" ]; then
    _cdw_comp() {
        local -a branches
        local line
        while IFS= read -r line; do
            [[ "$line" == 'branch refs/heads/'* ]] && branches+=("${line#branch refs/heads/}")
        done < <(git worktree list --porcelain 2>/dev/null)
        _describe 'worktree branch' branches
    }
    compdef _cdw_comp cdw
elif [ -n "${BASH_VERSION:-}" ]; then
    _cdw_comp() {
        local cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=($(compgen -W "$(
            git worktree list --porcelain | sed -n 's|^branch refs/heads/||p'
        )" -- "$cur"))
    }
    complete -F _cdw_comp cdw
fi

#alias bat=batcat
#alias fd=fdfind
