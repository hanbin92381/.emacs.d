;;; init-python.el --- Python -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :custom
  (python-indent-guess-indent-offset-verbose nil))

(use-package pyvenv
  :config
  (setenv "WORKON_HOME" "d:/miniconda3/envs")
  (setq python-shell-interpreter "python3")
  (pyvenv-mode t))

(use-package lsp-pyright
  :config
  :hook
  (python-mode . (lambda ()
		  (require 'lsp-pyright)
		  (lsp-deferred))))

(provide 'init-python)
;;; init-python.el ends here
