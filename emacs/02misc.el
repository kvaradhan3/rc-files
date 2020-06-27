(setq		inhibit-startup-message		t)

(let ((display-time-day-and-date t))
  (display-time))

(add-hook 'before-save-hook 'time-stamp)
(setq require-final-newline		nil
      fill-column			 72
      case-fold-search			nil
      backup-by-copying-when-linked	  t
      backup-by-copying-when-mismatch	  t
      enable-local-eval			  t)
(setq-default	case-fold-search	nil)

(use-package tramp
    :config
    ;; NB: I had to remove this b/c I couldn't do /sudo::/ on my localhost if ssh wasn't setup
    ; if I use tramp to access /ssh:root@..., then actually ssh into it
    ; and sudo, not login as root.
    ;; (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/sudo:%h:"))))
    (setq tramp-default-method		"ssh")
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
