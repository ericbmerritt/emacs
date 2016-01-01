(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)
(setq hindent-style "gibiansky")


(defun my-haskell-mode ()
  (flycheck-mode)
  (hindent-mode)
  (setq haskell-process-wrapper-function
        (lambda (args)
          (apply 'nix-shell-command (nix-current-sandbox) args))))

(add-hook 'haskell-mode-hook #'my-haskell-mode)
