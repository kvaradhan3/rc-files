(use-package cc-mode
  :init
  ;; (c-initialize-cc-mode)
  :bind  (:map c-mode-map
               ("C-c t"         . tags-search)
               ("C-m"           . newline-and-indent)
               ("M-q"           . c-fill-paragraph))

  :config
  (add-hook 'c-mode-common-hook 
            (lambda () (c-set-style "bsd")))

  (setq c-basic-offset          4
        comment-column          40
        indent-tabs-mode        nil         ; convert tabs to spaces
        c-tab-always-indent     nil         ; tab in initial white spc -> indent
        c-electric-pound-behavior '(alignleft) ; # in init white spc -> left
        )
  
  (c-toggle-auto-hungry-state 1)            ; delete =>  chews up all spc
  (setq c-cleanup-list '(
                         brace-else-brace
                         brace-elseif-brace
                         ;; empty-defun-braces
                         defun-close-semi
                         scope-operator
                         space-before-funcall))
  
  (setq c-hanging-braces-alist              ; C++ snugness qualifications.
        (append '((class-open after)
                  (class-close before)
                  (inline-open)
                  (inline-close after)
                  ) c-hanging-braces-alist))
  )

(use-package xcscope
  :hook (c-mode-common . cscope-setup)
  :config
  (setq cscope-option-use-inverted-index t)
  )

(use-package filladapt
  :delight "▦"
  :hook (c-mode-common . (lambda ()
                           (c-setup-filladapt) (filladapt-mode 1)))
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

