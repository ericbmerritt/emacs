(add-mode-path "/projmake-mode")
(add-mode-path "/distel/elisp")
(add-mode-path "/company-distel")

(defvar erlang-root-dir "/usr/local/lib/erlang/")

(defun get-erlang-tools-dir (root-dir)
  (let* ((lib-dir (expand-file-name "lib" root-dir))
         (tools-dir (first (sort (directory-files lib-dir nil "^tools-.+")
                                 'string<))))
    (expand-file-name tools-dir lib-dir)))


(defun set-erlang-tools-path (root-dir)
  (let ((tools-dir (expand-file-name "emacs" (get-erlang-tools-dir root-dir))))
    (setq load-path (cons  tools-dir load-path))))

(set-erlang-tools-path erlang-root-dir)

(require 'erlang-start)

;;
;; Setup Distel
;;
(require 'distel)
(distel-setup)

(defun my-erlang-mode-hook ()
  (require 'projmake-mode)
  (projmake-mode)
  (projmake-search-load-project)
  (setq erlang-indent-level 4)
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  (flyspell-prog-mode))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

;; Setup the metadata files to open in erlang mode as well

 (add-to-list 'auto-mode-alist '("\\.app$" . erlang-mode))
 (add-to-list 'auto-mode-alist '("\\.app.src$" . erlang-mode))
 (add-to-list 'auto-mode-alist '("\\.rel$" . erlang-mode))
 (add-to-list 'auto-mode-alist '("rebar.config" . erlang-mode))
 (add-to-list 'auto-mode-alist '("relx.config" . erlang-mode))
