# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# RabbitMQ related zsh aliases
#
# Adopted rb prefix for aliases and functions

alias rbdclean='docker system prune -f --volumes'
alias rbdstart='rbdclean; docker run -d --hostname rabbit-host --rm --name rabbit1 -p 15672:15672 -p 5672:5672 -v $HOME/.local/var/lib/rabbitmq/rabbit1:/var/lib/rabbitmq rabbitmq:3-management'
alias rbdstop='docker stop rabbit1 2>/dev/null; rbdclean'
alias rbdrestart='rbdstop && sleep 1 && rbdstart'