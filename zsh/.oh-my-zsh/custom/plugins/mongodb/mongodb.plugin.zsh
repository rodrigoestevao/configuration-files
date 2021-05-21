# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# This plugins add some useful commands and environment variables for Mongo
#
# Adopted py prefix for aliases and functions

if [ -e ${ZSH}/plugins/mongocli/mongocli.plugin.zsh ]; then
    source ${ZSH}/plugins/mongocli/mongocli.plugin.zsh
fi

export MONGO_HOME="$HOME/.local/opt/mongodb-linux-x86_64"

if [ -d $MONGO_HOME/bin -a  `eval echo "$PATH | grep -c $MONGO_HOME/bin"` -eq 0 ]; then
	export PATH="$MONGO_HOME/bin:$PATH"
fi
