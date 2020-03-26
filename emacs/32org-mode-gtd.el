;;;-
;;; Some library functions for Org Mode
;;;

;;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;;; someday see http://members.optusnet.com.au/~charles57/GTD/orgmode.html

(require 'org-capture)

;; split GTD in four separate files:
;; - [inbox.org]:   collect everything;
;; - [gtd.org]:     all my projects;
;; - [someday.org:  All inactive tasks that I might do at some point
;;                  in the future, but don’t want to see all the time;
;; - [tickler.org]: I put entries in this file with a timestamp to get
;;                  reminded at the right moment.
(defconst gtd-inbox     "~/Drives/Sync/Agenda/gtd-inbox.org")
(defconst gtd-gtd       "~/Drives/Sync/Agenda/gtd-gtd.org")
(defconst gtd-tickler   "~/Drives/Sync/Agenda/gtd-tickler.org")
(defconst gtd-someday   "~/Drives/Sync/Agenda/gtd-someday.org")

(setq org-agenda-files '("~/Drives/Sync/Agenda/gtd-inbox.org"
                         "~/Drives/Sync/Agenda/gtd-gtd.org"
                         "~/Drives/Sync/Agenda/gtd-tickler.org"))

;; C-c c   org-capture popup
;; C-c C-c store back into inbox
;; C-c c t Capture into inbox
;; C-c c T capture into Ticker
;;
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Drives/Sync/Agenda/gtd-inbox.org"
                                              "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Drives/Sync/Agenda/gtd-tickler.org"
                                              "Tickler")
                               "* %i%? \n %U")))

;; Refiling the inbox:
;; Cc-C-w
(setq org-refile-targets '(("~/Drives/Sync/Agenda/gtd-gtd.org" :maxlevel . 3)
                           ("~/Drives/Sync/Agenda/gtd-someday.org" :level . 1)
                           ("~/Drives/Sync/Agenda/gtd-tickler.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|"
                                     "DONE(d)" "CANCELLED(c)")))

;; C-c C-s on an sntry to add a schedule
;; C-c C-d to enter a deadline

;; Contexts:  @work, @home, @personal, @adhithya, @adhvik
(setq org-agenda-custom-commands 
      '(("o" "Things related to Work, Office" tags-todo "@work"
         ((org-agenda-overriding-header "work")
          (org-agenda-skip-function #'gtd-skip-all-siblings-but-first)))
        ("p" "Professional:  work + Personal development"
         tags-todo "@work|@personal"
         ((org-agenda-overriding-header "professional")
          (org-agenda-skip-function #'gtd-skip-all-siblings-but-first)))
        ("h" "Home Activities"
         tags-todo "@home"
         ((org-agenda-overriding-header "home")
          (org-agenda-skip-function #'gtd-skip-all-siblings-but-first)))
        ("p" "Professional:  work + Personal development"
         tags-todo "@work|@personal"
         ((org-agenda-overriding-header "professional")
          (org-agenda-skip-function #'gtd-skip-all-siblings-but-first)))
        ("." . "Kids:  Adhithya(ak) | Adhvik(adk)")
        (".k" "Adhithya's reminders"
         tags-todo "@adhithya"
         ((org-agenda-overriding-header "adhithya")
          (org-agenda-skip-function #'gtd-skip-all-siblings-but-first)))
        (".dk" "Adhvik's reminders"
         tags-todo "@adhvik"
         ((org-agenda-overriding-header "adhvik")
          (org-agenda-skip-function #'gtd-skip-all-siblings-but-first)))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))


;;; C-c C-x C-a archive done projects (org-archive-subtree-default)




;
;;; Local Variables:
;;; mode: Emacs-Lisp
;;; comment-column: 60
;;; comment-start: "; "
;;; comment-end: ""
;;; backup-by-copying-when-linked: t
;;; file-precious-flag: nil
;;; End:

