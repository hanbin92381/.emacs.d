;;; init-base.el --- The necessary settings

;; Keep it clean
(setq inhibit-splash-screen t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

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

;; No annoying bell
(setq ring-bell-function 'ignore)

;; No backup files
(setq make-backup-files nil)

;; No auto-saving
;; (setq auto-save-default nil)

;; Recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)


;; End
(provide 'init-base)



