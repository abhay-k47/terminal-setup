function _fzf_git_branch() {
  local -r git_branches="git branch --all --color --format=$'%(HEAD) %(color:yellow)%(refname:short)'"
  local -r get_selected_branch='echo {} | sed "s/^[* ]*//" | awk "{print \$1}"'
  local -r git_log="git log \$($get_selected_branch) --graph --color --format='%C(white)%h %C(green)%cs | %C(blue)%s%C(red)%d %C(yellow)[%an]'"
  local -r git_diff_subshell=$(cat <<-EOF
    [[ \$($get_selected_branch) != '' ]] && sh -c "git diff --color \$($get_selected_branch)..$(git branch --show-current) | less -R"
EOF
  )
  local -r help=$(cat <<-EOF
  > ENTER to open diff with current * branch
  > ALT-S to switch the branch
  > ALT-M to merge with current * branch
  > ALT-R to rebase with current * branch
EOF
  )

  eval "$git_branches" \
  | fzf \
    --ansi \
    --reverse \
    --no-sort \
    --preview-label '[ Commits ]' \
    --preview "$git_log" \
    --header-first \
    --header="$help" \
    --bind="alt-s:execute(git switch \$($get_selected_branch))+abort" \
    --bind="alt-m:execute(git merge \$($get_selected_branch))+abort" \
    --bind="alt-r:execute(git rebase \$($get_selected_branch))+abort" \
    --bind="enter:execute($git_diff_subshell)" \
    --bind='alt-p:toggle-preview' \
    --bind='alt-h:toggle-header'
}

