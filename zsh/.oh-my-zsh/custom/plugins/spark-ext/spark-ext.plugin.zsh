# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# This plugins add some useful commands and environment variables for Spark
#
# Adopted py prefix for aliases and functions

export SPARK2_HOME="$HOME/.local/opt/spark2"
export SPARK3_HOME="$HOME/.local/opt/spark3"

if [ -d $SPARK3_HOME/bin -a  `eval echo "$PATH | grep -c $SPARK3_HOME/bin"` -eq 0 ]; then
	export SPARK_HOME=${SPARK3_HOME}
	export PATH="$SPARK_HOME/bin:$PATH"
elif [ -d $SPARK2_HOME/bin -a  `eval echo "$PATH | grep -c $SPARK2_HOME/bin"` -eq 0 ]; then
	export SPARK_HOME=${SPARK2_HOME}
	export PATH="$SPARK_HOME/bin:$PATH"
fi

if [ `eval echo "$PYTHONPATH | grep -c $SPARK_HOME/python"` -eq 0 ]; then
    if [ -z "$PYTHONPATH" ]; then
        export PYTHONPATH="$SPARK_HOME/python"
    else
        export PYTHONPATH="$SPARK_HOME/python:$PYTHONPATH"
    fi
fi

unset SPARK3_HOME SPARK2_HOME
