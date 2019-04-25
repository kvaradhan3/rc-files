(let ((display-time-day-and-date t))
  (display-time))

(setq backup-by-copying-when-linked	t)

(require 'tramp)
(setq tramp-default-method		"ssh")

;;;;
;;;;
;; http://debbugs.gnu.org/db/18/18845.html
;;
;; breakage of php-mode and csharp-mode, but this affects any derived
;; mode that does not require cl or requires cl-lib instead of cl.
;;
;; This seems to be recently fixed in trunk (revno 118032) so maybe no
;; further action is required and this bug report can be closed.
;;
;; What would be the most appropriate way for affected derived modes
;; to work around this issue? Suppose I add:
;;
;;  (eval-when-compile
;;    (if (and (= emacs-major-version 24) (= emacs-minor-version 4))
;;      (require 'cl)))
;;
;; would that be fine and won't there be a future 24.4 release that
;; fixes this issue?
;;
;; protobuf-mode is a derived mode from cc-mode.
;;
(eval-when-compile
  (if (and (= emacs-major-version 24) (= emacs-minor-version 5))
      (require 'cl)))
;; (require 'protobuf-mode)

(add-hook 'before-save-hook 'time-stamp)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
