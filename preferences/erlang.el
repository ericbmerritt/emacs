
(defvar erlang-root-dir "/usr/local/lib/erlang/")

(require 'erlang-start)

(defun my-erlang-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project)
  (setq erlang-indent-level 4)
  (flyspell-prog-mode))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

;; Setup the metadata files to open in erlang mode as well

 (add-to-list 'auto-mode-alist '("\\.app$" . erlang-mode))
 (add-to-list 'auto-mode-alist '("\\.app.src$" . erlang-mode))
 (add-to-list 'auto-mode-alist '("\\.rel$" . erlang-mode))
 (add-to-list 'auto-mode-alist '("rebar.config" . erlang-mode))
 (add-to-list 'auto-mode-alist '("relcool.config" . erlang-mode))

