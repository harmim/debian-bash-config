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
  sudo apt-get update -y
  apt-get list --upgradable
  sudo apt-get upgrade -y
  apt-get list --upgradable
  sudo apt-get autoremove
  sudo apt-get clean
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

if exists opam; then
  opam update -y
  opam upgrade -y
  opam clean -y
fi
