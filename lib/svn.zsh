# get the name of the branch we are on
function svn_prompt_info() {
  #ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  #ref=$(svn status -u 2> /dev/null) || return
  #echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  echo "$ZSH_THEME_SVN_PROMPT_PREFIX$(parse_svn_dirty)$ZSH_THEME_SVN_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_svn_dirty() {
  if [[ -n $(svn status -s 2> /dev/null) ]]; then
    echo "$ZSH_THEME_SVN_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_SVN_PROMPT_CLEAN"
  fi
}

# Get the status of the working tree
svn_prompt_status() {

  INDEX=$( svn status -u 2> /dev/null)
  STATUS=""

  if $(echo "$INDEX" | grep '^?' &> /dev/null); then
    STATUS="$ZSH_THEME_SVN_PROMPT_UNTRACKED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_SVN_PROMPT_ADDED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_SVN_PROMPT_MODIFIED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^AM' &> /dev/null); then
    STATUS="$ZSH_THEME_SVN_PROMPT_MODIFIED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^D' &> /dev/null); then
    STATUS="$ZSH_THEME_SVN_PROMPT_DELETED$STATUS"
  fi

  echo $STATUS
}
