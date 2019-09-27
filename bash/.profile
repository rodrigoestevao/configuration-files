# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" -a `eval echo "$PATH" | grep -c "$HOME/.local/bin"` -eq 0 ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" -a `eval echo "$PATH" | grep -c "$HOME/bin"` -eq 0 ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Read all config files
CONFIG_DEFAULT="$HOME/.local/etc/config.d"
if [ -d "$CONFIG_DEFAULT" ]; then
    for config in `ls -1 $CONFIG_DEFAULT/*.conf | sort -n -t '-' -k 1`
    do
        . "$config"
    done
fi

# Set the command line editor
set -o vi
