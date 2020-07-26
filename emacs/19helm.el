(require 'helm-config)

(use-package helm-mode
  :init
  (setq helm-mode-fuzzy-match                   t
        helm-completion-in-region-fuzzy-match   t)

  :bind (("M-x"         . helm-M-x)
         ("C-x C-f"     . helm-find-files)
         ("C-x r b"     . helm-filtered-bookmarks)
         :map helm-command-map
         ("C-c h"       . helm-execute-persistent-action)
         )
  :hook org-mode
  :config
  (helm-mode 1)
  )

(use-package linum-relative
  :hook (helm-mode . helm-linum-relative-mode)
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

