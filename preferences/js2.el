(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defadvice js2-reparse (before json)
        (setq js2-buffer-file-name buffer-file-name))
(ad-activate 'js2-reparse)

(defadvice js2-parse-statement (around json)
        (if (and (= tt js2-LC)
                        js2-buffer-file-name
                        (string-equal (substring js2-buffer-file-name -5) ".json")
                        (eq (+ (save-excursion
                                                (goto-char (point-min))
                                                (back-to-indentation)
                                                (while (eolp)
                                                        (next-line)
                                                        (back-to-indentation))
                                                (point)) 1) js2-ts-cursor))
                (setq ad-return-value (js2-parse-assign-expr))
                ad-do-it))
(ad-activate 'js2-parse-statement)

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

