;;; projmake-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "projmake-discover" "projmake-discover.el"
;;;;;;  (21621 63912 0 0))
;;; Generated autoloads from projmake-discover.el

(autoload 'projmake-discover/search-load-project "projmake-discover" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "projmake-mode" "projmake-mode.el" (21621 63912
;;;;;;  0 0))
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

(defvar projmake-log/level -1 "\
Logging level, only messages with level lower or equal will be
logged. -1 = NONE, 0 = ERROR, 1 = WARNING, 2 = INFO, 3 = DEBUG")

(custom-autoload 'projmake-log/level "projmake-mode" t)

(defvar projmake-project-descs '(("Make" "Makefile" "nice -n5 make") ("Ocaml" "myocamlbuild.ml" "nice -n5 ocaml setup.ml -build" (projmake-ocaml-parse-engine/make)) ("Rebar" "rebar.config" "nice -n5 rebar skip_deps=true compile")) "\
These are the default names + dominating files + commands needed to
automatically search for the project root and build system style")

(custom-autoload 'projmake-project-descs "projmake-mode" t)

(defvar projmake-show-build-output-buffer nil "\
Usually you don't need to see the build output buffer, but sometimes you need
to . This lets you control displaying that buffer (though it still exists)")

(custom-autoload 'projmake-show-build-output-buffer "projmake-mode" t)

(defvar projmake-show-error-list-buffer t "\
Usually its nice to see the error-list buffer, but sometimes it gets
annoying. This lets you disable displaying that buffer (though it still exists)
if you don't want to see it..")

(custom-autoload 'projmake-show-error-list-buffer "projmake-mode" t)

(defvar projmake-file-name-elements-to-display-in-error-buffer 2 "\
The number of file name elements to display in the error buffer. ")

(custom-autoload 'projmake-file-name-elements-to-display-in-error-buffer "projmake-mode" t)

(defvar projmake-mode/toggled)

(autoload 'projmake-mode/toggle "projmake-mode" "\
Togle projmake on or off depending on what projmake-toggle is set
to

\(fn)" t nil)

(autoload 'projmake-mode/on "projmake-mode" "\
Turn projmake building on for a buffer

\(fn)" t nil)

(autoload 'projmake-mode/off "projmake-mode" "\
Turn projmake off

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("projmake-banner.el" "projmake-build-state.el"
;;;;;;  "projmake-default-parse-engine.el" "projmake-elmm.el" "projmake-error.el"
;;;;;;  "projmake-log.el" "projmake-markup.el" "projmake-mode-pkg.el"
;;;;;;  "projmake-ocaml-parse-engine.el" "projmake-parse-engine.el"
;;;;;;  "projmake-project.el" "projmake-util.el") (21621 63912 814041
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; projmake-mode-autoloads.el ends here
