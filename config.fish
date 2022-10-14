# Copyright Jamie Culpon 2022

if status is-interactive
    # Commands to run in interactive sessions can go here
    # use user-specific pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

    # Theoretically, you could do this without the above user-specific
    # versioning, but that could cause problems if fish is a login shell
    # for some user and the PYENV_ROOT is not accessibile to all users
    #
    # Shouldn't matter to most people, but it comes up sometimes if you
    # use a lot of chroot or jail() style interfaces for containerizing
    pyenv init - | source
end
