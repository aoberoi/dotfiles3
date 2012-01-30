# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

[[ "/home/ankur/.rvm/scripts/rvm" ]] && source "/home/ankur/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
