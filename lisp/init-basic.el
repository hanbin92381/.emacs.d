;;; init-base.el --- The necessary settings -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Keep it clean
(setq inhibit-splash-screen t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Display line number
;; (global-linum-mode 1)
(global-display-line-numbers-mode t)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight parenthesises
(show-paren-mode t)

;; No eyes distraction
(setq blink-cursor-mode nil)

;; Fold long lines
(toggle-truncate-lines nil)

;; No annoying bell
(setq ring-bell-function 'ignore)

;; No backup files
(setq make-backup-files nil)

;; No auto-saving
(setq auto-save-default nil)

;; Recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 使用y或p替换yes或no
(fset 'yes-or-no-p 'y-or-n-p)

;; Encoding
;; ;; UTF-8 as the default coding system
;; (when (fboundp 'set-charset-priority)
;;   (set-charset-priority 'unicode))

;; (set-language-environment 'chinese-gbk)
;; (prefer-coding-system 'utf-8-auto)


;; 显示列号、大小
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


