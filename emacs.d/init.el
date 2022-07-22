;; Packaging config
(require 'package)

;; Include MELPA for elisp packages, not just FSF-blessed ones
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Initialize package so that we can configure stuff from installed packages
(setq package-enable-at-startup nil)
(package-initialize)

;; When we've launched from OS X, slurp in PATH from our shell config
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Don't use tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

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
                                (c++-mode . "bsd")
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
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" default)))
 '(fci-rule-character-color "#192028")
 '(frame-brackground-mode (quote dark))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet yaml-mode wrap-region warm-night-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toml-mode toml spacegray-theme sos solarized-theme sicp seti-theme rust-mode osx-pseudo-daemon osx-plist osx-org-clock-menubar osx-location osx-dictionary osx-clipboard osx-browse markdown-toc markdown-mode+ magit-svn magit-gh-pulls gruber-darker-theme font-utils font-lock-studio font-lock+ flyparens flymake-yaml flymake-rust flymake-ruby flymake-python-pyflakes flymake-lua flymake-json flymake-jslint flymake-google-cpplint flycheck-rust flycheck-package flycheck-clojure flycheck-cask exec-path-from-shell color-theme-solarized chinese-word-at-point)))
 '(text-mode-hook
   (quote
    (turn-on-auto-fill
     (lambda nil
       (flyspell-mode 1))
     text-mode-hook-identify)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal :height 140 :width normal :family "Anonymous Pro")))))
