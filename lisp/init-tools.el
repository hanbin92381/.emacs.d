;;; init-tools.el --- We all like productive tools -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;; Tips for next keystroke
(use-package which-key
  :ensure t
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

;; Jump to arbitrary positions
(use-package avy
  :ensure t
  :hook (after-init . avy-setup-default)
  :bind
  ("C-c j" . avy-goto-char-timer)
  ("C-c k" . avy-goto-char-in-line)
  ("C-c l" . avy-goto-line))

;; modeline上显示所有的按键和执行的命令
(use-package keycast
    :ensure t)
(add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode t)

;; Convenient C-a and C-e
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

;; Rime in Emacs
;; (use-package rime
;;   :custom
;;   (default-input-method "rime"))

(provide 'init-tools)

;;; init-tools.el ends here
