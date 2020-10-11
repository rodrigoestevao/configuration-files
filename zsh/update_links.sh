#!/bin/bash

BASE_DIR=~/Workspace/rer/projects/configuration-files/zsh/.oh-my-zsh/custom/plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

mkdir -p $ZSH_CUSTOM/plugins/python-ext
mkdir -p $ZSH_CUSTOM/plugins/docker-local
mkdir -p $ZSH_CUSTOM/plugins/postgres-docker
mkdir -p $ZSH_CUSTOM/plugins/rabbit-docker
mkdir -p $ZSH_CUSTOM/plugins/redis-docker
mkdir -p $ZSH_CUSTOM/plugins/backup-utils
mkdir -p $ZSH_CUSTOM/plugins/django-ext

ln -s $BASE_DIR/python-ext/python-ext.plugin.zsh            $ZSH_CUSTOM/plugins/python-ext/
ln -s $BASE_DIR/python-ext/README.md                        $ZSH_CUSTOM/plugins/python-ext/
ln -s $BASE_DIR/docker-local/docker-local.plugin.zsh        $ZSH_CUSTOM/plugins/docker-local/
ln -s $BASE_DIR/docker-local/README.md                      $ZSH_CUSTOM/plugins/docker-local/
ln -s $BASE_DIR/postgres-docker/postgres-docker.plugin.zsh  $ZSH_CUSTOM/plugins/postgres-docker/
ln -s $BASE_DIR/postgres-docker/README.md                   $ZSH_CUSTOM/plugins/postgres-docker/
ln -s $BASE_DIR/rabbit-docker/rabbit-docker.plugin.zsh      $ZSH_CUSTOM/plugins/rabbit-docker/
ln -s $BASE_DIR/rabbit-docker/README.md                     $ZSH_CUSTOM/plugins/rabbit-docker/
ln -s $BASE_DIR/redis-docker/redis-docker.plugin.zsh        $ZSH_CUSTOM/plugins/redis-docker/
ln -s $BASE_DIR/redis-docker/README.md                      $ZSH_CUSTOM/plugins/redis-docker/
ln -s $BASE_DIR/backup-utils/README.md                      $ZSH_CUSTOM/plugins/backup-utils/
ln -s $BASE_DIR/backup-utils/backup-utils.plugin.zsh        $ZSH_CUSTOM/plugins/backup-utils/
ln -s $BASE_DIR/django-ext/django-ext.plugin.zsh            $ZSH_CUSTOM/plugins/django-ext/
ln -s $BASE_DIR/django-ext/README.md                        $ZSH_CUSTOM/plugins/django-ext/

