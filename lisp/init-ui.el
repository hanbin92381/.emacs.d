;;; init-ui.el --- Theme, modeline and window behavior.	 -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Optimization
(setq idle-update-delay 1.0)
(setq highlight-nonselected-windows nil)
(setq fast-but-imprecise-scrolling t)

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)
(setq frame-resize-pixelwise t)

;; 优化鼠标滚动
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; doom-themes
(use-package doom-themes
  :init (load-theme 'doom-dracula t)
  :config (doom-themes-org-config))

;; doom-modeline
;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
;;:custom
  )

;; dashboard
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
;;   ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
;;   (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
;;   (setq dashboard-items '((recents  . 10)   ;; 显示多少个最近文件
;; 			  (bookmarks . 5)  ;; 显示多少个最近书签
;; 			  (projects . 5))) ;; 显示多少个最近项目
;;   (dashboard-setup-startup-hook))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(provide 'init-ui)

;;; init-ui.el ends here
