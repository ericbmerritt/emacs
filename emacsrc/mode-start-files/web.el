(defun my-files-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project)
  (flyspell-prog-mode))

(add-hook 'css-mode-hook 'my-files-mode-hook)
(add-hook 'html-mode-hook 'my-files-mode-hook)
