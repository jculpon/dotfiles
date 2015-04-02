# Use brew binaries over system binaries
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# git autocomplete from /usr/local rather than system; mostly because
# this lets OS X use brew versions rather than system default ones
export BREW_COMPLETION_DIR=/usr/local/etc/bash_completion.d

if [[ -r BREW_COMPLETION_DIR ]]; then
     GIT_AUTOCOMPLETE="BREW_COMPLETION_DIR/git-completion.bash"
     [[ -r GIT_AUTOCOMPLETE ]] && source GIT_AUTOCOMPLETE
fi

# virtualenvwrapper configuration
export WORKON_HOME=~/python/envs
source /usr/local/bin/virtualenvwrapper.sh
