(defun chomp (str)
      "Chomp leading and tailing whitespace from STR."
      (let ((s (if (symbolp str) (symbol-name str) str)))
        (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" s)))
