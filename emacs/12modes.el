;;;(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'auto-mode-alist	'("\\.org$"	. org-mode))
(add-to-list 'auto-mode-alist	'("\\.txt$"	. indented-text-mode))

(add-hook 'text-mode-hook	'turn-on-auto-fill)

(autoload 'bison-mode "bison-mode.el")
(add-to-list 'auto-mode-alist           '("\\.y$" . bison-mode))
(add-to-list 'auto-mode-alist           '("\\.bison$" . bison-mode))

(autoload 'flex-mode "flex-mode")
(add-to-list 'auto-mode-alist           '("\\.l$" . flex-mode))
(add-to-list 'auto-mode-alist           '("\\.lex$" . flex-mode))

(setq-default indent-tabs-mode nil)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

