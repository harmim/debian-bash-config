# If not running interactively, don't do anything.
case $- in
  *i*) ;;
    *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history,
# see bash(1) for more options.
HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it.
shopt -s histappend
# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=1000
HISTFILESIZE=2000
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi
# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac
# A colored prompt, if the terminal has the capability.
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
  color_prompt=yes
else
  color_prompt=
fi
# Git prompt.
if [ -f ~/.gitcfg/git-prompt.sh ]; then
  source ~/.gitcfg/git-prompt.sh
  git_prompt=yes
fi
if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]${git_prompt:+\[\033[35m\]$(__git_ps1)\[\033[00m\]}\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w${git_prompt:+$(__git_ps1)}\$ '
fi
unset color_prompt
# If this is an xterm set the title to user@host:dir.
case "$TERM" in
  xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\w\a\]$PS1" ;;
             *) ;;
esac

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some more ls aliases.
alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'

# Include aliases.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Include symlinks.
if [ -f ~/.bash_symlinks ]; then
  . ~/.bash_symlinks
fi

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# This solvs the backspace probleam '^?'.
stty erase '^?'

# Colored man pages.
export LESS_TERMCAP_mb=$(printf '\e[01;31m')
export LESS_TERMCAP_md=$(printf '\e[01;35m')
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_so=$(printf '\e[01;33m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_us=$(printf '\e[04;36m')

# Completion using F1.
bind 'TAB:complete'
bind '"\eOP":menu-complete' # F1

# Fix coloures on macOS.
#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

# Brew stuff.
#if type brew &> /dev/null; then
#  HOMEBREW_PREFIX="$(brew --prefix)"
#
#  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
#    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
#  else
#    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
#      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
#    done
#  fi
#
#  if [ -d "${HOMEBREW_PREFIX}/opt/curl/bin" ]; then
#    PATH="${HOMEBREW_PREFIX}/opt/curl/bin:$PATH"
#  fi
#
#  if [ -d "${HOMEBREW_PREFIX}/opt/sqlite/bin" ]; then
#    PATH="${HOMEBREW_PREFIX}/opt/sqlite/bin:$PATH"
#  fi
#
#  if [ -d "${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin" ]; then
#    PATH="${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin:$PATH"
#  fi
#
#  if [ -d "${HOMEBREW_PREFIX}/opt/openssh/bin" ]; then
#    PATH="${HOMEBREW_PREFIX}/opt/openssh/bin:$PATH"
#  fi
#fi

# Hide deprecated bash warning on macOS.
#export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH
