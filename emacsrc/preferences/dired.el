;; allow dired to be able to delete or copy a whole dir.
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))
;; “always” means no asking.
;; “top” means ask once (top = top dir).
;; any other symbol means ask each and every time for a dir and subdir.

(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "<return>")
    'dired-find-alternate-file) ; was dired-advertised-find-file
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))

