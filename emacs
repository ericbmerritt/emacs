
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
;;;; It loads the mode-start-files directory first, then the preferences directory.
;;;; This allows the preferences to override anything set in the mode-start-files.
;;;;
;;;; If you have anything that absolutly must be run before anything else drop it init
;;;; directory.
;;;;

(setq *mode-root* (expand-file-name "~/.emacsrc/modes"))
(setq *tmp-root* (expand-file-name "~/.emacsrc/tmp"))

(defun add-mode-path (path)
  "Add a mode in the modes file to the root path"
    (add-to-list 'load-path (concat *mode-root* path)))

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

(elisp-load-dir (expand-file-name "~/.emacsrc/mode-start-files"))
(elisp-load-dir (expand-file-name "~/.emacsrc/preferences"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "green"))))
 '(erc-nick-default-face ((t (:foreground "cyan" :weight bold))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Red"))))
 '(paren-face ((((class color)) (:foreground "gray51"))))
 '(projmake-errline ((t (:foreground "#dc322f" :bold t :slant normal))))
 '(projmake-warnline ((t (:foreground "orange" :bold t :slant normal)))))
