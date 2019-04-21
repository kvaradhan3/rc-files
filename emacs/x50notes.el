
(require 'notes-variables)

(defun notes-mkall ()
  "Run mkall as needed"
  (interactive)
  (let* ((notes-mkall-cmd (concat notes-utility-dir "/mkall")))
    (call-process notes-mkall-cmd nil t nil)))

(add-hook 'notes-variables-load-hooks 'notes-mkall)

(provide 'rc/50notes)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

