
(when (equal system-type 'darwin)
  (add-to-list 'exec-path "/opt/local/bin"))

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path (expand-file-name "~/bin"))
(add-to-list 'exec-path (expand-file-name "~/.nix-profile/bin"))

(let ((path (getenv "PATH")))
  (setenv "PATH" (concat (expand-file-name "~/bin") ":"
                         (expand-file-name "~/.cabal/bin") ":"
                         "/usr/local/bin:/opt/local/bin" ":" path)))

;; (let* ((root-elisp-path "/run/current-system/sw/share/emacs")
;;        (version-root-elisp-path (concat root-elisp-path "/" (number-to-string emacs-major-version) "." (number-to-string emacs-minor-version))))
;;      (add-to-list 'load-path (concat root-elisp-path "/site-lisp"))
;;      (add-to-list 'load-path (concat version-root-elisp-path "/site-lisp"))
;;      (add-to-list 'load-path (concat version-root-elisp-path "/lisp")))
