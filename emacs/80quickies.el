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

