(require 'cscope)

(defun my-c-mode-hook ()
  (flymake-mode)
  (flyspell-prog-mode))

(add-hook 'c-mode-hook 'my-c-mode-hook)
