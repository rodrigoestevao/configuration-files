# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# This plugins extends the original Git plugin embbeded on .oh-my-zsh
#
# Adopted py prefix for aliases and functions

if [ -e ${ZSH}/plugins/git/git.plugin.zsh ]; then
    source ${ZSH}/plugins/git/git.plugin.zsh
fi

alias gsync='git fetch origin && git rebase origin/$(git_main_branch)'