# setup brew
#eval "$(/opt/homebrew/bin/brew shellenv)"

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user/local/sbin if it exists
if [ -d /usr/local/sbin ]; then
  PATH="/usr/local/sbin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Rust
#if [ -f "$HOME/.cargo/env" ]; then
#  . "$HOME/.cargo/env"
#fi

export PATH
