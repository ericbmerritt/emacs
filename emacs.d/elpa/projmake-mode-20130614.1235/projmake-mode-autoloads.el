;;; projmake-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (projmake-search-load-project) "projmake-extras"
;;;;;;  "projmake-extras.el" (21043 23982 0 0))
;;; Generated autoloads from projmake-extras.el

(autoload 'projmake-search-load-project "projmake-extras" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (projmake-off projmake-on projmake-toggle projmake-mode
;;;;;;  projmake-switch-to-buffer-with-error projmake-project-descs
;;;;;;  projmake-log-level projmake-build-now! projmake-project-file-name)
;;;;;;  "projmake-mode" "projmake-mode.el" (21043 23982 0 0))
;;; Generated autoloads from projmake-mode.el

(defface projmake-errline '((((class color) (background dark)) (:background "Firebrick4" :italic)) (((class color) (background light)) (:background "LightPink" :italic)) (t (:bold t))) "\
Face used for marking error lines." :group (quote projmake))

(defface projmake-warnline '((((class color) (background dark)) (:background "DarkBlue")) (((class color) (background light)) (:background "LightBlue2")) (t (:bold t))) "\
Face used for marking warning lines." :group (quote projmake))

(defface projmake-notify-err '((t (:foreground "red" :weight bold :background "white"))) "\
Face used for the header line notification on error." :group (quote projmake))

(defface projmake-notify-normal '((t (:foreground "black" :weight bold :background "white"))) "\
Face used for header line notification on normal notifications." :group (quote projmake))

(defvar projmake-project-file-name "projmake" "\
The name of the 'projmake' description file that indicates the root
of each project")

(custom-autoload 'projmake-project-file-name "projmake-mode" t)

(defvar projmake-build-now! t "\
Indicates whether the current build (if one exists) is killed and
  restarted when ever a relevant build event occurs. If t the current
  running build is killed and a new build started. If nil a marker is
  set on the project such that when the build terminates naturally a
  new build is started immediately")

(custom-autoload 'projmake-build-now! "projmake-mode" t)

(defvar projmake-log-level -1 "\
Logging level, only messages with level lower or equal will be logged.
-1 = NONE, 0 = ERROR, 1 = WARNING, 2 = INFO, 3 = DEBUG")

(custom-autoload 'projmake-log-level "projmake-mode" t)

(defvar projmake-project-descs '(("Make" "Makefile" "nice -n5 make") ("Rebar" "rebar.config" "nice -n5 rebar skip_deps=true compile")) "\
These are the default names + dominating files + commands needed to
automatically search for the project root and build system style")

(custom-autoload 'projmake-project-descs "projmake-mode" t)

(defvar projmake-switch-to-buffer-with-error t "\
Some build systems stop building at the first file that errors. So
it could be that even if there are errors in the project the user
doesn't know it because the buffer that is active has no errors. If
`projmake-switch-to-buffer-with-error' is t then the system checks to
see if there are errors in the current buffer, if so nothing happens,
but if there are no errors then the first buffer with errors is made
active.")

(custom-autoload 'projmake-switch-to-buffer-with-error "projmake-mode" t)

(autoload 'projmake-mode "projmake-mode" "\
Toggle projmake-mode

   enables or disables the mode

\(fn &optional ARG)" t nil)

(autoload 'projmake-toggle "projmake-mode" "\
Togle projmake on or off depending on what projmake-toggle is set to

\(fn)" t nil)

(autoload 'projmake-on "projmake-mode" "\
Turn projmake building on for a buffer

\(fn)" t nil)

(autoload 'projmake-off "projmake-mode" "\
Turn projmake off

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("projmake-error-parsing.el" "projmake-markup.el"
;;;;;;  "projmake-mode-pkg.el" "projmake-project.el" "projmake-util.el")
;;;;;;  (21043 23982 480621 0))

;;;***

(provide 'projmake-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; projmake-mode-autoloads.el ends here
