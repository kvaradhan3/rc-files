;;
;; Fix up the load path with what's desired.
;;

(setq rc-files-processed nil)
(defun rc-file-done (file-name)
  "Add file-name to rc-files-processed, indicate that it is
   successfully provided."
  (add-to-list 'rc-files-processed file-name)
  (provide file-name)
)

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
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(setq debug-on-error t)

(add-hook 'before-save-hook	'time-stamp)

(rc-file-done 'rc/00startup)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
