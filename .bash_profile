# this is a redundant question to ask if we are in .bash_profile
# if running bash
# if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      source "$HOME/.bashrc"
    fi
# fi

# Source ~/.profile for environment variables and startup programs
# that are not specific to bash
if [ -f "$HOME/.profile" ]; then
  source "$HOME/.profile"
fi

