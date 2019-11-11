;;
;; Fix up the load path with what's desired.
;;

(setq additional-directories
      '("/usr/local/share"
	"~/lib"
	"/Applications/MacPorts/Emacs.app/Contents/share")
)

;; (setq additional-directories '("/Users/kvaradha/src/emacs-w3m"))
;; (add-to-list 'load-path "/Users/kvaradha/src/emacs-w3m")

(let ((addl-dirs additional-directories) (directory) (default-directory))
  (while (setq directory (car addl-dirs))
    (setq default-directory (expand-file-name
                             (format "%s/emacs/site-lisp" directory)))
    (condition-case err
	(progn
	  (normal-top-level-add-to-load-path '("."))
	  (normal-top-level-add-subdirs-to-load-path)
	  )
      (error "%s" err))
    (add-to-list 'Info-default-directory-list (format "%s/info" directory))
    (setq addl-dirs (cdr addl-dirs))))


;;; (add-to-list 'exec-path "/opt/local/bin")
;;; (add-to-list 'exec-path "/opt/local/sbin")

(when (memq window-system '(mac ns))
  (condition-case err
      (exec-path-from-shell-initialize)
    (error
       (signal (car err) '("Is exec-path-from-shell installed?")))))

(setq debug-on-error t)

(add-hook 'before-save-hook	'time-stamp)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
