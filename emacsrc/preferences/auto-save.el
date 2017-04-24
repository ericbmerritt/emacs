; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings 'super)

(defun save-buffer-if-required ()
  (when (and buffer-file-name (buffer-modified-p))
     (save-buffer)))

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defadvice switch-to-buffer (before save-buffer-now activate)
  (save-buffer-if-required))
(defadvice other-window (before other-window-now activate)
  (save-buffer-if-required))
(defadvice windmove-up (before other-window-now activate)
  (save-buffer-if-required))
(defadvice windmove-down (before other-window-now activate)
  (save-buffer-if-required))
(defadvice windmove-left (before other-window-now activate)
  (save-buffer-if-required))
(defadvice windmove-right (before other-window-now activate)
  (save-buffer-if-required))

(setq auto-save-visited-file-name t)
