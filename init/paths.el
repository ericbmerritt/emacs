
(when (equal system-type 'darwin)
  (add-to-list 'exec-path "/opt/local/bin"))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path (expand-file-name "~/bin"))

(let ((path (getenv "PATH")))
  (setenv "PATH" (concat (expand-file-name "~/bin") ":"
                         (expand-file-name "~/.cabal/bin") ":"
                         "/usr/local/bin:/opt/local/bin" ":" path)))
