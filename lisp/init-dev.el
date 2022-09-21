;;; init-dev.el --- Programming development -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(require 'init-const)

;; Project management
(use-package projectile
  :hook (after-init . projectile-mode)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map))
  :config
  ;; Faster searching on Windows
  (when sys/win32p
    (when (or (executable-find "fd") (executable-find "rg"))
      (setq projectile-indexing-method 'alien
	    projectile-enable-caching nil))
    
    ;; HACK: too slow while getting submodule files on Windows
    (setq projectile-git-submodule-command nil))
  :custom
  (projectile-use-git-grep t)
  (projectile-kill-buffers-filter 'kill-only-files)
  ;; Ignore uninteresting files. It has no effect when using alien mode.
  (projectile-globally-ignored-files '("TAGS" "tags" ".DS_Store"))
  (projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o" ".swp" ".so" ".a")))

;; Tree layout file explorer
(use-package treemacs
  :defer t
  :config
  (treemacs-tag-follow-mode)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

(use-package treemacs-projectile
  :after (treemacs projectile))

;; Git
(use-package magit)

;; flycheck(windows支持不佳)
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

;; Debug tools
;; (use-package dap-mode
;;   :after hydra lsp-mode)

;; (require 'init-elisp)
;; (require 'init-cpp)
;; (require 'init-rust)
(require 'init-python)
;; (require 'init-sh)

(provide 'init-dev)

;;; init-dev.el ends here

