#!/bin/bash

alias py_activate_env='source venv/bin/activate'

function _locate_python3() {
    local _python3=$(which python3.8)

    if [ ! -x ${_python3} ]; then
         _python3=$(which python3)
    fi

    echo ${_python3}
}

function py_git_init() {
    # Command to check if we are within a git tree	
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 

    if [ $? -ne 0 ]; then
        git init -q

	local _git_dir=$(dirname $(git rev-parse --absolute-git-dir))

	if [ ! -e ${_git_dir}/.gitignore ]; then
            cp ~/Workspace/rer/projects/configuration-files/git/python/.gitignore ${_git_dir}
	fi

        git add ${_git_dir} --all
    fi
}

function py_create_env() {
    local _python3=$(_locate_python3)

    ${_python3} -m venv venv && py_git_init && py_activate_env
    
    if [ $? -eq 0 ]; then
        if [ -r ./requirements.txt ]; then
            pip install pip --upgrade --no-cache-dir
            pip install -r requirements.txt --upgrade --no-cache-dir
        fi
    fi
}

