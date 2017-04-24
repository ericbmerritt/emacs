(require 'package-support)

(psp-install-package 'guide-key)


(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p" "C-c C-c"))

(guide-key-mode 1)
