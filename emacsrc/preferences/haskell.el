;; if ./cabal/bin is not in your $PATH
(setq scion-program "~/.cabal/bin/scion-server")

(defun my-haskell-hook ()
  (projmake-mode)
  (projmake-search-load-project)
  (flyspell-prog-mode)

  ;; Whenever we open a file in Haskell mode, also activate Scion
  (scion-mode 1)
  ;; Whenever a file is saved, immediately type check it and
  ;; highlight errors/warnings in the source.
  (scion-flycheck-on-save 1))

(add-hook 'haskell-mode-hook 'my-haskell-hook)

;; Use ido-mode completion (matches anywhere, not just beginning)
;;
;; WARNING: This causes some versions of Emacs to fail so badly
;; that Emacs needs to be restarted.
(setq scion-completing-read-function 'ido-completing-read)
