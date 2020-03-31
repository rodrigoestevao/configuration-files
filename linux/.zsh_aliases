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
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -Alh'
alias vi='vim -X'
alias sassw='sass --style expanded --quiet --watch scss:css'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Postrgres - Docker
alias startpg='docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/.local/var/lib/postgresql/data:/var/lib/postgresql/data postgres'

# RabbitMQ - Docker
alias startrb='docker run -d --hostname rabbit-host --name rabbitmq -p 15672:15672 -p 5672:5672 -v $HOME/.local/var/lib/rabbitmq:/var/lib/rabbitmq rabbitmq:3-management'

# Redis - Docker
alias startrd='docker run -d -p 6379:6379 --name redis1 --restart unless-stopped -v $HOME/.local/var/lib/redis/data:/data redis'

# Docker Aliases
alias dkprune='docker volume prune -f && docker container prune -f'

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
	rm -rf $(find . -path "**/__pycache__")
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
