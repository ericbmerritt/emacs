(require 'package-support)

(psp-install-package 'markdown-mode)

(add-to-list
 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun my-markdown-mode-hook ()
  (flyspell-mode))

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
