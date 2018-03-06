
;;;;
;;;; Begin Mode Specific stuff
;;;;
;;;;

(setq *eshell-count* 1)

(defun neshell ()
  (interactive)
  (eshell)
  (rename-buffer (concat "s" (number-to-string *eshell-count*)))
  (setq *eshell-count* (+ 1 *eshell-count*)))

(defun neshell-reset()
  (interactive)
  (setq *eshell-count* 0)
  (neshell))

(setq eshell-rc-script "~/.eshellrc")

;;;
;;; Eshell stuff
;;;
(when (fboundp 'eshell)

  (with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

  ;; This and rmb are my two vices. rmb is defined as an eshell alias.
  (defalias 'eshell/lo #'eshell/exit)

  (defalias 'eshell/logout #'save-buffers-kill-emacs)

  ;; I'm obsessive/compulsive with clear.
  (defun eshell/clear ()
    "\"Clear the screen,\" as it were."
    (recenter 0))

  (defun eshell/emacs (&rest args)
    "Open a file in emacs. Some habits die hard."
    (if (null args)
        ;; If I just ran "emacs", I probably expect to be launching
        ;; Emacs, which is rather silly since I'm already in Emacs.
        ;; So just pretend to do what I ask.
        (bury-buffer)
      ;; We have to expand the file names or else naming a directory in an
      ;; argument causes later arguments to be looked for in that directory,
      ;; not the starting directory
      (mapc #'find-file
            (mapcar #'expand-file-name
                    (eshell-flatten-list (reverse args))))))


  (defalias 'eshell/emacsclient #'eshell/emacs)
  (defalias 'eshell/edit #'eshell/emacs))


;;; End eshell stuff

;;; Trailing Whitespace
;;;
(setq-default show-trailing-whitespace t)

;;; End Trailing Whitespace


;;;
;;; Common Tabbing Code
;;;
(setq dabbrev-case-replace nil)
(setq dabbrev-case-fold-search nil)
(defun c-tab-indent-or-complete ()
  (interactive)
  (if (and
       (equal (current-column)
              (tab-test))
       (not (is-right-of-whitespace)))
      (dabbrev-completion)))

(defun tab-test ()
  (interactive)
  (c-indent-command)
  (current-column))

(defun is-right-of-whitespace ()
  (interactive)
  (if (or
       (equal "\t" (char-to-string (char-before)))
       (equal " "  (char-to-string (char-before)))
       (equal "\n" (char-to-string (char-before)))
       (equal "\l" (char-to-string (char-before))))
      't
    nil))

(defalias 'qrr 'query-replace-regexp)

(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))
