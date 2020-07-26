(require 'gnutls)
(dolist (dir (directory-files "/etc/ssl/certs" t ".*\\.pem\\|.*\\.crt"))
  (add-to-list 'gnutls-trustfiles dir t))

;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
