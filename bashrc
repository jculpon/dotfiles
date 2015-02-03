# Use brew binaries over system binaries
export PATH="/usr/local/bin:$PATH"

# If you copy this and use homebrew, brew will give you a warning like:
# Please note that these warnings are just used to help the Homebrew maintainers
# with debugging if you file an issue. If everything you use Homebrew for is
# working fine: please don't worry and just ignore them. Thanks!
#
# Warning: Your Homebrew is outdated.
# You haven't updated for at least 24 hours. This is a long time in brewland!
# To update Homebrew, run `brew update`.
#
# If you don't understand why it's important to ignore this warning, you
# should not use this bashrc, sorry.

# virtualenvwrapper configuration
export WORKON_HOME=~/python/envs
source /usr/local/bin/virtualenvwrapper.sh

