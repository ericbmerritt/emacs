(defun my-makefile-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project))

(add-hook 'makefile-mode-hook 'my-makefile-mode-hook)
