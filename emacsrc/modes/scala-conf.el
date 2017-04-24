(require 'package-support)

(psp-install-package 'company)
(psp-install-package 'dash)
(psp-install-package 'popup)
(psp-install-package 's)
(psp-install-package 'sbt-mode)
(psp-install-package 'scala-mode)
(psp-install-package 'ensime)

(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook (lambda () (subword-mode t)))

(defun scalafmt-buffer ()
  (interactive)
  (setq orig-point (point))
  (call-process-region
   (point-min) (point-max)
   "scalafmt"
   t ;; delete source region
   t ;; insert output into buffer
   nil ;; don't stream in results
   "--config-str" "rewrite.rules=[RedundantParens,SortImports]"
   "--stdin"
   "--assume-filename" (file-name-nondirectory buffer-file-name))
  (goto-char orig-point))

(defun scalafmt-before-save ()
  (interactive)
  (when (eq major-mode 'scala-mode) (scalafmt-buffer)))
