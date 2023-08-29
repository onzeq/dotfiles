#!/bin/bash

# stow scripts in custom oh-my-zsh/custom
stow -t $HOME/.config/oh-my-zsh --adopt -v oh-my-zsh
stow -t $HOME --adopt -v zsh
