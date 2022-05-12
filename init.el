;;; init.el --- The main entry for emacs

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
(require 'init-base)
(require 'init-ui)
;;(require 'init-evil)

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(keycast-mode t)

;; ;;一系列高效插件
;; (package-install 'vertico)
;; (vertico-mode t)

;; (package-install 'orderless)
;; (setq completion-styles '(orderless))

;; (package-install 'marginalia)
;; (marginalia-mode t)

;; (package-install 'embark)
;; (global-set-key (kbd "C-;") 'embark-act)
;; (setq prefix-help-command 'embark-prefix-help-command)

;; (package-install 'consult)
;; (global-set-key (kbd "C-s") 'consult-line)
;; (global-set-key (kbd "M-s i") 'consult-imenu)
;; (global-set-key (kbd "C-x b") 'consult-buffer)

;; (package-install 'which-key)
;; (which-key-mode)

;; (global-set-key (kbd "C-h C-f") 'find-function)
;; (global-set-key (kbd "C-h C-v") 'find-variable)
;; (global-set-key (kbd "C-h C-k") 'find-function-on-key)


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
