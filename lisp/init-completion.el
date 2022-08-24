;; init-company.el --- Initialize completion configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(setq tab-always-indent 'complete)

;; company
(use-package company
  :ensure t
  :init (global-company-mode t)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉

;; company-box
;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode))

;; marginalia
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))

;; which-key
(use-package which-key
  :ensure t
  :init (which-key-mode))

;;一系列高效插件
(package-install 'vertico)
(vertico-mode t)

(package-install 'orderless)
(setq completion-styles '(orderless))

(package-install 'embark)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

(package-install 'consult)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-s i") 'consult-imenu)
(global-set-key (kbd "C-x b") 'consult-buffer)


(provide 'init-completion)

;;; init-completion.el ends here
