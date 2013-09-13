;;; prelude-haskell-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-haskell" "prelude-haskell.el" (20662
;;;;;;  51189))
;;; Generated autoloads from prelude-haskell.el

(eval-after-load 'haskell-mode '(progn (defun prelude-haskell-mode-defaults nil (run-hooks 'prelude-prog-mode-hook) (subword-mode 1) (turn-on-haskell-doc-mode) (turn-on-haskell-indentation)) (setq prelude-haskell-mode-hook 'prelude-haskell-mode-defaults) (add-hook 'haskell-mode-hook (lambda nil (run-hooks 'prelude-haskell-mode-hook)))))

;;;***

;;;### (autoloads nil nil ("prelude-haskell-pkg.el") (20662 51189
;;;;;;  118683))

;;;***

(provide 'prelude-haskell-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-haskell-autoloads.el ends here
