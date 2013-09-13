(add-to-list 'auto-mode-alist
             '("\\.*mutt-*\\|.article\\|\\.followup"
                . mail-mode))






(defun mutt ()
  (interactive "")
  (set-buffer (ansi-term "/usr/bin/mutt"))
  (rename-buffer "mutt"))
