
;;;;
;;;; Th idea of this .emacs file is that your customization will not
;;;; live in this file. They live in varias files in a '.emacsrc'
;;;; directory. This sets a few variables that may be used by your
;;;; customizations and then loads these customizations form those files.
;;;;
;;;; The subdirectories that this .emacs cares about are as follows.
;;;;
;;;; ~/.emacsrc/init - This is where anything that must be run first should be dropped
;;;; ~/.emacsrc/mode-start-files - This is where your per mode configuration goes.
;;;; ~/.emacsrc/preferences - These are where your non-mode specific customizations go
;;;;
;;;; It loads the start-files directory first, then the preferences directory.
;;;; This allows the preferences to override anything set in the mode-start-files.
;;;;
;;;; If you have anything that absolutly must be run before anything else drop it init
;;;; directory.
;;;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq *mode-root* (expand-file-name "~/.emacsrc/modes"))
(setq *tmp-root* (expand-file-name "~/.emacsrc/tmp"))

(defun relative-mode-path (path)
  (concat *mode-root* path))

(defun add-mode-path (path)
  "Add a mode in the modes file to the root path"
    (add-to-list 'load-path (relative-mode-path path)))

(defun startup-after-init ()
  (add-to-list 'load-path (expand-file-name "~/.emacsrc/lib"))

  (require 'elisp-load-dir)

  (let ((init-dir "~/.emacsrc/init"))
    (if (file-accessible-directory-p init-dir)
        (elisp-load-dir (expand-file-name init-dir))))

  (let ((mode-dirs (directory-files *mode-root*)))
    (while mode-dirs
      (let ((ldir (car mode-dirs))
            (local-dir (concat *mode-root* "/" (car mode-dirs))))
        (if (and (or (not (string= ldir "."))
                     (not (string= ldir "..")))
                 (file-accessible-directory-p local-dir))
            (add-to-list 'load-path (expand-file-name local-dir))))
      (setq mode-dirs (cdr mode-dirs))))

  (elisp-load-dir (expand-file-name "~/.emacsrc/modes"))
  (elisp-load-dir (expand-file-name "~/.emacsrc/preferences")))

(add-hook 'after-init-hook #'startup-after-init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "d30a78ecaf43c9816c328d4361b3ca21bafb49c6dee4da680997bd98b9e07787" "357d5abe6f693f2875bb3113f5c031b7031f21717e8078f90d9d9bc3a14bcbd8" "0022e0b80aaf697a4dc41322d5270aff5c4dae342c09a559abb91fd2bc64e755" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(package-selected-packages
   (quote
    (uuidgen company purescript-mode psc-ide markdown-mode racket-mode paredit dockerfile-mode docker shakespeare-mode projectile intero mo-git-blame hindent julia-mode julia-repl julia-shell hasky-stack tuareg caml flycheck-purescript psci eshell-prompt-extras color-theme-sanityinc-solarized color-theme projectile-codesearch nix-mode yaml-mode magit)))
 '(purescript-mode-hook (quote (turn-on-purescript-indent)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "green"))))
 '(erc-nick-default-face ((t (:foreground "cyan" :weight bold))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Red"))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil)))
 '(paren-face ((((class color)) (:foreground "gray51"))))
 '(projmake-errline ((t (:foreground "#dc322f" :bold t :slant normal))))
 '(projmake-warnline ((t (:foreground "orange" :bold t :slant normal)))))
(put 'dired-find-alternate-file 'disabled nil)
