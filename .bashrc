git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Colour codes
RED="\\[\\e[1;31m\\]"
GREEN="\\[\\e[1;32m\\]"
YELLOW="\\[\\e[1;33m\\]"
BLUE="\\[\\e[1;34m\\]"
MAGENTA="\\[\\e[1;35m\\]"
CYAN="\\[\\e[1;36m\\]"
WHITE="\\[\\e[1;37m\\]"
ENDC="\\[\\e[0m\\]"
GIT_BRANCH="\\[\\033[1;30m\\]\$(git_branch)\\[\\033[00m\\]"

# Set a two-line prompt. If accessing via ssh include 'ssh-session' message.
if [[ -n "$SSH_CLIENT" ]]; then ssh_message="-ssh_session"; fi
PS1="\n${GREEN}\u ${WHITE}at ${YELLOW}\h${RED}${ssh_message} ${WHITE}in ${BLUE}\W ${GIT_BRANCH} \n${CYAN}\$${ENDC} "
