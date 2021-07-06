# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# rstudio related zsh aliases
#
# Adopted rb prefix for aliases and functions

if [ ! -e  $HOME/.local/var/lib/rstudio/rstudio1 ]; then
    mkdir -p $HOME/.local/var/lib/rstudio/rstudio1
fi

alias rsdclean='docker system prune -f --volumes'
alias rsdstart='rsdclean; docker run -d --hostname rstudio-host --rm --name rstudio1 -p 8787:8787 -e PASSWORD=s3cr3t -v $HOME/.local/var/lib/rstudio/rstudio1:/home/rstudio rocker/rstudio'
alias rssdstart='rsdclean; docker run -d --hostname rstudio-host --rm --name rstudio1 -p 8787:8787 -p 3838:3838 -e ADD=shiny -e PASSWORD=s3cr3t -v $HOME/.local/var/lib/rstudio/rstudio1:/home/rstudio rocker/rstudio'
alias rsdstop='docker stop rstudio1 2>/dev/null; rsdclean'
alias rsdrestart='rsdstop && sleep 1 && rsdstart'
