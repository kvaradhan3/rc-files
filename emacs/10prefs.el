(setq		inhibit-startup-message		t)

(add-to-list 'load-path
	     (expand-file-name "~/Library/Application Support/Emacs/site-lisp"))

(defun win:set-font (font-name)
  "Set the font to be used for this frame, and default frame alist to value"
  (set-default-font font-name)
  (add-to-list 'default-frame-alist (cons 'font font-name)))

(defvar win:fonts
  '((default . "-adobe-source code pro-*-*-*-*-*-*-*-*-*-*-*-*")
    (fixed   . "fixed")
    (clean   . "-Schumacher-Clean-Medium-R-Normal--12-120-75-75-C-60-ISO8859-1")
    (bold1   . "lucidasanstypewriter-bold-14")
    (source-code   . "-adobe-source code pro-*-*-*-*-*-*-*-*-*-*-*-*")
    (source-sans   . "-adobe-source sans pro-*-*-*-*-*-*-*-*-*-*-*-*")
    (source-serif  . "-adobe-source serif pro-*-*-*-*-*-*-*-*-*-*-*-*")
    (inconsolata   . "-*-inconsolata-*-*-*-*-*-*-*-*-*-*-*-*")
    (inconsolate-large . "-*-inconsolata-*-*-*-*-16-*-*-*-*-*-*-")
    (menlo   . "-*-menlo-*-*-*-*-*-*-*-*-*-*-*-*")
    (menlo2  . "-apple-Menlo-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
    (monaco  . "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
    ))

(defun win:set-my-font (&optional font-name)
  "* Set the font for this frame and default frame alist to value specified."
  (interactive)
  (if (not font-name)
      (setq font-name 'default))
  (win:set-font (cdr (assoc font-name win:fonts))))

(if (functionp 'transient-mark-mode)
    (progn
      (transient-mark-mode t)
      (setq mark-even-if-inactive t)))
(if window-system
    (progn (scroll-bar-mode nil)
	   (menu-bar-mode -1)
	   (tool-bar-mode -1)
	   (mouse-avoidance-mode 'exile)
	   (mouse-wheel-mode t)
	   (global-font-lock-mode t)
	   (transient-mark-mode t)
	   (delete-selection-mode nil)
	   (show-paren-mode t)
;;	   (setq font-lock-support-mode 'fast-lock-mode
;;		 fast-lock-cache-directories '("~/tmp/.emacs-flc"))
	   (setq my-font  'bold1)
	   ))
(if (or (eq window-system 'mac)
	(eq window-system 'ns))
    (progn
      (setq exec-path
	    (append exec-path
		    (split-string (getenv "PATH") path-separator)
		    (list "/opt/local/bin" "/opt/local/sbin"
			  "/usr/local/bin" "/usr/X11R6/bin"
			  "/sw/bin" "/sw/sbin"
			  (expand-file-name "~/bin"))))
      (setenv "PATH"
	      (mapconcat (function (lambda (x) x)) exec-path path-separator))
      (setq my-font 'inconsolata)
      ))

(if my-font
    (win:set-my-font my-font))

(setq	display-time-day-and-date	t)
(display-time)

;;; (resize-minibuffer-mode)

(setq require-final-newline		nil
      fill-column			 72
      case-fold-search			nil
      backup-by-copying-when-linked	  t
      backup-by-copying-when-mismatch	  t
      enable-local-eval			  t)
(setq-default	case-fold-search	nil)

(setq special-display-buffer-names 
	'("*grep*"
	  "*tex-shell*"
	  "*Compilation*"
	 ))

(setq Info-default-directory-list 
      (append Info-default-directory-list
	      (list (expand-file-name "~/lib/info"))))

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

