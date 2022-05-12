;;; init-evil ---

(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-Y-yank-to-eol t)
  :hook (after-init . evil-mode)
  :config
  ;; install `undo-fu' when necessary
  (when (< emacs-major-version 28)
    (use-package undo-fu
      :ensure t))
  :custom
  ;; undo will never freeze my Emacs
  (evil-undo-system (if (>= emacs-major-version 28) 'undo-redo 'undo-fu))
  (evil-respect-visual-line-mode t)
  (evil-want-fine-undo t))

;; (use-package evil-surround)
;; (use-package evil-collection)

;; evil leader map
(use-package evil
  :ensure nil
  :config
  (with-no-warnings
    (evil-set-leader 'normal (kbd "SPC"))
    (evil-set-leader 'normal (kbd "<leader>m") :localleader)

    (defun define-leader-key (state map localleader &rest bindings)
      "Define leader key in MAP when STATE, a wrapper for
`evil-define-key*'. All BINDINGS are prefixed with \"<leader>\"
if LOCALLEADER is nil, otherwise \"<localleader>\"."
      (cl-assert (cl-evenp (length bindings)))
      (let ((prefix (if localleader "<localleader>" "<leader>")))
	(while bindings
	  (let ((key (pop bindings))
		(def (pop bindings)))
	    (evil-define-key* state map (kbd (concat prefix key)) def)))))

    (define-leader-key 'normal 'global nil
      ;; SPC, quit minibuffer.
      "SPC" 'keyboard-escape-quit

      ;; file
      "ff" 'find-file
      "fF" 'find-file-other-window
      "f/" 'find-file-other-window
      "fC" '+copy-current-file
      "fD" '+delete-current-file
      "fy" '+copy-current-filename
      "fR" '+rename-current-file
      "fr" 'recentf-open-files
      "fl" 'find-file-literally

      ;; dired
      "dj" 'dired-jump
      "dJ" 'dired-jump-other-window

      ;; buffer & bookmark
      "bb" 'switch-to-buffer
      "bB" 'switch-to-buffer-other-window
      "bc" 'clone-indirect-buffer
      "bC" 'clone-indirect-buffer-other-window
      "by" '+copy-current-buffer-name
      "bv" 'revert-buffer
      "bz" 'bury-buffer
      ;; --------------
      "bm" 'bookmark-set
      "bM" 'bookmark-set-no-overwrite
      "bi" 'bookmark-insert
      "br" 'bookmark-rename
      "bd" 'bookmark-delete
      "bw" 'bookmark-write
      "bj" 'bookmark-jump
      "bJ" 'bookmark-jump-other-window
      "bl" 'bookmark-bmenu-list
      "bs" 'bookmark-save

      ;; code
      "cd" 'rmsbolt-compile
      "cc" 'compile
      "cC" 'recompile
      "ck" 'kill-compilation
      "cx" 'quickrun
      "cX" 'quickrun-shell

      ;; window
      "w" 'evil-window-map
      "wx" 'kill-buffer-and-window
      "wu" '+transient-tab-bar-history
      "w-" 'split-window-vertically
      "w/" 'split-window-horizontally
      ;; doom window operation
      "wv" 'evil-window-vsplit
      "ws" 'evil-window-split
      "ww" 'evil-window-next
      "wh" 'evil-window-left
      "wj" 'evil-window-down
      "wk" 'evil-window-up
      "wl" 'evil-window-right
      "wd" 'evil-window-delete
      "w>" 'evil-window-increase-width
      "w<" 'evil-window-decrease-width
      "w+" 'evil-window-increase-height
      "w-" 'evil-window-decrease-height
      "w=" 'balance-windows

      ;; tab
      "t9" 'tab-bar-switch-to-last-tab
      "tc" 'tab-bar-close-tab
      "tC" 'tab-bar-close-group-tabs
      "tg" 'tab-bar-change-tab-group
      "ti" 'tab-switcher
      "tn" 'tab-bar-new-tab
      "to" 'tab-bar-close-other-tabs
      "tt" 'tab-bar-switch-to-tab
      "tp" 'tab-bar-switch-to-recent-tab
      "tr" 'tab-bar-rename-tab

      ;; text
      "xj" 'set-justification
      "xw" 'delete-trailing-whitespace
      "x TAB" 'indent-rigidly

      ;; search
      "sj" 'evil-show-jumps
      "sm" 'evil-show-marks
      "sr" 'evil-show-registers
      "si" 'imenu

      ;; project
      "p" 'projectile-command-map

      ;; app
      "aa" 'org-agenda
      "ac" 'calendar
      "ag" 'gnus
      "ai" 'rcirc

      ;; open
      "oc" 'org-capture
      "ol" 'org-store-link
      "ot" 'ansi-term
      "oe" 'eshell
      "os" 'shell

      ;; help
      "hv" 'describe-variable
      "hf" 'describe-function
      "hk" 'describe-key
      "hb" 'describe-bindings
      "hF" 'describe-face
      "hP" 'describe-library
      "h'" 'describe-char)
    

    (with-eval-after-load 'org
      (define-leader-key 'normal org-mode-map :localleader
        "." 'org-goto
        "a" 'org-archive-subtree
        "d" 'org-deadline
        "e" 'org-set-effort
        "f" 'org-footnote-action
        "l" 'org-lint
        "o" 'org-toggle-ordered-property
        "p" 'org-set-property
        "q" 'org-set-tags-command
        "r" 'org-refile
        "s" 'org-schedule
        "t" 'org-todo
        "T" 'org-todo-list

        ;; babel
        "bp" 'org-babel-previous-src-block
        "bn" 'org-babel-next-src-block
        "be" 'org-babel-expand-src-block
        "bg" 'org-babel-goto-named-src-block
        "bs" 'org-babel-execute-subtree
        "bb" 'org-babel-execute-buffer
        "bt" 'org-babel-tangle
        "bf" 'org-babel-tangle-file
        "bc" 'org-babel-check-src-block
        "bi" 'org-babel-insert-header-arg
        "bI" 'org-babel-view-src-block-info
        "bk" 'org-babel-remove-result-one-or-many

        ;; clock
        "cc" 'org-clock-in
        "cC" 'org-clock-out
        "cd" 'org-clock-mark-default-task
        "ce" 'org-clock-modify-effort-estimate
        "cg" 'org-clock-goto
        "cl" 'org-clock-in-last
        "cr" 'org-clock-report
        "cs" 'org-clock-display
        "cx" 'org-clock-cancel
        "c=" 'org-clock-timestamps-up
        "c-" 'org-clock-timestamps-down

        ;; insert
        "id" 'org-insert-drawer
        "in" 'org-add-note
        "it" 'org-time-stamp-inactive
        "iT" 'org-time-stamp))

    (with-eval-after-load 'elisp-mode
      (dolist (keymap (list emacs-lisp-mode-map lisp-interaction-mode-map))
        (define-leader-key 'normal keymap :localleader
          "i" 'info-lookup-symbol

          ;; eval
          "eb" 'eval-buffer
          "ed" 'eval-defun
          "ee" 'eval-last-sexp
          "el" 'load-library

          ;; goto
          "gf" 'find-function
          "gv" 'find-variable
          "gl" 'find-library)))
    ))

(provide 'init-evil)
;;; init-evil.el ends here
