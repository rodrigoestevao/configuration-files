# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# This plugins extends the original Python plugin embbeded on .oh-my-zsh
#
# Adopted py prefix for aliases and functions

if [ -e ${ZSH}/plugins/python/python.plugin.zsh ]; then
    source ${ZSH}/plugins/python/python.plugin.zsh
fi


function _locate_python3() {
    local _python3=$(which python3.8)

    if [ ! -x ${_python3} ]; then
         _python3=$(which python3)
    fi

    echo ${_python3}
}

function pyactivateenv() {
    local _PYSEARCH_PLACES=${*:-'.'}
    local _activate=$(\
        find ${_PYSEARCH_PLACES} \
            -type f \
            -path "**/venv/bin/*" \
            -name "activate" \
            | head -1 \
    )

    if [ -n "${_activate}" ]; then
        source ${_activate}
    else
        echo "Could not find the activation script!" 1>&2
    fi
}

function pygitinit() {
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

function pycreateenv() {
    local _python3=$(_locate_python3)

    existing_env=$(\
        find . \
        -type d \
        -path "**/**" \
        \( -name "venv" -or -name "env" \)
    )

    # If we don't have a virtual environment yet, create it
    if [ -z "${existing_env[@]}" -a -z "$VIRTUAL_ENV" ]; then
        ${_python3} -m venv venv
    else
        echo "A virtual environment was found and will be used!"
    fi

    if [ $? -ne 0 ]; then
        echo "Error when trying to initialize the virtual environment!" 1>&2
    else
        # Activate the virtual environment and initialize the git repository
        pyactivateenv && pygitinit

        pip install pip --upgrade --no-cache-dir

        # Check if there are any requirements.txt file
        echo -n 'Trying to locate the default requirements file...'

        local req_files=$(\
            find . \
            -type f \
            -path "**/**" \
            -not -path "**/?env/**" \
            -name "requirements.txt" \
        )

        if [ -z "${req_files[@]}" ]; then
            echo ': NOT FOUND!'
            echo -n 'Trying to locate the default modular requirements file...'

            # TODO: Enhance the script to accept a given script (as it was before)

            req_files=$(\
                find . \
                -type f \
                -path "**/requirements/*" \
                -not -path "**/?env/**" \
                -name "develop.txt" \
            )
        fi

        if [ -z "${req_files[@]}" ]; then
            echo ': NOT FOUND! The environemnt will be created empty!'
        else
            echo ': FOUND! The environemnt will be created and initialized!'

            for req_file in "${req_files[@]}"
            do
                pip install -r ${req_file} --upgrade --no-cache-dir
            done
        fi
    fi
}
