;;; prelude-programming-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "prelude-programming" "prelude-programming.el"
;;;;;;  (20637 35000))
;;; Generated autoloads from prelude-programming.el

(defun prelude-ido-goto-symbol (&optional symbol-list) "\
Refresh imenu and jump to a place in the buffer using Ido." (interactive) (unless (featurep (quote imenu)) (require (quote imenu) nil t)) (cond ((not symbol-list) (let ((ido-mode ido-mode) (ido-enable-flex-matching (if (boundp (quote ido-enable-flex-matching)) ido-enable-flex-matching t)) name-and-pos symbol-names position) (unless ido-mode (ido-mode 1) (setq ido-enable-flex-matching t)) (while (progn (imenu--cleanup) (setq imenu--index-alist nil) (prelude-ido-goto-symbol (imenu--make-index-alist)) (setq selected-symbol (ido-completing-read "Symbol? " symbol-names)) (string= (car imenu--rescan-item) selected-symbol))) (unless (and (boundp (quote mark-active)) mark-active) (push-mark nil t nil)) (setq position (cdr (assoc selected-symbol name-and-pos))) (cond ((overlayp position) (goto-char (overlay-start position))) (t (goto-char position))))) ((listp symbol-list) (dolist (symbol symbol-list) (let (name position) (cond ((and (listp symbol) (imenu--subalist-p symbol)) (prelude-ido-goto-symbol symbol)) ((listp symbol) (setq name (car symbol)) (setq position (cdr symbol))) ((stringp symbol) (setq name symbol) (setq position (get-text-property 1 (quote org-imenu-marker) symbol)))) (unless (or (null position) (null name) (string= (car imenu--rescan-item) name)) (add-to-list (quote symbol-names) name) (add-to-list (quote name-and-pos) (cons name position))))))))

(eval-after-load 'prelude-mode '(define-key prelude-mode-map (kbd "C-c i") 'prelude-ido-goto-symbol))

(defun prelude-local-comment-auto-fill nil (set (make-local-variable 'comment-auto-fill-only-comments) t))

(defun prelude-add-watchwords nil (font-lock-add-keywords nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):" 1 font-lock-warning-face t))))

(require 'which-func)

(which-function-mode 1)

(defun prelude-prog-mode-defaults nil "\
Default coding hook, useful with any programming language." (flyspell-prog-mode) (guru-mode 1) (whitespace-mode 1) (prelude-local-comment-auto-fill) (prelude-add-watchwords) (add-hook (quote before-save-hook) (quote whitespace-cleanup) nil t))

(setq prelude-prog-mode-hook 'prelude-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda nil (run-hooks 'prelude-prog-mode-hook)))

;;;***

;;;### (autoloads nil nil ("prelude-programming-pkg.el") (20637 35000
;;;;;;  789214))

;;;***

(provide 'prelude-programming-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prelude-programming-autoloads.el ends here
