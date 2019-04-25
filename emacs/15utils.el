
(defun shell-find (dir)
  "Find all files in a directory, depth first"
  (interactive)
  (let ((ret ())
	(dirlist (directory-files (expand-file-name dir) t)))
    (dolist (file dirlist)
      (unless (or (string-match-p "/\\.\\.$" file)
		  (string-match-p "/\\.$"   file))
	(if (file-directory-p file)
	    (nconc dirlist (directory-files (expand-file-name file) t))
	  (if ret
	      (nconc ret (list file))
	    (setq ret (list file))))))
    ret
    ))

(defun basename (path)
  "man (1) basename"
  (interactive)
  (file-name-nondirectory (directory-file-name path)))

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

