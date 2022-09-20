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

;; flycheck(windows支持不佳)
(use-package flycheck
  :hook (prog-mode . flycheck-mode))


;; (require 'init-elisp)
;; (require 'init-cpp)
;; (require 'init-rust)
(require 'init-python)
;; (require 'init-sh)

(provide 'init-dev)

;;; init-dev.el ends here

