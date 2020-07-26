;;

(use-package nxml-mode
  :mode         "\\.xml\\'"
  :init
  (setq xml-child-indent		4
        xml-attribute-indent		4
        xml-slash-auto-complete-flag	t)
  )

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

