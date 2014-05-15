#!/usr/bin/env zsh
setopt EXTENDED_GLOB
dotfiles_directory=${1:-${ZDOTDIR:-$HOME}/dotfiles}

for preztofile in "$dotfiles_directory"/zprezto/^README.md(.N); do
  rm -rfv ".${preztofile:t}"
  ln -sfv "$preztofile" "${ZDOTDIR:-$HOME}/.${preztofile:t}"
done

for vimfile in "$dotfiles_directory"/vim/^colors(.N); do
  rm -rfv ".${vimfile:t}"
  ln -sfv "$vimfile" "${ZDOTDIR:-$HOME}/.${vimfile:t}"
done

rm -rfv ${ZDOTDIR:-$HOME}/.vim/colors
cp -rfv vim/colors ~/.vim
