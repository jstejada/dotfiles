#!/usr/bin/env zsh
setopt EXTENDED_GLOB
dotfiles_directory=${1:-${ZDOTDIR:-$HOME}/dotfiles}
config_files=("ctags" "tmux.conf")

for preztofile in "$dotfiles_directory"/zprezto/^README.md(.N); do
  rm -rfv ".${preztofile:t}"
  ln -sfv "$preztofile" "${ZDOTDIR:-$HOME}/.${preztofile:t}"
done

for vimfile in "$dotfiles_directory"/vim/^colors(.N); do
  rm -rfv ".${vimfile:t}"
  ln -sfv "$vimfile" "${ZDOTDIR:-$HOME}/.${vimfile:t}"
done

for configfile in $config_files; do
  rm -rfv ".${configfile:t}"
  ln -sfv "$dotfiles_directory/$configfile" "${ZDOTDIR:-$HOME}/.${configfile:t}"
done

rm -rf ${ZDOTDIR:-$HOME}/.vim/colors
cp -rfv vim/colors ~/.vim
