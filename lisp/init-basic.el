;;; init-base.el --- The necessary settings -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Keep it clean
(setq inhibit-startup-screen t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Display line number
(global-display-line-numbers-mode t)

;; Highlight current line
(global-hl-line-mode 1)

;; Automatic parenthesis pairing
(electric-pair-mode t)

;; Highlight parenthesises
(show-paren-mode t)

;; Delete selection when insert
(delete-selection-mode t)

;; No eyes distraction
(setq blink-cursor-mode nil)

;; Set cursor type
(setq-default cursor-type '(hbar . 7))

;; Fold long lines
(toggle-truncate-lines nil)

;; No annoying bell
(setq ring-bell-function 'ignore)

;; No backup files
(setq make-backup-files nil)

;; No auto-saving
(setq auto-save-default nil)

;; Automatically reload files was modified by external program
(global-auto-revert-mode t)

;; Recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)

;; Replace yes/no with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Set coding system
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(set-language-environment 'chinese-gbk)
(prefer-coding-system 'utf-8-auto)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Display cursor coordinates and file size
(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;; saveplace
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; savehist
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

;; bookmark
(use-package bookmark
  :ensure nil
  :config
  (setq bookmark-save-flag 1))


(provide 'init-basic)

;;; init-basic.el ends here
