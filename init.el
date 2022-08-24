;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; load path
(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir))
  (add-to-list 'load-path (file-name-as-directory (expand-file-name "lang" dir))))
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'no-error 'no-message)

;;优化鼠标滚动
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; 导入各部分配置
(require 'init-packages)
(require 'init-basic)
(require 'init-completion)
(require 'init-tools)
(require 'init-ui)



(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "M-w") 'kill-region)
(global-set-key (kbd "C-w") 'kill-ring-save)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-m") 'move-beginning-of-line)
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region)

;; 自定义函数
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previos-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))

(global-set-key (kbd "M-n") 'next-ten-lines)
(global-set-key (kbd "M-p") 'previous-ten-lines)

(global-set-key (kbd "C-j") 'nil) ; 解绑"C-j"
(global-set-key (kbd "C-j C-k") 'kill-whole-line)

;; bookmark
(setq bookmark-save-flag 1)
(require 'bookmark)
(list-bookmarks)
(switch-to-buffer "*Bookmark List*")

;; org
(setq org-hide-emphasis-markers t)
(use-package org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)
(setq org-appear-autolinks t)
(setq org-appear-autoemphasis t)



(provide 'init)

;;; init.el ends here
