;;; init-base.el --- The necessary settings

;;; Commentary:

;;; Code:

;; Keep it clean
(setq inhibit-splash-screen t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode -1))

;; Display line number
(global-linum-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight parenthesises
(show-paren-mode t)

;; 成对括号
(electric-pair-mode t)

;; No eyes distraction
(setq blink-cursor-mode nil)

;; 输入替换选中文本
(delete-selection-mode t)

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

;; 在另一程序修改文件时，让emacs及时刷新buffer
(global-auto-revert-mode t)

;; 使用y或p替换yes或no
(fset 'yes-or-no-p 'y-or-n-p)

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


(provide 'init-basic)

;;; init-basic.el ends here


