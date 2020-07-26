;;;
;;; Org Mode
;;;

(set-register ?o (cons 'file "~/Documents/organizer.org"))
(use-package org
  :ensure t
  :mode ("\\.org\\'"            . org-mode)
  :mode ("\\.org_archive\\'"    . org-mode)
  :mode ("\\.txt\\'"            . org-mode)
  :bind (("C-c l"       . org-store-link)
         ("C-c b"       . org-iswitchb)
         ("C-c C-r"     . (lambda ()
                            (interactive)
                            (find-file "~/Documents/organizer.org")))
         )
  :config
  (setq org-agenda-files         '()
        org-capture-templates   '()
        org-refile-targets      '((nil :maxlevel . 9))
        org-completion-use-ido  nil)

  (setq org-refile-targets
        (append org-refile-targets
                '((notes-refile-targets      :maxlevel . 9))))

  ;;; https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
  (setq org-refile-use-outline-path             'file
        org-outline-path-complete-in-steps      nil
        org-refile-allow-creating-parent-nodes  'confirm)
  (turn-on-auto-fill)
 )

(use-package org-capture
  :after org
  :bind (("C-c c"       . org-capture)
         ("C-c n"       . (lambda ()
                            (interactive)
                            (org-capture nil "n")))
         )
  :config
  (setq org-capture-templates
        (append org-capture-templates
                '(
                  ("n" "Notes Entry" entry
                   (file+headline "~/Documents/organizer.org" "Note")
                   "* %^{Title} %^G\n  %U\n  %^{Attendees}p\n  %?"
                   :clock-in t
                   )
                  )))
  )
  
(defun notes-refile-targets ()
  "Load all agenda files identified in var: my-org-agenda-files-dir"
  (interactive)
  (let ((notes-files '(dummy)))
    (dolist (file (shell-find "~/Documents/NOTES"))
      (if (string-match-p ".*\\.org$" file)
          (nconc notes-files (list file))))
    (cdr notes-files)))
                                
(setq org-link-abbrev-alist
      '(("ddts"	. "https://cdetsng.cisco.com/webui/#view=")
	("prrq" . "http://wwwin-tools.cisco.com/prrq/viewReview.do?queueName=ng-admin-dev&bugId=")
	("edcs" . "http://wwwin-eng.cisco.com/protected-cgi-bin/edcs/edcs_attr_search.pl?doc_title=&file_name=&doc_author=&uid=I&submit=Search&doc_num=")
	("iwe"  . "http://iwe.cisco.com/web/view-post/post/-/posts?postId=")
	("user" . "http://directory/index.cgi?submit=Search&name=")
	("scrubber" . "http://wwwin-ottawa.cisco.com/tfoggoa/Scrubber/showquery.html?query=")
	("diff" . "file:./%s.diff")
	("rfc"  . "http://tools.ietf.org/html/rfc")
        ("cpol" . "https://cpol.cisco.com/cpol/patent.cgi?task=PatDetails&nav=y&patent_p=")
	))

(use-package org-crypt
  :config
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance '("crypt"))
  (setq org-crypt-key "kannan@ieee.org")
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

