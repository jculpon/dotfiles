;; Packaging config
(require 'package)
;; Include MELPA for elisp packages, not just FSF-blessed ones
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Uncomment to include marmalade (disabled because it lags behind MELPA)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Initialize package so tha twe can configure stuff from installed packages
(setq package-enable-at-startup nil)
(package-initialize)

;; When we've launched from OS X, slurp in PATH from our shell config
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Don't use tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; TODO consider if aliasing other tab vars to make this explicit makes sense
;; (defvaralias 'c-basic-offset 'tab-width)
;; (defvaralias 'cperl-indent-level 'tab-width)

;; Spellcheck with aspell instead of ispell
(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

;; Enable flyspell for text and org
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
;; Disable flyspell for major modes: uncomment and add to hook list
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; Default to k&r style, except for java and awk to match the out of the
;; box behavior of emacs
(setq-default c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "k&r")))

;; Markdown mode
;; Associate markdown mode with *.md and *.markdown, except for README.md
;; which should use gfm-mode instead so that it edits in
;; github-flavored markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal :height 140 :width normal :family "Inconsolata")))))
