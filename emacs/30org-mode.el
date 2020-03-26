;;;
;;; Org Mode
;;;
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;; (require 'org-install)
;;
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)

(defconst my-org-agenda-files-dir "~/Drives/Sync/Agenda")
(defvar   my-org-agenda-files     ())

(defun load-my-agenda-files ()
  "Load all agenda files identified in var: my-org-agenda-files-dir"
  (interactive)
  (let* ((my-agenda-dir (expand-file-name my-org-agenda-files-dir))
	 (my-top-dir    (expand-file-name (concat my-agenda-dir "/.."))))
    (dolist (file (shell-find my-top-dir))
      (unless (string-match-p "/Agenda/\\|/Bugs/" file)
	(if (string-match-p ".*\\.org$" file)
	    (make-symbolic-link file (concat my-agenda-dir "/"
					     (basename file)) t))))
    (setq my-org-agenda-files (directory-files my-agenda-dir t "^.*\\.org")))
  (setq org-agenda-files my-org-agenda-files))

;;; (load-my-agenda-files)

(defconst my-org-Bugs-dir	"~/Documents/Bugs")
(defun show-my-bugs ()
  "Show status on all active bugs of interest"

  (interactive)
  (save-excursion
    (save-restriction
      (let ((org-agenda-files (directory-files (expand-file-name
						my-org-Bugs-dir)
					       t "^.*\\.org$")))
	(org-agenda)
	)))
  (setq org-agenda-files my-org-agenda-files)
  )

;;;  (setq org-agenda-files '("~/Document/NOTES/2012-10"))

(setq org-notes-dir (expand-file-name "~/Documents"))
(defun org-notes ()
  "Switch to my work dir"
  (interactive)
  (find-file org-notes-dir))

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

(defun org-insert-cpol (num title)
  "Insert a CPOL URL"
  (interactive "nCPOL #? \nMTitle for CPOL# %s? ")
  (insert (format "[[CPOL: %s][CPOL# %s: %s]]" num num title))
  )

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "kannan@ieee.org")

;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

