(defun load-helm-config ()
  (require 'helm)
  (require 'helm-config)
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

                                        ; rebind tab to run persistent action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
                                        ; make TAB works in terminal
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
                                        ; list actions using C-z
  (define-key helm-map (kbd "C-z")  'helm-select-action)

  (setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
  
  (global-set-key (kbd "C-x b") 'helm-mini)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

                                        ; open helm buffer inside current window, not occupy whole other window
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-ff-file-name-history-use-recentf t)
  (helm-mode 1))

(add-hook 'after-init-hook (lambda () (message "loaded")(load-helm-config)))
