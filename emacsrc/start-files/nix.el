(add-mode-path "/nix-sandbox")

(require 'nix-sandbox)

(setq flycheck-command-wrapper-function
      (lambda (command) (apply 'nix-shell-command (nix-current-sandbox) command)))

(setq flycheck-executable-find
              (lambda (cmd) (nix-executable-find (nix-current-sandbox) cmd)))
