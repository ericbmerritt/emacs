(add-mode-path "/projmake-mode")
(add-mode-path "/distel/elisp")
(add-mode-path "/company-distel")

(defvar erlang-root-dir "/usr/local/lib/erlang/")

(setq load-path (cons  (concat (file-name-as-directory erlang-root-dir)
                               "lib/tools-2.6.8/emacs")
                       load-path))

(require 'projmake-mode)
(require 'erlang-start)

;;
;; Setup Distel
;;
(require 'distel)
(distel-setup)

(defun my-erlang-mode-hook ()
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
