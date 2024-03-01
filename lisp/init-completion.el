;; init-company.el --- Initialize completion configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(setq tab-always-indent 'complete)

;; company
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (setq company-show-quick-access t)
  (setq company-tooltip-align-annotations t)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))

;; vertico
(use-package vertico
  :hook ((after-init . vertico-mode)
	 (minibuffer-setup . vertico-repeat-save))
  :config
  (setq vertico-cycle t))

;; orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  ;; `partial-completion' allows you to use wildcards for file completion
  ;; and partial paths, e.g., /u/s/l for /usr/share/local.
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; marginalia
(use-package marginalia
  :hook (after-init . marginalia-mode))
  
;; embark
 (use-package embark
   :init
   ;; Optionally replace the key help with a completing-read interface
   (setq prefix-help-command #'embark-prefix-help-command)
   :config
   ;; Hide the mode line of the Embark live/completions buffers
   (add-to-list 'display-buffer-alist
                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                  nil
                  (window-parameters (mode-line-format . none))))
   :bind (("C-." . embark-act)         ;; pick some comfortable binding
	  ("C-;" . embark-dwim)        ;; good alternative: M-.
	  ("C-h B" . embark-bindings))) ;; alternative for `describe-bindings'

;; Powerful search and navigation
(use-package consult
  :bind (([remap Info-search]            . consult-info)
	 ([remap isearch-forward]        . consult-line)
	 ([remap switch-to-buffer]       . consult-buffer)
	 ([remap imenu]                  . consult-imenu)
         ([remap goto-line]              . consult-goto-line)
	 ([remap recentf-open-files]     . consult-recent-file)
         ([remap bookmark-jump]          . consult-bookmark)
         ([remap repeat-complex-command] . consult-complex-command)
         ([remap jump-to-register]       . consult-register-load)
         ([remap point-to-register]      . consult-register-store)

	 ("C-c r" . consult-ripgrep))
  )

;; Consult users will also want the embark-consult package
(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


(provide 'init-completion)

;;; init-completion.el ends here
