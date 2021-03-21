# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# This plugins extends the original Django plugin embbeded on .oh-my-zsh
#
# Adopted py prefix for aliases and functions

if [ -e ${ZSH}/plugins/django/django.plugins.zsh ]; then
    source ${ZSH}/plugins/django/django.plugins.zsh
fi

function djcleanupmigration() {
    local _BASE_PATH=${*:-'.'}
    local _MANAGE_PY=`find ${_BASE_PATH} -type f -name manage.py`

    if [ -e ${_MANAGE_PY} ]; then
        python3 ${_MANAGE_PY} flush --noinput
    fi

    find ${_BASE_PATH} -type f -name "*.py[co]" -not -path "**/?env/**" -delete
    find ${_BASE_PATH} -type d -name "__pycache__" -not -path "**/?env/**" -delete
    find ${_BASE_PATH} \
        -type f \
        -path "**/migrations/**" \
        -not -path "**/data/**" \
        -not -path "**/?env/**" \
        -not -name "__init__.py" \
        -delete
    find ${_BASE_PATH} \
        -depth \
        -type d \
        -name ".mypy_cache" \
        -not -path "**/?env/**" \
        -exec rm -r "{}" +
    find ${_BASE_PATH} \
        -depth \
        -type d \
        -name ".pytest_cache" \
        -not -path "**/?env/**" \
        -exec rm -r "{}" +

    return $?
}
