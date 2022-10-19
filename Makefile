# Makefile for dotfiles
# Copyright Jamie Culpon 2022
# All rights reserved. See LICENSE for more info.
BASEDIR=$(CURDIR)
USER_BIN=~/bin

USER_EMACS_DIR=~/.emacs.d/
REPO_EMACS_DIR=$(BASEDIR)/emacs.d/

emacsinit:
	[ ! -d "$(USER_EMACS_DIR)" ] || mkdir -i USER_EMACS_DIR
	cp -i REPO_EMACS_INIT USER_EMACS_INIT

slurpemacs:
	@echo 'Copying user emacs config into repo...'
	cp -i $(USER_EMACS_DIR)/init.el $(REPO_EMACS_DIR)/init.el

clean:
	rm -i *~

help:
	@echo 'Makefile for jculpon dotfiles.                                            '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help:       print this message                                    '
	@echo '   make clean:      remove emacs backup files                             '
	@echo '   make slurpemacs: copy emacs init.d from user home to this repo         '
	@echo '   make emacsinit:  overwrite the local emacs init file with the repo copy'
	@echo ''

.PHONY: clean help emacsinit slurpemacs
