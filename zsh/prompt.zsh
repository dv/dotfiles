autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

autoload local_ruby_version global_ruby_version

local_ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi
}

global_ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv global | awk '{print $1}')"
  fi
}

rb_prompt() {
  local_version=$(local_ruby_version)

  if [[ -n $local_version ]]
  then
    if [[ $local_version == $(global_ruby_version) ]]
    then
      echo "%{$FG[107]%}$local_version%{$reset_color%} "
    else
      echo "%{$FG[118]%}$local_version%{$reset_color%} "
    fi
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

export PROMPT=$'in $(directory_name) $(git_dirty)$(need_push)\n› '
export RPROMPT=$'$(rb_prompt)'

# Gets run at every prompt
precmd() {
  title "zsh" "%m" "%55<...<%~" # See zsh/window.zsh
}
