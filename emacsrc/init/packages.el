(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

; list the packages you want
(setq package-list
      '(intero
        color-theme
        color-theme-solarized
        helm
        feature-mode
        flycheck
        magit
        magit-popup
        markdown-mode
        ponylang-mode
        terraform-mode
        yaml-mode
        nix-mode
        yasnippet))


; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
