(require 'projmake-mode)

(defun my-ruby-mode-hook ()
  (projmake-mode)
  (projmake-search-load-project)
  (flyspell-prog-mode))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
