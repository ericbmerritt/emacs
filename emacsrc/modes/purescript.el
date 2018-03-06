(require 'psc-ide)
(require 'purescript-mode)

(add-hook 'purescript-mode-hook
          (lambda ()
            (psc-ide-mode)
            (company-mode)
            (global-set-key (kbd "C-,") 'company-complete)
            (flycheck-mode)
            (turn-on-purescript-indentation)))

(customize-set-variable 'psc-ide-rebuild-on-save t)
