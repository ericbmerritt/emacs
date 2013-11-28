(defun my-ocaml-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project))

(add-hook 'tuareg-mode-hook 'my-ocaml-mode-hook)

(add-to-list 'auto-mode-alist '("_oasis\\'" . haskell-cabal-mode))
(add-hook 'haskell-cabal-mode-hook 'my-ocaml-mode-hook)
