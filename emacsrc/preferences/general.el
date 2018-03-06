;;;
;;; Primary functionality group
;;;
(setq inhibit-startup-message t)    ; no stupid messages about who did what

(setq scroll-step 1)           ; Scroll by 1 line damnit!
(setq scroll-conservatively 1) ; I really mean it!
(setq scroll-up-aggressively .00000001) ; hard to scroll by one?
(setq scroll-down-aggressively .00000001) ; grrr


(line-number-mode 1)                ; Line number please
(column-number-mode 1)              ; Column number please
(temp-buffer-resize-mode t)         ; Size the tempbuffer according to contents.
;(resize-minibuffer-mode)            ; Size the minibuffer according to contents.
(setq display-time-day-and-date t)
(display-time)

;;; buffer switching stuff
;(iswitchb-default-keybindings)  Show me my completions please
;(iswitchb-mode 1)              ; Show me my completions please
;(setq iswitchb-case nil) ; completions are case sensitive.


;; File Manipulation stuff

(setq require-final-newline nil) ;add a newline at end of the file if
                               ;isn't one.
(setq indent-tabs-mode nil)
(setq next-line-add-newlines nil)   ; don't let me add newlines at the EOF
(add-hook 'write-file-hooks 'time-stamp) ; Add time stamps


;; Remove the annoying redundancy. When I type `y', I mean `y'.
(fset 'yes-or-no-p 'y-or-n-p)

;;;
;;; disable backup files
;;;
;disable backup
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-visited-file-name t)

(if window-system ;;; Win32 or X11 or Visual display et al...
    (progn
          ;;; Fun for the whole GUI
      (setq-default mouse-yank-at-point t) ; Yank at the point, not at cursor
      (setq search-highlight t)            ; Highlight current search result.

      )) ;;; end GUI stuff


;; tryin' this out
(setq enable-recursive-minibuffers t)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Delete trailing whitespace
(add-hook 'write-file-functions 'delete-trailing-whitespace)

(setenv "PAGER" "/run/current-system/sw/bin/cat")
(setenv "EDITOR" "/run/current-system/sw/bin/emacsclient") ; `which emacsclient`

(put 'set-goal-column 'disabled nil)

(defun kill-whitespace ()
          "Kill the whitespace between two non-whitespace characters"
          (interactive "*")
          (save-excursion
            (save-restriction
              (save-match-data
                (progn
                  (re-search-backward "[^ \t\r\n]" nil t)
                  (re-search-forward "[ \t\r\n]+" nil t)
                  (replace-match "" nil nil))))))
