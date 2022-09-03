;;; init-packages.el --- Packages, archives and more	 -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'init-const)
(require 'init-funcs)

;; 设置源
(require 'package)
;; (setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
;; 			 ("nongnu" . "http://elpa.zilongshanren.com/nongnu/")
;; 			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(setq package-archives '(("gnu"    . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
			 ("nongnu" . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/nongnu/")
			 ("melpa"  . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))

(package-initialize)

;; 防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (require 'use-package-ensure)
;; (setq use-package-always-ensure t)

;; restart-emacs
(use-package restart-emacs
  :ensure t)

;; hydra
(use-package hydra
  :ensure t)

(use-package use-package-hydra
  :ensure t
  :after hydra)

;; undo-tree
;; (use-package undo-tree
;;   :ensure t
;;   :init (global-undo-tree-mode)
;;   :after hydra
;;   :bind ("C-x C-h u" . hydra-undo-tree/body)
;;   :hydra (hydra-undo-tree (:hint nil)
;;   "
;;   _p_: undo  _n_: redo _s_: save _l_: load   "
;;   ("p"   undo-tree-undo)
;;   ("n"   undo-tree-redo)
;;   ("s"   undo-tree-save-history)
;;   ("l"   undo-tree-load-history)
;;   ("u"   undo-tree-visualize "visualize" :color blue)
;;   ("q"   nil "quit" :color blue)))


;; multiple-cursors
(use-package multiple-cursors
  :bind
  ("C-S-<mouse-1>" . mc/toggle-cursor-on-click))

;; tiny
;; (use-package tiny
;;   :ensure t
;;   ;; 可选绑定快捷键，笔者个人感觉不绑定快捷键也无妨
;;   :bind
;;   )

;; google-this
;; (use-package google-this
;;   :ensure t
;;   :init
;;   (google-this-mode)) 

;; yasnippet
;; (use-package yasnippet
;;   :ensure t
;;   :init
;;   (yas-reload-all)
;;   :hook
;;   (prog-mode . yas-minor-mode)
;;   :config
;;   ;; add company-yasnippet to company-backends
;;   (defun company-mode/backend-with-yas (backend)
;;     (if (and (listp backend) (member 'company-yasnippet backend))
;; 	backend
;;       (append (if (consp backend) backend (list backend))
;;               '(:with company-yasnippet))))
;;   (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
;;   ;; unbind <TAB> completion
;;   (define-key yas-minor-mode-map [(tab)]        nil)
;;   (define-key yas-minor-mode-map (kbd "TAB")    nil)
;;   (define-key yas-minor-mode-map (kbd "<tab>")  nil)
;;   :bind
;;   (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))

;; (use-package yasnippet-snippets
;;   :ensure t
;;   :after yasnippet)

;; flycheck(windows支持不佳)
(use-package flycheck
  :ensure t
  :hook
  (prog-mode . flycheck-mode))


(provide 'init-packages)

;;; init-packages.el ends here
