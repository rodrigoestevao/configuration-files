# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# Python related zsh aliases
#
# Adopted py prefix for aliases and functions

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

    pip install pip --upgrade --no-cache-dir

    local req_file_selected=""
    local req_file_default1="./requirements.txt"
    local req_file_default2="./requirements/develop.txt"

    if [ $# -eq 0 ]; then
        if [ -r "${req_file_default1}" ]; then
            req_file_selected=${req_file_default1}
        elif [ -r "${req_file_default2}" ]; then
            req_file_selected=${req_file_default2}
        fi
    else
        while getopts ":r:" opt
        do
            case ${opt} in
                r )
                    req_file_selected=$OPTARG
                    ;;
                \? )
                    echo "Invalid Option: -$OPTARG" 1>&2
                    ;;
            esac
        done
        shift $((OPTIND -1))
    fi

    if [ -r ${req_file_selected} ]; then
        echo "Requiment file not informed. The environemnt will be created empty."
    else
        pip install -r ${req_file_selected} --upgrade --no-cache-dir
    fi
}
