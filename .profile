# This file contains defaults from Ubuntu 11.10, but may never be executed
# directly by bash because a ~/.bash_profile exists in the repo.
#
# Instead, this file is sourced by ~/.bash_profile to load environment
# variables and startup programs that are not specific to bash.
# The environment variables will stick around for non-login shells too.

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# this is already handled in ~/.bash_profile
# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#   # include .bashrc if it exists
#   if [ -f "$HOME/.bashrc" ]; then
# . "$HOME/.bashrc"
#   fi
# fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# this path contains programs like node, npm, and homebrew's binaries
if [ -d /usr/local/bin ] ; then
    PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# this path contains mysql on OS X (from downloaded pkg on mysql website)
if [ -d /usr/local/mysql/bin ] ; then
    PATH="/usr/local/mysql/bin:$PATH"
fi

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# vert.x
if [ -d /usr/local/vert.x/bin ] ; then
	PATH="/usr/local/vert.x/bin:$PATH"
fi

# VirtualBox + vagrant
if [ -d /Applications/VirtualBox.app ] ; then
	PATH="$PATH:/Applications/VirtualBox.app/Contents/MacOS"
fi

# Android
if [ -d $HOME/Library/Android/sdk ] ; then
	PATH="$PATH:$HOME/Library/Android/sdk/tools"
	export ANDROID_HOME=$HOME/Library/Android/sdk
fi

# Go
if [ -d $HOME/Developer/go ] ; then
	GOPATH="$HOME/Developer/go"
        PATH="$PATH:$GOPATH/bin"
fi
if [ -d /usr/local/opt/go/libexec/bin ] ; then
        PATH=$PATH:/usr/local/opt/go/libexec/bin
fi

# depot_tools (gclient)
if [ -d $HOME/Developer/webrtc-native/depot_tools ] ; then
        PATH="$HOME/Developer/webrtc-native/depot_tools:$PATH"
fi

# nvm
if [ -d $HOME/.nvm ] ; then
	NVM_DIR="$HOME/.nvm"
	source "$(brew --prefix nvm)/nvm.sh"
fi


export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
