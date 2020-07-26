(defun kv/print-list (lst)
  "Dump a list in readable format"
  (interactive "vList-name? ")
  (princ (format "%s = " 'lst))
  (if (nlistp lst)
      (princ (format "%s\n" lst))
    (progn
      (princ (format "(\n"))
      (dolist (elt lst)
	(princ (format "\t%s\n" elt)))
      (princ (format ")\n")))
    ))

(defconst tidbits
    (list 
        "https://www.gnu.org/software/emacs/manual/html_node/elisp/Library-Search.html#Library-Search
\t— Command: locate-library library &optional nosuffix path interactive-call
\t— Command: list-load-path-shadows &optional stringp
"
    ))

(defun README ()
  "Emacs tips I want to see when I am on it, things I keep forgetting"
  (interactive)
  (kv/print-list tidbits))

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
