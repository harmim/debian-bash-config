#!/usr/bin/env bash

# Brew
brew update
brew outdated
brew upgrade
brew cleanup
brew outdated
brew doctor

# Rust
rustup update
rustup check

# Python
pip3 install --upgrade pip
pip3 check

# Opam
opam update
opam upgrade
