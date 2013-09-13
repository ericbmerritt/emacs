(defun djcb-term-start-or-switch (prg &optional use-existing)
  "* run program PRG in a terminal buffer. If USE-EXISTING is non-nil "
  " and PRG is already running, switch to that buffer instead of starting"
  " a new instance."
  (interactive)
  (let ((bufname (concat "*" prg "*")))
    (when (not (and use-existing
                    (let ((buf (get-buffer bufname)))
                      (and buf (buffer-name (switch-to-buffer bufname))))))
      (ansi-term prg prg))))

(defmacro djcb-program-shortcut (name key &optional use-existing)
  "* macro to create a key binding KEY to start some terminal program PRG;
    if USE-EXISTING is true, try to switch to an existing buffer"
  `(global-set-key ,key
     '(lambda()
        (interactive)
        (djcb-term-start-or-switch ,name ,use-existing))))



(djcb-program-shortcut "zsh"   (kbd "<f1>") t)  ; the ubershell
(djcb-program-shortcut "mutt"  (kbd "<f2>") t)  ; mail client

(setq term-default-bg-color (face-background 'default))
(setq term-default-fg-color (face-foreground 'default))
