# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -Al'

# 7z shortcuts
#alias 7za='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
#alias 7zb='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $(date +"%Y%m%d%H%M%S")_'
#alias 7ze='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -pabc@123'
#alias 7zbe='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -pabc@123 $(date +"%Y%m%d%H%M%S")_'
#alias 7zx='7z x'
alias vi='vim -X'
alias sassw='sass --style expanded --quiet --watch scss:css'

function backup() {
	if [ -n "$1" -a -d "$1" ]; then
		(
			export COPYFILE_DISABLE=true

			local file_name=${1%%'/'}

			if [ -n "$file_name" ]; then
				7z a -t7z ${file_name}_$(date +"%Y%m%d_%H%M%S").7z ${file_name} -r \
				    -xr!*._* \
					-xr!*__pycache__ \
					-xr!*.cvs* \
					-xr!*.git \
					-xr!*.metadata \
					-xr!*.sass-cache \
					-xr!*.settings \
					-xr!*.svn \
					-xr!*.tmp \
					-xr!*.pyc* \
					-xr!*.sqlite3* \
					-xr!*DS_Store \
					-xr!*bin* \
					-xr!*bower_components \
					-xr!*build \
					-xr!*libs \
					-xr!*nbproject/private \
					-xr!*node_modules \
					-xr!*.recommenders \
					-xr!*.sonarcube \
					-xr!*RemoteSystemsTempFiles \
					-xr!*Servers \
					-xr!*target \
					-xr!*temp \
					-xr!*Thumbs.db \
					-xr!*tmp
			fi
		)
	fi
}

function reset_migration() {
	find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
	find . -path "*/migrations/*.pyc"  -delete
	if [ $# -gt 0 -a "$1" = "new"  ]; then
		python manage.py makemigrations
		python manage.py migrate
	fi
}

function load_ssh_agent() {
	# Kill the current instance of ssh-agent (if that is any one)
	ps axu | grep 'ssh-agent -s' | grep -v grep | awk '{print $2}' | xargs kill -9 2>&1 >/dev/null
	echo "$(date +%F@%T) - SSH-AGENT: Agent will be started..."
	ssh-agent -s >~/.ssh/ssh-agent
	. ~/.ssh/ssh-agent >/dev/null
	echo "$(date +%F@%T) - SSH-AGENT: Adding the id_ecdsa key..."
	ssh-add ~/.ssh/id_ecdsa
}
