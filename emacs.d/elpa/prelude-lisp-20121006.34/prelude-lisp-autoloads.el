;;; prelude-lisp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-lisp" "prelude-lisp.el" (20637 35001))
;;; Generated autoloads from prelude-lisp.el

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)

(defun prelude-lisp-coding-defaults nil (paredit-mode 1) (rainbow-delimiters-mode 1))

(setq prelude-lisp-coding-hook 'prelude-lisp-coding-defaults)

(defun prelude-interactive-lisp-coding-defaults nil (paredit-mode 1) (rainbow-delimiters-mode 1) (whitespace-mode -1))

(setq prelude-interactive-lisp-coding-hook 'prelude-interactive-lisp-coding-defaults)

;;;***

;;;### (autoloads nil nil ("prelude-lisp-pkg.el") (20637 35001 624157))

;;;***

(provide 'prelude-lisp-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-lisp-autoloads.el ends here
