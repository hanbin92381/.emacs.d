;; init-company.el --- Initialize completion configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(setq tab-always-indent 'complete)

;; company
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))

;; vertico
(use-package vertico
  :hook ((after-init . vertico-mode)
	 (minibuffer-setup . vertico-repeat-save)))

(use-package orderless
  :config
  (setq completion-styles '(orderless)))

;; marginalia
(use-package marginalia
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))

(package-install 'consult)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-s i") 'consult-imenu)
(global-set-key (kbd "C-x b") 'consult-buffer)
;; 使用ripgrep来进行搜索
;; consult-ripgrep

;; embark
;; (use-package embark
;;   :ensure t
;;   :init
;;   ;; Optionally replace the key help with a completing-read interface
;;   (setq prefix-help-command #'embark-prefix-help-command)
;;   :config
;;   ;; Hide the mode line of the Embark live/completions buffers
;;   (add-to-list 'display-buffer-alist
;;                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;;                  nil
;;                  (window-parameters (mode-line-format . none))))
;;   :bind
;;   (("C-." . embark-act)         ;; pick some comfortable binding
;;    ("C-;" . embark-dwim)        ;; good alternative: M-.
;;    ("C-h B" . embark-bindings))) ;; alternative for `describe-bindings'

;; everything configure


(provide 'init-completion)

;;; init-completion.el ends here
