function _fzf_git_commit () {
  local -r branch_prompt='Branch > '
  local -r all_prompt='All > '

  local -r git_log="git log --graph --color --format='%C(white)%h %C(green)%cs | %C(blue)%s%C(red)%d %C(yellow)[%an]'"
  local -r git_log_all="git log --all --graph --color --format='%C(white)%h %C(green)%cs | %C(blue)%s%C(red)%d %C(yellow)[%an]'"

  local -r get_hash="echo {} | grep -o '[a-f0-9]\{7\}' | sed -n '1p'"
  local -r git_show_summary="[[ \$($get_hash) != '' ]] && git show --abbrev-commit --compact-summary --color \$($get_hash)"
  local -r git_show_subshell=$(cat <<-EOF
    [[ \$($get_hash) != '' ]] && sh -c "git show --color \$($get_hash) | less -R"
EOF
  )

  local -r git_checkout="[[ \$($get_hash) != '' ]] && git checkout \$($get_hash)"

  local -r header_branch=$(cat <<-EOF
    > ENTER to display the diff with less
    > ALT-S to switch to All Commits mode
    > ALT-C to checkout the commit
EOF
  )

  local -r header_all=$(cat <<-EOF
    > ENTER to display the diff with less
    > ALT-S to switch to Branch Commits mode
EOF
  )

  local -r mode_all="change-prompt($all_prompt)+reload($git_log_all)+change-header($header_all)+unbind(alt-c)"
  local -r mode_branch="change-prompt($branch_prompt)+reload($git_log)+change-header($header_branch)+rebind(alt-c)"

  eval "$git_log" | fzf \
    --ansi \
    --reverse \
    --no-sort \
    --prompt="$branch_prompt" \
    --header-first \
    --header="$header_branch" \
    --preview="$git_show_summary" \
    --bind="enter:execute($git_show_subshell)" \
    --bind="alt-s:transform:[[ \$FZF_PROMPT =~ '$branch_prompt' ]] && echo '$mode_all' || echo '$mode_branch'" \
    --bind="alt-c:execute($git_checkout)+abort" \
    --bind='alt-p:toggle-preview' \
    --bind='alt-h:toggle-header'
}

