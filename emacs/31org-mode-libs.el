;;;
;;; Some library functions for Org Mode
;;;

(add-to-list 'auto-mode-alist	'("\\.org$"	. org-mode))
(add-to-list 'auto-mode-alist	'("\\.txt$"	. indented-text-mode))

(defun org-table-wrap-to-width (width)
  "Wrap current column to WIDTH."
  (interactive (list (read-number "Enter column width: ")))
  (org-table-check-inside-data-field)
  (org-table-align)

  (let (cline (ccol (org-table-current-column)) new-row-count (more t))
    (org-table-goto-line 1)
    (org-table-goto-column ccol)

    (while more
      (setq cline (org-table-current-line))

      ;; Cut current field
      (org-table-copy-region (point) (point) 'cut)

      ;; Justify for width
      (setq org-table-clip 
            (mapcar 'list (org-wrap (caar org-table-clip) width nil)))

      ;; Add new lines and fill
      (setq new-row-count (1- (length org-table-clip)))
      (if (> new-row-count 0)
          (org-table-insert-n-row-below new-row-count)) 
      (org-table-goto-line cline)
      (org-table-goto-column ccol)
      (org-table-paste-rectangle)
      (org-table-goto-line (+ cline new-row-count))

      ;; Move to next line
      (setq more (org-table-goto-line (+ cline new-row-count 1)))
      (org-table-goto-column ccol))

    (org-table-goto-line 1)
    (org-table-goto-column ccol)))

(defun org-table-insert-n-row-below (n)
  "Insert N new lines below the current."
  (let* ((line (buffer-substring (point-at-bol) (point-at-eol)))
         (new (org-table-clean-line line)))
    ;; Fix the first field if necessary
    (if (string-match "^[ \t]*| *[#$] *|" line)
        (setq new (replace-match (match-string 0 line) t t new)))
    (beginning-of-line 2)
    (setq new
      (apply 'concat (make-list n (concat new "\n"))))
    (let (org-table-may-need-update) (insert-before-markers new))  ;;; remove? 
    (beginning-of-line 0)
    (re-search-forward "| ?" (point-at-eol) t)
    (and (or org-table-may-need-update org-table-overlay-coordinates) ;;; remove? 
         (org-table-align))
    (org-table-fix-formulas "@" nil (1- (org-table-current-dline)) n)))

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

