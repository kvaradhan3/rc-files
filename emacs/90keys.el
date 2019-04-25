(defun kill-buffer-maybe-kill-frame ()
  "Kill the current buffer.  If multiple frames exist,
   delete the current frame"
  (interactive)
  (kill-buffer (current-buffer))
  (if (nth 1 (frame-list))
      (delete-frame)))


(define-key	global-map	(kbd "\C-c n")	'notes-index-todays-link)
(define-key	global-map	(kbd "H-a")	'notes-mkall)
(define-key	global-map	(kbd "C-c C--")	'org-underline-line)

(define-key	ctl-x-map		[?m]	'mh-smail)
(define-key	ctl-x-map		[?r ?m]	'mh-rmail)
(define-key	ctl-x-map		[?\C-k]	'kill-buffer-maybe-kill-frame)
(define-key	ctl-x-map		[?\C-m]	'manual-entry)
(define-key	ctl-x-map		[?\C-b]	'electric-buffer-list)

(define-key	esc-map			[?`]	'shell-command-on-buffer)
(define-key	esc-map			[?%]	'query-replace-regexp)
(define-key	esc-map			[?\C-^]	'replace-regexp)
(define-key	esc-map			[?g]	'goto-line)
(define-key	esc-map			[?\C-r]	'isearch-backward-regexp)
(define-key	esc-map			[?\C-z]	'ist)

(global-set-key	[?\H-\C-d]	'decrypt-region)
(global-set-key	[?\H-\C-e]	'encrypt-region)
(global-set-key	[?\H-d]		'decrypt-buffer)
(global-set-key	[?\H-e]		'encrypt-buffer)

(global-set-key [?\H-u]		'org-underline-line)
(global-set-key [?\H-4]		'org-underline-line)

(global-set-key (kbd "C-c l")	'org-store-link)
(global-set-key (kbd "C-c a")	'org-agenda)
(global-set-key (kbd "C-c b")   'org-iswitchb)
(global-set-key (kbd "C-c c")   'org-insert-cpol)
(global-set-key (kbd "C-c r")	'remember)

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:


