(autoload 'yaml-mode "yaml-mode" "Major mode for yaml files" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-hook 'yaml-mode-hook
	  (lambda ()
	    (define-key yaml-mode-map "\C-m" 'newline-and-indent)
	    (setq yaml-indent-offset 4)
	    ))

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:


