;;;

;;; Commentary:

;;; Code:

;; modeline上显示我的所有的按键和执行的命令
(use-package keycast
    :ensure t)
(add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode t)

(use-package 'which-key
  :ensure t
  :config (which-key-mode t))


(provide 'init-tools)

;;; init-tools.el ends here
