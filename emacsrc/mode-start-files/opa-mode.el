(add-mode-path "/opa-mode")

(defun my-opa-mode-hook ()
  (projmake-mode)
  (projmake-search-load-project)
  (flyspell-prog-mode))

(add-hook 'opa-mode-hook 'my-opa-mode-hook)

(require 'opa-start)
