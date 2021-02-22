#!/bin/bash

BASE_DIR=~/Workspace/rer/configuration-files/zsh/.oh-my-zsh/custom/plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

mkdir -p $ZSH_CUSTOM/plugins/backup-utils    2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/django-ext      2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/docker-local    2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/postgres-docker 2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/python-ext      2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/redis-docker    2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/spark-ext       2>&1 >/dev/null
mkdir -p $ZSH_CUSTOM/plugins/spark-jupyter   2>&1 >/dev/null

ln -sf $BASE_DIR/backup-utils/README.md                      $ZSH_CUSTOM/plugins/backup-utils/    2>&1 >/dev/null
ln -sf $BASE_DIR/backup-utils/backup-utils.plugin.zsh        $ZSH_CUSTOM/plugins/backup-utils/    2>&1 >/dev/null
ln -sf $BASE_DIR/django-ext/django-ext.plugin.zsh            $ZSH_CUSTOM/plugins/django-ext/      2>&1 >/dev/null
ln -sf $BASE_DIR/django-ext/README.md                        $ZSH_CUSTOM/plugins/django-ext/      2>&1 >/dev/null
ln -sf $BASE_DIR/docker-local/docker-local.plugin.zsh        $ZSH_CUSTOM/plugins/docker-local/    2>&1 >/dev/null
ln -sf $BASE_DIR/docker-local/README.md                      $ZSH_CUSTOM/plugins/docker-local/    2>&1 >/dev/null
ln -sf $BASE_DIR/postgres-docker/postgres-docker.plugin.zsh  $ZSH_CUSTOM/plugins/postgres-docker/ 2>&1 >/dev/null
ln -sf $BASE_DIR/postgres-docker/README.md                   $ZSH_CUSTOM/plugins/postgres-docker/ 2>&1 >/dev/null
ln -sf $BASE_DIR/python-ext/python-ext.plugin.zsh            $ZSH_CUSTOM/plugins/python-ext/      2>&1 >/dev/null
ln -sf $BASE_DIR/python-ext/README.md                        $ZSH_CUSTOM/plugins/python-ext/      2>&1 >/dev/null
ln -sf $BASE_DIR/redis-docker/redis-docker.plugin.zsh        $ZSH_CUSTOM/plugins/redis-docker/    2>&1 >/dev/null
ln -sf $BASE_DIR/redis-docker/README.md                      $ZSH_CUSTOM/plugins/redis-docker/    2>&1 >/dev/null
ln -sf $BASE_DIR/spark-ext/spark-ext.plugin.zsh              $ZSH_CUSTOM/plugins/spark-ext/       2>&1 >/dev/null
ln -sf $BASE_DIR/spark-ext/README.md                         $ZSH_CUSTOM/plugins/spark-ext/       2>&1 >/dev/null
ln -sf $BASE_DIR/spark-jupyter/spark-jupyter.plugin.zsh      $ZSH_CUSTOM/plugins/spark-jupyter/   2>&1 >/dev/null
ln -sf $BASE_DIR/spark-jupyter/README.md                     $ZSH_CUSTOM/plugins/spark-jupyter/   2>&1 >/dev/null
