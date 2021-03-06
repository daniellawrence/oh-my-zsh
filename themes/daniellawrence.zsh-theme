#-------------------------------------------------------------------
# WHO AM I ?: Solaris has  different path for whoami
#-------------------------------------------------------------------
case $( uname ) in
	Linux)	WHOAMI=$( whoami );;
	SunOS)	WHOAMI=$( /usr/ucb/whoami);;
esac
#-------------------------------------------------------------------
# Generic env
#-------------------------------------------------------------------
setopt prompt_subst
autoload colors zsh/terminfo

#-------------------------------------------------------------------
# Color shortcuts: Cleans up the them code
#-------------------------------------------------------------------
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
MAGENTA=$fg[magenta]
CYAN=$fg[cyan]
#------------------------------------------------------------------
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
MAGENTA_BOLD=$fg_bold[magenta]
CYAN_BOLD=$fg_bold[cyan]
#------------------------------------------------------------------
RESET_COLOR=$reset_color

#-------------------------------------------------------------------
# Modify Git prompt
#-------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX="git(%{$GREEN%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$RESET_COLOR%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED_BOLD%} ✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GREEN_BOLD%} ✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$GREEN%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$BLUE%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$RED%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$MAGENTA%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$YELLOW%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$CYAN%} ✭"

#-------------------------------------------------------------------
# Modify SVN prompt
#-------------------------------------------------------------------
ZSH_THEME_SVN_PROMPT_PREFIX="svn(%{$GREEN%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$RESET_COLOR%})"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$RED_BOLD%} ✖"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$GREEN_BOLD%} ✔"
ZSH_THEME_SVN_PROMPT_ADDED="%{$GREEN%} ✚"
ZSH_THEME_SVN_PROMPT_MODIFIED="%{$BLUE%} ✹"
ZSH_THEME_SVN_PROMPT_DELETED="%{$RED%} ✖"
ZSH_THEME_SVN_PROMPT_RENAMED="%{$MAGENTA]%} ➜"
ZSH_THEME_SVN_PROMPT_UNMERGED="%{$YELLOW]%} ═"
ZSH_THEME_SVN_PROMPT_UNTRACKED="%{$CYAN%} ✭"

#-------------------------------------------------------------------
# This will be useful when i forget what is what..
#-------------------------------------------------------------------
ZSH_THEME_LOGNAME="%n"
ZSH_THEME_HOSTNAME="%m"
ZSH_THEME_PWD="%~%u%"

#-------------------------------------------------------------------
# Prompt: !root
#-------------------------------------------------------------------
function user_prompt () {
	PROMPT='%{$BLUE_BOLD%}${ZSH_THEME_LOGNAME}@${ZSH_THEME_HOSTNAME}:${ZSH_THEME_PWD}{$RESET_COLOR%} $(git_prompt_info 2>/dev/null)$(svn_prompt_info 2>/dev/null)
%{$GREEN%}$ %{$RESET_COLOR%}'
}

#-------------------------------------------------------------------
# Prompt: root
#-------------------------------------------------------------------
function root_prompt () {
	PROMPT='%{$RED_BOLD%}${ZSH_THEME_LOGNAME}@${ZSH_THEME_HOSTNAME}:${ZSH_THEME_PWD}{$RESET_COLOR%} $(git_prompt_info 2>/dev/null)$(svn_prompt_info 2>/dev/null)
%{$GREEN%}# %{$RESET_COLOR%}'

}

#-------------------------------------------------------------------
# Prompt: root
#-------------------------------------------------------------------
function right_prompt () {
	RED_RC_ON_ERROR="%(?..%{$RED_BOLD%}%?%{$RESET_COLOR%})"
	TIME_HHMMSS="%*"
	RPROMPT="${RED_RC_ON_ERROR}${TIME_HHMMSS}"
}

#-------------------------------------------------------------------
# Prompt action: work out which prompt to call ( root or user )
#-------------------------------------------------------------------
if [[ "${WHOAMI}" == "root" ]];then
	root_prompt
else
	user_prompt
if

#-------------------------------------------------------------------
# Prompt action: Every user gets the right prompt ( always looks the same )
#-------------------------------------------------------------------
right_prompt
