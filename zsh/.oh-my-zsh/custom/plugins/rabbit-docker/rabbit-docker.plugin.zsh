# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# RabbitMQ related zsh aliases
#
# Adopted rb prefix for aliases and functions

alias rbstart='docker run -d --hostname rabbit-host --name rabbit1 -p 15672:15672 -p 5672:5672 -v $HOME/.local/var/lib/rabbitmq/rabbit1:/var/lib/rabbitmq rabbitmq:3-management'
alias rbstop='docker stop rabbit1'
alias rbrestart='rbstop && sleep 1 && rbstart'