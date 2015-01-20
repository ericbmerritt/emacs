(defun my-shell-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project))

(add-hook 'sh-mode-hook 'my-shell-mode-hook)
