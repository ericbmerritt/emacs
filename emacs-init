
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
