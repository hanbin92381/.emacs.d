;;; init-tools.el --- We all like productive tools -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; restart-emacs
(use-package restart-emacs)

;; Tips for next keystroke
(use-package which-key
  :hook (after-init . which-key-mode)
  :config
  (which-key-add-key-based-replacements
    "C-c !" "flycheck"
    "C-x a" "abbrev"
    "C-x n" "narrow"
    "C-x t" "tab")
  :custom
  (which-key-idle-delay 0.5)
  (which-key-add-column-padding 1))

;; modeline上显示所有的按键和执行的命令
(use-package keycast)
(add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode t)


(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :init
  (setq exec-path-from-shell-arguments nil)
  (exec-path-from-shell-initialize))

;; Rime in Emacs
;; (use-package rime
;;   :custom
;;   (default-input-method "rime"))

;; Test starup time
;; (use-package benchmark-init
;;   :init (benchmark-init/activate)
;;   :hook (after-init . benchmark-init/deactivate))

(provide 'init-tools)

;;; init-tools.el ends here
