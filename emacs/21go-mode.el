(let ((gopath (shell-command-to-string "go env GOPATH")))
  (if (string-match "\n" gopath)
      (setq GOPATH (substring gopath 0 (string-match "\n" gopath)))
    (setq GOPATH gopath))
  (setenv "GOPATH" GOPATH))

(add-hook 'go-mode-hook
          '(lambda ()
             (auto-complete-mode 1)
             ))

(with-eval-after-load 'go-mode
  (require 'go-autocomplete))


(add-hook 'go-mode-hook
	  '(lambda ()
	     (setq tab-width		4)
             (setq indent-tabs-mode     nil)
             ;;; (infer-indentation-style)
             ))


(add-hook 'go-mode-hook
          '(lambda ()
             (setq gofmt-command "goimports")
             (add-hook 'before-save-hook 'gofmt-before-save)
             (if (not (string-match "go" compile-command))
                 (set (make-local-variable 'compile-command)
                      "go build -v && go test -v && go vet"))

             (let ((oracle-file (format
                                 "%s/src/golang.org/x/tools/cmd/guru/guru.el"
                                 (getenv "GOPATH"))))
               (if (file-exists-p oracle-file)
                   (load-file oracle-file)))

             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "M-*") 'pop-tag-mark)
             ))

;;;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
