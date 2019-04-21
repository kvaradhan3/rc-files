(defun where-is-this-library (library)
  "Find the directory where a library is to be found"
  (interactive "sLibrary? ")
  (let ((found 0))
    (dolist (dir load-path)
      (if (file-exists-p (concat dir "/" library))
	  (progn
	    (setq found (+ found 1))
	    (message "\t%d.  %s" found dir)
	    )))
    (if (= found 0)
	(message "%s is not in your load-path" library))
    ))

(defun q-print-list (lst)
  "Dump a list in readable format"
  (interactive "vList-name? ")
  (princ (format "%s = " 'lst))
  (if (nlistp lst)
      (progn
	(princ (format "%s\n" lst)))
    (progn
      (princ (format "(\n"))
      (dolist (elt lst)
	(princ (format "\t%s\n" elt)))
      (princ (format ")\n")))
    ))

(provide 'rc/80quickies)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

