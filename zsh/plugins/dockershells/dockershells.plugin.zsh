# Dockerfile aliases
# Credit to: https://blog.ropnop.com/docker-for-pentesters/

# Start docker daemon on init

alias dockershell="docker run --rm --interactive --tty" # requires command line arguments ("debian")

function dockershellhere() {
	dirname=${PWD##*/}
	docker run --rm -it -v `pwd`:/${dirname} -w /${dirname} "$@"
}