;; Handle ANSI color sequences nicely.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq initial-frame-alist default-frame-alist)
(global-font-lock-mode 1)
(interactive)
(set-cursor-color "#FFFFFF")

(require 'paren)                        ; this is cool too
(show-paren-mode 't)
(setq show-paren-style 'mixed)
(set-face-foreground 'show-paren-match-face nil)
(set-face-background 'show-paren-match-face "blue")
;(resize-minibuffer-mode)                ; this is cool
(setq resize-minibuffer-window-max-height 5)

(require 'parenface)

(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(cursor ((t (:background "green"))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Red"))))
 '(paren-face ((((class color)) (:foreground "gray51")))))
