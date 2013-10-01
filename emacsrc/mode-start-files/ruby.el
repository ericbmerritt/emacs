
(defun my-ruby-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project)
  (flyspell-prog-mode))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
