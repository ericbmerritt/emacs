(defun filter-list (condp lst)
  (delq nil
	(mapcar (lambda (x) (and (funcall condp x) x)) lst)))