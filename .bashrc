# This is being sourced from ~/.bash_profile so it will be run for login and
# non-login shells. As it is, this contains plenty of defaults from ubuntu.
#
# Mostly this should include aliases and functions (bash specific)

load_colors ()
{
  # Reset
  Color_Off='\e[0m'       # Text Reset

  # Regular Colors
  Black='\e[0;30m'        # Black
  Red='\e[0;31m'          # Red
  Green='\e[0;32m'        # Green
  Yellow='\e[0;33m'       # Yellow
  Blue='\e[0;34m'         # Blue
  Purple='\e[0;35m'       # Purple
  Cyan='\e[0;36m'         # Cyan
  White='\e[0;37m'        # White

  # Bold
  BBlack='\e[1;30m'       # Black
  BRed='\e[1;31m'         # Red
  BGreen='\e[1;32m'       # Green
  BYellow='\e[1;33m'      # Yellow
  BBlue='\e[1;34m'        # Blue
  BPurple='\e[1;35m'      # Purple
  BCyan='\e[1;36m'        # Cyan
  BWhite='\e[1;37m'       # White

  # Underline
  UBlack='\e[4;30m'       # Black
  URed='\e[4;31m'         # Red
  UGreen='\e[4;32m'       # Green
  UYellow='\e[4;33m'      # Yellow
  UBlue='\e[4;34m'        # Blue
  UPurple='\e[4;35m'      # Purple
  UCyan='\e[4;36m'        # Cyan
  UWhite='\e[4;37m'       # White

  # Background
  On_Black='\e[40m'       # Black
  On_Red='\e[41m'         # Red
  On_Green='\e[42m'       # Green
  On_Yellow='\e[43m'      # Yellow
  On_Blue='\e[44m'        # Blue
  On_Purple='\e[45m'      # Purple
  On_Cyan='\e[46m'        # Cyan
  On_White='\e[47m'       # White

  # High Intensty
  IBlack='\e[0;90m'       # Black
  IRed='\e[0;91m'         # Red
  IGreen='\e[0;92m'       # Green
  IYellow='\e[0;93m'      # Yellow
  IBlue='\e[0;94m'        # Blue
  IPurple='\e[0;95m'      # Purple
  ICyan='\e[0;96m'        # Cyan
  IWhite='\e[0;97m'       # White

  # Bold High Intensty
  BIBlack='\e[1;90m'      # Black
  BIRed='\e[1;91m'        # Red
  BIGreen='\e[1;92m'      # Green
  BIYellow='\e[1;93m'     # Yellow
  BIBlue='\e[1;94m'       # Blue
  BIPurple='\e[1;95m'     # Purple
  BICyan='\e[1;96m'       # Cyan
  BIWhite='\e[1;97m'      # White

  # High Intensty backgrounds
  On_IBlack='\e[0;100m'   # Black
  On_IRed='\e[0;101m'     # Red
  On_IGreen='\e[0;102m'   # Green
  On_IYellow='\e[0;103m'  # Yellow
  On_IBlue='\e[0;104m'    # Blue
  On_IPurple='\e[10;95m'  # Purple
  On_ICyan='\e[0;106m'    # Cyan
  On_IWhite='\e[0;107m'   # Whitek
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# PS1="\n"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    PS1='${debian_chroot:+($debian_chroot)}'
fi

# This should detect terminal color capability correctly on Mac OS X and Ubuntu
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
  load_colors

  # Colorize the prompt
  # white hostname (everything before the .)
  # :
  # bright green base name of working directory (with $HOME abbreviated as ~)
  # {space}
  # blue username
  # PS1="$PS1\[$BRed\]\w\[$Color_Off\]:\[$BWhite\]\u\[$Color_Off\]\$ "

  # Colorize the 'ls' command
  # This works on Ubuntu
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
  fi
  # This works on Mac OS X
  if [[ $OSTYPE == *darwin* ]]; then
      export CLICOLOR=1
      export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
  fi

  # Colorize the 'grep'ish commands
  # These should work on Ubuntu and Mac OS X
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

# else
  # PS1="$PS1\h:\W \u\$ "
fi

# If this is an xterm set the window/tab title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#   # TODO: look this string up and find out how it works
#   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#   ;;
# *)
#   ;;
# esac

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
if [ -x `which notify-send` ] ; then
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# if [ -f ~/.bash_aliases ]; then
#   . ~/.bash_aliases
# fi

# titanium SDK
alias titanium='~/Library/Application\ Support/Titanium/mobilesdk/osx/3.0.0.GA/titanium.py'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# bash-completion Formula from homebrew
if [[ $OSTYPE == *darwin* ]]; then
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
fi

# {{{
# Node Completion - Auto-generated, do not touch.
# originally put in .bash_profile
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

# dotfiles alias
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# `cat` with beautiful colors. requires Pygments installed.
# 							   sudo easy_install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
# brew install ngrep
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and (port 80 or port 443)'"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
# alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

# prefer the GUI versions of vim (mvim on Mac, gvim on Linux)
if [[ $OSTYPE == *darwin* ]]; then
  # alias vim="mvim --remote-silent"
	# commenting this out because using --remote-silent makes opening mvim without a file impossible
  # alias mvim="mvim --remote-silent"
  export EDITOR="mvim -f"
elif [[ $OSTYPE == *linux-gnu* ]]; then
  # alias vim="gvim --remote-silent"
	# commenting this out because using --remote-silent makes opening gvim without a file impossible
  # alias gvim="gvim --remote-silent"
  export EDITOR="gvim -f"
fi

# FUNCTIONS

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# find shorthand
function f() {
    find . -name "$1"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	open "http://localhost:${port}/"
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Syntax-highlight JSON strings or files
function json() {
	if [ -p /dev/stdin ]; then
		# piping, e.g. `echo '{"foo":42}' | json`
		python -mjson.tool | pygmentize -l javascript
	else
		# e.g. `json '{"foo":42}'`
		python -mjson.tool <<< "$*" | pygmentize -l javascript
	fi
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

if [[ $OSTYPE == *darwin* ]]; then
  function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH  
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
 setjdk 1.7
fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
