(autoload 'bison-mode "bison-mode.el")
(add-to-list 'auto-mode-alist           '("\\.y$" . bison-mode))
(add-to-list 'auto-mode-alist           '("\\.bison$" . bison-mode))

(autoload 'flex-mode "flex-mode")
(add-to-list 'auto-mode-alist           '("\\.l$" . flex-mode))
(add-to-list 'auto-mode-alist           '("\\.lex$" . flex-mode))

(add-hook 'c-mode-common-hook
	  '(lambda ()

	     ;;;
	     ;;; Set the default parameters implicitly.
	     ;;;
	     (c-set-style "bsd")
	     
	     (setq c-basic-offset        4)

	     ;;; Given the plethora of editors that abound, ensure
	     ;;; that indent tabs get converted to spaces uniformly.
	     (setq indent-tabs-mode    nil)

	     (setq c-cleanup-list '(brace-else-brace
				    brace-elseif-brace
				    ;;; empty-defun-braces
				    defun-close-semi
				    scope-operator))
	     (setq comment-column       40) 
	     (append c-cleanup-list '(space-before-funcall))
	     ))

;;;
;;; THe next two hooks require packages that I have local copies for.
;;; If you can't find them, use, by uncommenting, the following load
;;; instructions. below
;;;
;;; (setq load-path (append (list (expand-file-name "~kannanv/.emacsrc/lib"))
;;;			load-path))

;;;
;;; C Scope definitions
;;;
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (setq cscope:mode 'cscope)))

(add-hook 'c-mode-hook
	  '(lambda ()
	     (setq cscope:mode:default 'cscope)
	     (if (not (boundp 'cscope:mode))
		 (setq cscope:mode cscope:mode:default))
	     (require cscope:mode)
             (message "Loading c-mode-common-hook for %s... done" cscope:mode)
	     (when (equal cscope:mode 'cscope)
	       (setq cscope-bindings-2deep t
		     cscope-bindings-3deep nil) ; cc mode uses \C-c\C-s,
						; but not as a prefix.
	       (cscope-bind-keys))
	  ))

;;;
;;; Comment fill.
;;;
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (require 'filladapt)
	     (c-setup-filladapt)
	     (filladapt-mode 1)))

;;;
;;; Typing preferences.
;;;
(add-hook 'c-mode-common-hook
	  '(lambda ()

	     ;;; A # on the first line will always align left
	     ;;; implicitly.
	     (setq c-electric-pound-behavior '(alignleft))

	     ;;; A single delete keystroke will eat up all previous empty space.
	     (c-toggle-auto-hungry-state 1)

	     ;;; A TAB in the first column (before any non-white-space
	     ;;; char) will force indentation
	     (setq c-tab-always-indent nil)

	     ;;; These are C++ snugness qualifications.
	     (setq c-hanging-braces-alist
		   (append '((class-open after)
			     (class-close before)
			     (inline-open)
			     (inline-close after)
			     ) c-hanging-braces-alist))
	     ))


;;;
;;; Keystroke remaps.
;;;
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (define-key c-mode-map "\C-ct" 'tags-search)
	     (define-key c-mode-map "\C-m"  'newline-and-indent)
	     (define-key c-mode-map "\M-q"   'c-fill-paragraph)
	     ))

;;;
;;; Use C mode to edit proto files
;;;
(setq auto-mode-alist
      (append '(("\\.proto$"    . c-mode)
                ) auto-mode-alist))


(provide 'rc/20c)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

