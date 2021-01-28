# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# RabbitMQ related zsh aliases
#
# Adopted rb prefix for aliases and functions

alias rbdclean='docker system prune -f --volumes'
# alias rbdstart='rbdclean; docker run -d --hostname rabbit-host --rm --name rabbitmq1 -p 15672:15672 -p 5672:5672 -e RABBITMQ_VM_MEMORY_HIGH_WATERMARK=0.6 -v $HOME/.local/var/lib/rabbitmq/rabbitmq1:/var/lib/rabbitmq -v $HOME/.local/etc/rabbitmq/rabbitmq1:/etc/rabbitmq rabbitmq:3-management'
alias rbdstart='rbdclean; docker run -d --hostname rabbit-host --rm --name rabbitmq1 -p 15672:15672 -p 5672:5672 -e RABBITMQ_VM_MEMORY_HIGH_WATERMARK=0.6 -v $HOME/.local/var/lib/rabbitmq/rabbitmq1:/var/lib/rabbitmq rabbitmq:3-management'
alias rbdstop='docker stop rabbitmq1 2>/dev/null; rbdclean'
alias rbdrestart='rbdstop && sleep 1 && rbdstart'
