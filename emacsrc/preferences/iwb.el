(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;; no tabs by default. modes that really need tabs should enable
;; indent-tabs-mode explicitly. makefile-mode already does that, for
;; example.
 (setq-default indent-tabs-mode nil)

 ;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks
          (lambda ()
            (if (not indent-tabs-mode)
                (untabify (point-min) (point-max)))
            nil))
