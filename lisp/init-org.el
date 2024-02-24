;;; init-org.el --- Org mode configurations.	-*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; 待处理配置
(setq org-hide-emphasis-markers t)
(use-package org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)
(setq org-appear-autolinks t)
(setq org-appear-autoemphasis t)

;; Org-contrib
(use-package org-contrib
  :pin nongnu)

(use-package org
  :ensure nil
  :pretty-hydra
  ((:title (pretty-hydra-title "Org Template" 'fileicon "org" :face 'all-the-icons-green :height 1.1 :v-adjust 0.0)
    :color blue :quit-key "q")
   ("Basic"
    (("a" (hot-expand "<a") "ascii")
     ("c" (hot-expand "<c") "center")
     ("C" (hot-expand "<C") "comment")
     ("e" (hot-expand "<e") "example")
     ("E" (hot-expand "<E") "export")
     ("h" (hot-expand "<h") "html")
     ("l" (hot-expand "<l") "latex")
     ("n" (hot-expand "<n") "note")
     ("o" (hot-expand "<q") "quote")
     ("v" (hot-expand "<v") "verse"))
    "Head"
    (("i" (hot-expand "<i") "index")
     ("A" (hot-expand "<A") "ASCII")
     ("I" (hot-expand "<I") "INCLUDE")
     ("H" (hot-expand "<H") "HTML")
     ("L" (hot-expand "<L") "LaTeX"))
    "Source"
    (("s" (hot-expand "<s") "src")
     ("m" (hot-expand "<s" "emacs-lisp") "emacs-lisp")
     ("y" (hot-expand "<s" "python :results output") "python")
     ("p" (hot-expand "<s" "perl") "perl")
     ("r" (hot-expand "<s" "ruby") "ruby")
     ("S" (hot-expand "<s" "sh") "sh")
     ("g" (hot-expand "<s" "go :imports '\(\"fmt\"\)") "golang"))
    "Misc"
    (("u" (hot-expand "<s" "plantuml :file CHANGE.png") "plantuml")
     ("Y" (hot-expand "<s" "ipython :session :exports both :results raw drawer\n$0") "ipython")
     ("P" (progn
            (insert "#+HEADERS: :results output :exports both :shebang \"#!/usr/bin/env perl\"\n")
            (hot-expand "<s" "perl")) "Perl tangled")
     ("<" self-insert-command "ins"))))
  :bind
  (("C-c a" . org-agenda)
   ("C-c b" . org-switchb)
   ("C-c x" . org-capture))
  :config
  (require 'org-checklist)
  :custom
  ;; https://github.com/condy0919/.emacs.d/blob/master/lisp/init-org.el
  ;; prettify
  (org-startup-indented t)
  (org-fontify-todo-headline t)
  (org-fontify-done-headline t)
  (org-fontify-whole-heading-line t)
  (org-fontify-quote-and-verse-blocks t)
  (org-list-demote-modify-bullet '(("+" . "-") ("1." . "a.") ("-" . "+")))
  ;; images
  (org-image-actual-width nil)
  (org-startup-with-inline-images t)
  (org-display-remote-inline-images 'cache)
  ;; latex
  ;;(org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  (org-preview-latex-default-process 'dvisvgm)
  ;; more user-friendly
  (org-imenu-depth 4)
  (org-clone-delete-id t)
  (org-use-sub-superscripts '{})
  (org-yank-adjusted-subtrees t)
  (org-ctrl-k-protect-subtree t)
  ;;(org-catch-invisible-edits 'smart)
  ;;(org-insert-heading-respect-content t)
  (org-startup-folded nil)
  (org-return-follows-link t)
  (org-startup-truncated nil)
  (org-confirm-babel-evaluate nil)
  ;; todo
  ;; !:自动增加时间戳 @:要求输入文字说明 同时使用@/!
  (org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "HOLD(h@/!)" "WAIT(w!)" "|" "DONE(d!)")
		       (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f!)")
		       (sequence "|" "CANCELED(c@/!)")))
  (org-todo-keyword-faces '(("TODO"       :foreground "#7c7c75" :weight bold)
                            ("STARTED"    :foreground "#0098dd" :weight bold)
			    ("HOLD"       :foreground "#feb24c" :weight bold)
                            ("WAIT"       :foreground "#9f7efe" :weight bold)
                            ("DONE"       :foreground "#50a14f" :weight bold)
                            ("REPORT"     :foreground "magenta" :weight bold)
                            ("BUG"        :foreground "red"     :weight bold)
                            ("KNOWNCAUSE" :foreground "yellow"  :weight bold)
                            ("FIXED"      :foreground "green"   :weight bold)
			    ("CANCELLED"  :foreground "#ff6480" :weight bold)))
  (org-log-done t)
  (org-log-into-drawer t)
  )

;; Keep track of tasks
(use-package org-agenda
  :ensure nil
  :hook (org-agenda-finalize . org-agenda-to-appt)
  :custom
  (org-agenda-files (list (expand-file-name "task.org" org-directory)))
  (org-agenda-inhibit-startup t)
  (org-agenda-time-leading-zero t)
  ;;(org-agenda-remove-tags t)
  (org-agenda-restore-windows-after-quit t)
  (org-agenda-window-setup 'other-frame)
  )

;; Write codes in org-mode
(use-package org-src
  :ensure nil
  :hook (org-babel-after-execute . org-redisplay-inline-images)
  :bind (:map org-src-mode-map
         ;; consistent with separedit/magit
         ("C-c C-c" . org-edit-src-exit))
  :custom
  (org-confirm-babel-evaluate nil)
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-src-preserve-indentation t)
  (org-src-window-setup 'other-window)
  ;; (org-src-lang-modes '(("C"      . c)
  ;;                       ("C++"    . c++)
  ;;                       ("bash"   . sh)
  ;;                       ("cpp"    . c++)
  ;;                       ("dot"    . graphviz-dot) ;; was `fundamental-mode'
  ;;                       ("elisp"  . emacs-lisp)
  ;;                       ("ocaml"  . tuareg)
  ;;                       ("shell"  . sh)))
  (org-babel-load-languages '((C          . t)
                              (dot        . t)
                              (emacs-lisp . t)
                              (eshell     . t)
                              (python     . t)
                              (shell      . t))))

;; Create structured information quickly
;; (use-package org-capture
;;   :ensure nil
;;   :hook (org-capture-mode . org-capture-setup)
;;   :config
;;   (with-no-warnings
;;     (defun org-capture-setup ()
;;       (setq-local org-complete-tags-always-offer-all-agenda-tags t))

;;     (defun project-todo-org-file (headline)
;;       (let* ((file (expand-file-name "TODO.org" (projectile-acquire-root)))
;;              (buf (find-file-noselect file)))
;;         (set-buffer buf)
;;         ;; Set to UTF-8 because we may be visiting raw file.
;;         (setq buffer-file-coding-system 'utf-8-unix)
;;         (unless (org-find-exact-headline-in-buffer headline)
;;           (goto-char (point-max))
;;           (insert "* " headline)
;;           (org-set-tags (downcase headline))))))
;;   :custom
;;   (org-capture-use-agenda-date t)
;;   (org-capture-templates-contexts nil)
;;   (org-capture-templates `(;; Tasks
;;                            ("t" "Tasks")
;;                            ("tt" "Today" entry (file+olp+datetree "tasks.org")
;;                             "* %? %^{EFFORT}p"
;;                             :prepend t)
;;                            ("ti" "Inbox" entry (file+headline "tasks.org" "Inbox")
;;                             "* %?\n%i\n")
;;                            ("tm" "Mail" entry (file+headline "tasks.org" "Inbox")
;;                             "* TODO %^{type|reply to|contact} %^{recipient} about %^{subject} :MAIL:\n")
;;                            ;; Capture
;;                            ("c" "Capture")
;;                            ("cn" "Note" entry (file+headline "capture.org" "Notes")
;;                             "* %? %^g\n%i\n")
;;                            ;; Project
;;                            ("p" "Project")
;;                            ("pb" "Bug"           entry (function ,(lazy! (project-todo-org-file "Bugs")))          "* %?")
;;                            ("pf" "Feature"       entry (function ,(lazy! (project-todo-org-file "Features")))      "* %?")
;;                            ("ps" "Security"      entry (function ,(lazy! (project-todo-org-file "Security")))      "* %?")
;;                            ("pe" "Enhancement"   entry (function ,(lazy! (project-todo-org-file "Enhancements")))  "* %?")
;;                            ("po" "Optimization"  entry (function ,(lazy! (project-todo-org-file "Optimizations"))) "* %?")
;;                            ("pd" "Documentation" entry (function ,(lazy! (project-todo-org-file "Documentation"))) "* %?")
;;                            ("pm" "Miscellaneous" entry (function ,(lazy! (project-todo-org-file "Miscellaneous"))) "* %?"))))

;; Org-roam
(use-package org-roam
  :ensure nil
  :custom
  (org-roam-directory (file-truename "/path/to/org-files/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(provide 'init-org)
;;; init-org.el ends here
