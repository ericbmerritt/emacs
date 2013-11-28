(add-to-list 'auto-mode-alist '("\\.dust$" . web-mode))

(defun my-web-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project)
  (flyspell-prog-mode))

(add-hook 'web-mode-hook 'my-web-mode-hook)
