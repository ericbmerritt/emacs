(add-to-list 'load-path (concat
     (replace-regexp-in-string "\n$" ""
        (shell-command-to-string "opam config var share"))
     "/emacs/site-lisp"))

(require 'ocp-indent)
(require 'merlin)

(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

(defun my-ocaml-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project))

(add-hook 'tuareg-mode-hook 'my-ocaml-mode-hook)

(add-to-list 'auto-mode-alist '("\\.atd$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("_oasis\\'" . haskell-cabal-mode))
(add-hook 'haskell-cabal-mode-hook 'my-ocaml-mode-hook)

(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)

(global-set-key "\C-z"  'completion-at-point)
