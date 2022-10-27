;; Packaging config
;; TODO(jculpon): 2022/10/13 fix deprecations
(require 'package)

;; Include MELPA for elisp packages, not just FSF-blessed ones
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Initialize package so that we can configure stuff from installed packages
(setq package-enable-at-startup nil)
(package-initialize)

;; TODO(jculpon): 2022/10/13: set requires for exec-path-from-shell etc

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
 '(cursor-type 'bar)
 '(custom-enabled-themes '(abyss))
 '(custom-safe-themes
   '("3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" "0d75aa06198c4245ac2a8877bfc56503d5d8199cc85da2c65a6791b84afb9024" "76886adff51f45ff716723f6f05e389d110a7f93f42697e52ff21567339cd74d" "2dc03dfb67fbcb7d9c487522c29b7582da20766c9998aaad5e5b63b5c27eec3f" "dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" "a3e99dbdaa138996bb0c9c806bc3c3c6b4fd61d6973b946d750b555af8b7555b" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" default))
 '(fci-rule-character-color "#192028")
 '(frame-brackground-mode 'dark)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(latex-change-env latex-extra latex-math-preview latex-pretty-symbols latex-preview-pane latex-unicode-math-mode latexdiff magic-latex-buffer math-symbol-lists math-tex-convert org-elisp-help org-gtd org-web-tools osx-lib osx-trash reveal-in-osx-finder autobuild autotest flycheck flylisp flymake flymake-aspell help-find help-find-org-mode org-ac org-caldav org-clock-csv org-clock-reminder org-clock-split org-clock-today org-context org-cua-dwim use-package use-package-chords use-package-el-get use-package-ensure-system-package use-proxy use-ttf with-editor with-emacs wolfram wolfram-mode www-synonyms yasnippet-snippets zen-and-art-theme org org-d20 org-dotemacs org-jira aws-snippets clojure-mode abyss-theme ac-c-headers ac-cider ac-clang ac-emacs-eclim ac-html ac-html-angular ac-html-bootstrap ac-html-csswatcher ac-inf-ruby ac-ispell ac-js2 ac-math ac-slime actionscript-mode ada-mode ada-ref-man adafruit-wisdom autothemer autumn-light-theme cider demangle-mode rust-auto-use rust-playground auto-virtualenv auto-virtualenvwrapper auto-yasnippet auto-package-update xml+ xml-format xml-quotes xml-rpc xmlgen xmlunicode xo xonsh-mode xpm xquery-mode xquery-tool xr xref xref-js2 xref-rst xresources-theme xterm-color xterm-keybinder xtest xwidgete xwidgets-reuse xwiki-mode yaml yaml-imenu yaml-pro yaml-tomato yang-mode yoshi-theme ztree zweilight-theme minibuffer-header org-contrib org-notify sakura-theme sideline-blame sideline-flymake magit-p4 magit-stgit zenburn-theme yasnippet yaml-mode wrap-region warm-night-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toml-mode toml spacegray-theme sos solarized-theme sicp seti-theme rust-mode osx-pseudo-daemon osx-plist osx-org-clock-menubar osx-location osx-dictionary osx-clipboard osx-browse markdown-toc markdown-mode+ magit-svn magit-gh-pulls gruber-darker-theme font-utils font-lock-studio font-lock+ flyparens flymake-yaml flymake-rust flymake-ruby flymake-python-pyflakes flymake-lua flymake-json flymake-jslint flymake-google-cpplint flycheck-rust flycheck-package flycheck-clojure flycheck-cask exec-path-from-shell color-theme-solarized chinese-word-at-point))
 '(text-mode-hook
   '(turn-on-auto-fill
     (lambda nil
       (flyspell-mode 1))
     text-mode-hook-identify))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; end last known good update [jculpon]
