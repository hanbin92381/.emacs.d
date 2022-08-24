;;; init-ui.el --- Theme, modeline and window behavior.	 -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package doom-themes)
(load-theme 'doom-one 1)

;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后‘
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t))


;; dashboard
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
;;   ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
;;   (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
;;   (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
;; 			  (bookmarks . 5)  ;; 显示多少个最近书签
;; 			  (projects . 5))) ;; 显示多少个最近项目
;;   (dashboard-setup-startup-hook))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))


(provide 'init-ui)

;;; init-ui.el ends here
