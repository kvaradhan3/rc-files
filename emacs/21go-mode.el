(defun go/maybe-load-oracle ()
   "If an oracle file exists in the gopath, load it"
   (let ((oracle-file (format
                       "%s/src/golang.org/x/tools/cmd/guru/guru.el"
                       (getenv "GOPATH"))))
     (if (file-exists-p oracle-file)
         (load-file oracle-file))))

(use-package go-mode
  :init
  (setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  :bind (:map go-mode-map
              ("M-."  . godef-jump)
              ("M-*"  . pop-tag-mark)
        )

  :config
  (setq tab-width		   4
        indent-tabs-mode     nil)
  ;; (infer-indentation-style)
  (go/maybe-load-oracle)
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(use-package go-autocomplete
  :defer t
  :after go-mode
  :config
  (auto-complete-mode 1))

;; (with-eval-after-load 'go-mode
;;   (require 'go-autocomplete))


;;;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
