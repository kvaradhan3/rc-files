;;
;; Define common macros for printing.
;;

(defun send-to-printer (&optional prn) ""
  (interactive "sPrinter? (Default: CUPS-PDF) ")
  (save-excursion
    (let ((lpr-command "/opt/local/bin/a2ps")
	  (printer-name (if (or (eq prn nil)
				(equal prn ""))
			    "CUPS_PDF"
			  "prn"))
	  (lpr-add-switches nil)
	  (lpr-headers-switches t))
      (lpr-buffer)))
  )

(defun print-to-pdf ()
  "Print buffer to PDF.  PDF output is in cups_pdf directory"
  (interactive)
  (send-to-printer "")
  )

;
; for these below to work, create classes for Work and Home
; assign a printer to them, and enable.
;
; lpadmin -p <printer> -c Work
; lpadmin -p Work -E
;

(defun print-at-home ()
  "Print to Canon at Home"
  (interactive)
  (send-to-printer "Home")
  )

(defun print-at-work ()
  "Print to sjc15-03-g6-22-cx at work"
  (interactive)
  (send-to-printer "Work")
  )

(define-key global-map (kbd "s-p") 'send-to-printer)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:
