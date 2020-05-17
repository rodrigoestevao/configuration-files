#!/bin/bash

function _echoerr() {
    cat <<< "$@" 1>&2
}

function backup-home() {
    local home_dir=${HOME%/}
    local destination=${1%/}
    local user=$(id -u)
    local gid=$(id -g)

    if [ -z "$destination" -o ! -w $destination ]; then
        _echoerr "The destination dir is mandatory"
    else
        rsync -azhuW \
            --info=progress2 \
            -e --delete-during \
            --ignore-missing-args \
            --ignore-errors \
            -m --prune-empty-dirs \
            -m --chown=$user:$gid \
            --exclude='.cache' \
            --exclude='.config' \
            --exclude='.eclipse' \
            --exclude='.gnome' \
            --exclude='.java' \
            --exclude='.jupyter' \
            --exclude='.npm' \
            --exclude='.nvm' \
            --exclude='.oh-my-zsh' \
            --exclude='.swt' \
            --exclude='.vboxclient*' \
            --exclude='.zcompdump*' \
            --exclude='*._*' \
            --exclude='*__pycache__' \
            --exclude='*.cvs*' \
            --exclude='*.sass-cache' \
            --exclude='*.svn' \
            --exclude='*DS_Store' \
            --exclude='*bower_components' \
            --exclude='*build' \
            --exclude='*nbproject/private' \
            --exclude='*node_modules' \
            --exclude='*.recommenders' \
            --exclude='*.sonarcube' \
            --exclude='*RemoteSystemsTempFiles' \
            --exclude='*Servers' \
            --exclude='*target' \
            --exclude='*Thumbs.db' \
            --exclude='.local' \
            --include='.local/etc' \
            --include='.local/share/fonts' \
            --include='.local/share/applications' \
            --include='.local/share/opt' \
            $home_dir/ $destination/
    fi
}

