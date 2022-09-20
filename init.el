;;; init.el --- Load the full configuration -*- lexical-binding: t -*-;;; Commentary:;;; Code:;; load path(let ((dir (locate-user-emacs-file "lisp")))  (add-to-list 'load-path (file-name-as-directory dir))  (add-to-list 'load-path (file-name-as-directory (expand-file-name "lang" dir))))(setq custom-file (locate-user-emacs-file "custom.el"))(prefer-coding-system 'utf-8)(set-default-coding-systems 'utf-8)(set-terminal-coding-system 'utf-8)(set-keyboard-coding-system 'utf-8)(setq default-buffer-file-coding-system 'utf-8);; 调整垃圾回收阈值(let ((normal-gc-cons-threshold (* 20 1024 1024))      (init-gc-cons-threshold (* 128 1024 1024)))  (setq gc-cons-threshold init-gc-cons-threshold)  (add-hook 'emacs-startup-hook            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))));; 导入各部分配置(require 'init-packages)(require 'init-basic)(require 'init-completion)(require 'init-tools)(require 'init-ui)(require 'init-keybindings)(require 'init-hydra)(require 'init-window)(require 'init-edit)(require 'init-dev)(require 'init-lsp)(when (file-exists-p custom-file)  (load custom-file));; 待处理配置(setq org-hide-emphasis-markers t)(use-package org-appear)(add-hook 'org-mode-hook 'org-appear-mode)(setq org-appear-autolinks t)(setq org-appear-autoemphasis t)(provide 'init);;; init.el ends here