function _fzf_git_file () {
  local -r help=$(cat <<-EOF
    > ALT-S to switch between Add Mode and Reset mode
    > ENTER to add or reset file
    > ALT-E to open files in your editor
    > ALT-T for status preview | ALT-D for diff preview
    > ALT-C to commit | ALT-A to append to the last commit
EOF
  )

  local -r prompt_add="Add > "
  local -r prompt_reset="Reset > "

  local -r git_root_dir=$(git rev-parse --show-toplevel)
  local -r git_unstaged_files="git ls-files --modified --deleted --other --exclude-standard --deduplicate $git_root_dir"

  local git_staged_files='git status --short | grep "^[A-Z]" | awk "{print \$NF}"'

  local -r enter_cmd="[[ \$FZF_PROMPT =~ '$prompt_add' ]] && git add {+} || git restore --staged {+}"

  local -r preview_status_label="[ Status ]"
  local -r preview_status="git status --short"
  local -r preview_diff_label="[ Diff ]"
  local -r preview_diff="([[ \$FZF_PROMPT =~ '$prompt_add' ]] && git diff --color=always {} || git diff --staged --color=always {}) | sed '1,4d'"

  local -r mode_reset="change-prompt($prompt_reset)+reload($git_staged_files)"
  local -r mode_add="change-prompt($prompt_add)+reload($git_unstaged_files)"

  eval "$git_unstaged_files" \
  | fzf \
    --multi \
    --reverse \
    --no-sort \
    --prompt="$prompt_add" \
    --preview-label="$preview_status_label" \
    --preview="$preview_status" \
    --header-first \
    --header "$help" \
    --bind="alt-t:change-preview-label($preview_status_label)" \
    --bind="alt-t:+change-preview($preview_status)" \
    --bind="alt-d:change-preview-label($preview_diff_label)" \
    --bind="alt-d:+change-preview($preview_diff)" \
    --bind="alt-s:transform:[[ \$FZF_PROMPT =~ '$prompt_add' ]] && echo '$mode_reset' || echo '$mode_add'" \
    --bind="enter:execute($enter_cmd)" \
    --bind="enter:+reload([[ \$FZF_PROMPT =~ '$prompt_add' ]] && $git_unstaged_files || $git_staged_files)" \
    --bind="enter:+refresh-preview" \
    --bind='alt-c:execute(git commit)+abort' \
    --bind='alt-a:execute(git commit --amend)+abort' \
    --bind='alt-e:execute(${EDITOR:-nvim} {+})' \
    --bind='alt-p:toggle-preview' \
    --bind='alt-h:toggle-header'
}

