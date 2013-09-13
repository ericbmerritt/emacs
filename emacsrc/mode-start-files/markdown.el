(add-mode-path "/markdown-mode")

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list
 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun my-markdown-mode-hook ()
  (flyspell-mode))

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)