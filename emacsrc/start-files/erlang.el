(add-mode-path "/distel/elisp")

(require 'yasnippet)

(defvar erlang-root-dir "/run/current-system/sw/lib/erlang/")

(defun get-erlang-tools-dir (root-dir)
  (let* ((lib-dir (expand-file-name "lib" root-dir))
         (tools-dir (first (sort (directory-files lib-dir nil "^tools-.+")
                                 'string<))))
    (expand-file-name tools-dir lib-dir)))


(defun set-erlang-tools-path (root-dir)
  (let ((tools-dir (expand-file-name "emacs" (get-erlang-tools-dir root-dir))))
    (setq load-path (cons  tools-dir load-path))))



;; Yas setup
(add-to-list 'yas-snippet-dirs (relative-mode-path "/erlang-snippets"))
(yas-reload-all)


(require 'erlang-start)

(defun my-erlang-mode-hook ()
  (setq erlang-indent-level 4)
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  (flyspell-prog-mode)
  (yas-minor-mode))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

;; Setup the metadata files to open in erlang mode as well

(add-to-list 'auto-mode-alist '("\\.app$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.app.src$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.rel$" . erlang-mode))
(add-to-list 'auto-mode-alist '("rebar.config" . erlang-mode))
(add-to-list 'auto-mode-alist '("relx.config" . erlang-mode))

(set-erlang-tools-path erlang-root-dir)
