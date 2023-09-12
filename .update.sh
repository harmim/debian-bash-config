#!/usr/bin/env bash

set -x

function exists { command -v "$1" &> /dev/null; }

if exists brew; then
  brew update
  brew outdated
  brew upgrade
  brew outdated
  brew cleanup --prune=all
  brew doctor
fi

if exists apt-get; then
  sudo apt update -y
  apt list --upgradable
  sudo apt upgrade -y
  apt list --upgradable
  sudo apt autoremove -y
  sudo apt clean -y
fi

if exists rustup; then
  rustup update
  rustup check
fi

if exists pip3; then
  pip3 install -U pip
  pip3 check
  pip3 cache purge
fi
