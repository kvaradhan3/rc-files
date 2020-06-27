(defun win:set-font (font-name)
  "Set the font to be used for this frame, and default frame alist to value"
  (message "Set Font to %s" font-name)
  (set-default-font font-name)
  (add-to-list 'default-frame-alist (cons 'font font-name)))

(defun get-font-name (foundry fontname &optional point)
  (if point
      (format "-%s-%s-*-*-*-*-%d-*-*-*-*-*-*-*" foundry fontname point)
    (format "-%s-%s-*-*-*-*-*-*-*-*-*-*-*-*" foundry fontname)
    ))

(defvar win:fonts
  '((default . (get-font-name "apple" "SF Mono" 16))
    (fixed   . "fixed")
    (clean   . "-Schumacher-Clean-Medium-R-Normal--12-120-75-75-C-60-ISO8859-1")
    (bold1   . "lucidasanstypewriter-bold-14")
    (source-code        . (get-font-name "adobe" "source code pro"))
    (source-sans        . (get-font-name "adobe" "source sans pro"))
    (source-serif       . (get-font-name "adobe" "source serif pro"))
    (inconsolata        . (get-font-name "*"     "inconsolata"))
    (inconsolate-large  . (get-font-name "*"     "inconsolata" 16))
    (menlo              . (get-font-name "*"     "menlo"))
    (apple-menlo        . (get-font-name "apple" "Menlo"))
    (monaco             . (get-font-name "apple" "Monaco"))
    (sfmono             . (get-font-name "apple" "SF Mono" 18))
    ))

(defun win:set-my-font (&optional font-name)
  "* Set the font for this frame and default frame alist to value specified."
  (interactive)
  (if (not font-name)
      (setq font-name 'default))
  (win:set-font (eval (cdr (assoc font-name win:fonts)))))

(if window-system
    (progn
      (scroll-bar-mode          nil)
      (menu-bar-mode            -1)
      (tool-bar-mode            -1)
      (mouse-avoidance-mode     'exile)
      (mouse-wheel-mode         t)
      (global-font-lock-mode    t)
      (transient-mark-mode      t)
      (delete-selection-mode    nil)
      (show-paren-mode          t)
      (win:set-my-font)
      ))

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

