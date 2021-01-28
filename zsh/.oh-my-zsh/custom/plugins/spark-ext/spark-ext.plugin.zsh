# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# This plugins add some useful commands and environment variables for Spark
#
# Adopted py prefix for aliases and functions

export SPARK_HOME="$HOME/.local/opt/spark"

if [ `eval echo "$PATH | grep -c $SPARK_HOME/bin"` -eq 0 ]; then
    export PATH="$SPARK_HOME/bin:$PATH"
fi

if [ `eval echo "$PYTHONPATH | grep -c $SPARK_HOME/python"` -eq 0 ]; then
    if [ -z "$PYTHONPATH" ]; then
        export PYTHONPATH="$SPARK_HOME/python"
    else
        export PYTHONPATH="$SPARK_HOME/python:$PYTHONPATH"
    fi
fi

