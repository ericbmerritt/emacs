;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
(define-derived-mode joxa-mode lisp-mode "Joxa Editing Mode" "Major mode for editing Joxa files"

  (font-lock-add-keywords 'joxa-mode
                          '(("module" . font-lock-keyword-face)
                            ("deftype" . font-lock-keyword-face)
                            ("defspec" . font-lock-keyword-face)
                            ("definline" . font-lock-keyword-face)
                            ("defn+" . font-lock-keyword-face)
                            ("defn" . font-lock-keyword-face)
                            ("__try" . font-lock-keyword-face)
                            ("use" . font-lock-keyword-face)
                            ("ns" . font-lock-keyword-face)
                            ("fn" . font-lock-keyword-face)))

  (define-key joxa-mode-map "{" 'paredit-open-curly)
  (define-key joxa-mode-map "}" 'paredit-close-curly)

  (modify-syntax-entry ?[ "(]" )
  (modify-syntax-entry ?] ")[" )

  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){"))

(add-hook 'joxa-mode-hook '(lambda ()
                             (require 'projmake-mode)
                             (paredit-mode)
                             (require 'parenface)
                             (projmake-mode)
                             (projmake-search-load-project)
                             (set-face-foreground 'paren-face "#073642")))

 (add-to-list 'auto-mode-alist '("\\.jxa\\'" . joxa-mode))


(custom-set-faces
 '(projmake-errline ((t (:foreground "#dc322f" :bold t :slant normal))))
 '(projmake-warnline ((t (:foreground "orange" :bold t :slant normal)))))
