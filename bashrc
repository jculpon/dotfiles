# bash profile for macOS/bsd-likes; for GNU version contact jculpon

# macports/bsd ports in /opt/local config
# prefix path with /opt/local/ userspace tools
# flag for consistency with other versions of this config
export BASH_USE_PORTS_OPT_LOCAL=1
export PORTS_LOCAL_BIN="/opt/local/bin"
export PORTS_BASH_COMPLETION_DIR="/opt/local/etc/bash_completion.d"

# prefer port version of local/bin and home/bin to base OS tools
export PATH="$PORTS_LOCAL_BIN:$HOME/bin:$PATH"

# TODO(jculpon): replace this with switch to handle mixing brew and ports
if [[ -r PORTS_BASH_COMPLETION_DIR  ]]; then
    GIT_AUTOCOMPLETE="PORTS_BASH_COMPLETION_DIR/git-completion.bash"
    [[ -r GIT_AUTOCOMPLETE ]] && source GIT_AUTOCOMPLETE
fi

# macOS homebrew config
# currently disabled to prefer macPorts where possible
#export BASH_USE_HOMEBREW_LOCAL=1
# Use brew binaries over system binaries
#export PATH="/usr/local/bin:$HOME/bin:$PATH"
#
# git autocomplete from /usr/local rather than system; mostly because
# this lets OS X use brew versions rather than system default ones
#export BREW_COMPLETION_DIR=/usr/local/etc/bash_completion.d
#
#if [[ -r BREW_COMPLETION_DIR ]]; then
#     GIT_AUTOCOMPLETE="BREW_COMPLETION_DIR/git-completion.bash"
#     [[ -r GIT_AUTOCOMPLETE ]] && source GIT_AUTOCOMPLETE
#fi

