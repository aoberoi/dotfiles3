# this is a redundant question to ask if we are in .bash_profile
# if running bash
# if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
# fi

# Source ~/.profile for environment variables and startup programs
# that are not specific to bash
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

# for Ruby Version Manager
# RVM depends on bash (as far as i know) so this belongs in .bash_profile,
# and it is recommended by the docs: https://rvm.beginrescueend.com/support/faq/#shell_login
# export CC=gcc-4.2 # at one point this was necessary to install new rubies on Mac OS X
[[ "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
