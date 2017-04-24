(require 'package)

(defun psp-install-package (package)
    (unless (package-installed-p package)
      (package-install package)))

(provide 'package-support)
