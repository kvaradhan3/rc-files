;;

(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
(defun my-xml-mode-hooks ()
  (setq xml-child-indent		4)
  (setq xml-attribute-indent		4)
  (setq xml-slash-auto-complete-flag	t))
(add-hook 'xml-mode-hook	'my-xml-mode-hooks)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

